Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13F64B203A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 09:31:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270211.464424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIRKz-0008EI-Ns; Fri, 11 Feb 2022 08:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270211.464424; Fri, 11 Feb 2022 08:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIRKz-0008BX-K2; Fri, 11 Feb 2022 08:31:29 +0000
Received: by outflank-mailman (input) for mailman id 270211;
 Fri, 11 Feb 2022 08:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9nq0=S2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nIRKy-0008BR-TB
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 08:31:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00a1c9bb-8b15-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 09:31:28 +0100 (CET)
Received: from DU2PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:10:3b::13)
 by AM8PR08MB6369.eurprd08.prod.outlook.com (2603:10a6:20b:354::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 08:31:24 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::9e) by DU2PR04CA0008.outlook.office365.com
 (2603:10a6:10:3b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15 via Frontend
 Transport; Fri, 11 Feb 2022 08:31:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 08:31:24 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Fri, 11 Feb 2022 08:31:24 +0000
Received: from 08d1fddbc887.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16011179-B952-429D-A708-92DC074269EF.1; 
 Fri, 11 Feb 2022 08:31:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 08d1fddbc887.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Feb 2022 08:31:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0802MB2562.eurprd08.prod.outlook.com (2603:10a6:203:a1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Fri, 11 Feb
 2022 08:31:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%4]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 08:31:16 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 00a1c9bb-8b15-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmSgnt8LcDWe+DqzF3SmTmB0YXY947EaLgrHv9CCljs=;
 b=hM/wUwhcTiaOOsk2kdqsh4nnpbMM7jcU9qGDnuVq4QmDg2AzO2Sz2m0XVr7oMTIlj34tfH1LFwoCQr37VE3+olqcMBI52Oa/fibFOE6Bs6Mgsxi/vC8MWVCxtfZPqPPBei6Ue7w97gkN9Neo9PqIsXCG7SVN4IDJTesXXvLLugU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53ea50f208976187
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAqBIBP68NA11wQgcMVBwB4wF0niOfEWlJAYcJDjuXeslEhvS5eDVx923apLiKJ1uZCUe2HGkMTEufRKy11qcA18LWyvj7PZrI3l/Th3nKFdK4i8pl/JJ1yJcCtHQ0qc5+0kGZLm7exuJRBpOkB0UojS7HnGaIUSG6aUvETwib0GE4nYlNIQJz7Kj5GWMRKw2CLnZ+leu+xLx2JGjbgDBGN03cZ60ingmqlADlZ/u2GyXYAyYSf++Hj+XuLcPzMOvxAbpjal6gUTulxfwyhIae8GWkY/duPSyAXC0jtE9CELrlfzQarspLudPwpFMN9zGqS8HEbINgaallRyWGZJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmSgnt8LcDWe+DqzF3SmTmB0YXY947EaLgrHv9CCljs=;
 b=deqrWcoHtdiYjCmIG8RBiKqjXt1fvaHWAyA6py9mbitF//6pw57QxFy/or+9+By+CWXsfOOyNTLry/+IlsPublN/Pgsejny29PTKo/vpH1tI0SaTZsTE4aouDLIvl9pBPv3QnB713z2kHYj7Y06e+GSVzDikU5W5gpCUjMC9VaFM9EvpMOONKhtmFa/qy3O5i79TyjX5SDxRKhKuPOX3+giMl85WqThFefVD3ConACV+WIJGFGtV/cC81Dm+hm96uYmQekBMg69I7zPg9Sk5g+G52y3UgQIFUKQ5VpnPUpVrD8QjXSZbPswSgmtV7kMb/ptToEgE2s296kX5bAoq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmSgnt8LcDWe+DqzF3SmTmB0YXY947EaLgrHv9CCljs=;
 b=hM/wUwhcTiaOOsk2kdqsh4nnpbMM7jcU9qGDnuVq4QmDg2AzO2Sz2m0XVr7oMTIlj34tfH1LFwoCQr37VE3+olqcMBI52Oa/fibFOE6Bs6Mgsxi/vC8MWVCxtfZPqPPBei6Ue7w97gkN9Neo9PqIsXCG7SVN4IDJTesXXvLLugU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] MAINTAINERS: make Bertrand ARM maintainer
Thread-Topic: [PATCH] MAINTAINERS: make Bertrand ARM maintainer
Thread-Index: AQHYHrGorW8uOCkvJkWS+UW+UYW3L6yOA4GAgAACkIA=
Date: Fri, 11 Feb 2022 08:31:16 +0000
Message-ID: <62B74E6A-3EF0-454B-8B05-5D6AC30322AE@arm.com>
References:
 <alpine.DEB.2.22.394.2202101026360.2091381@ubuntu-linux-20-04-desktop>
 <6847D807-EDF0-43C4-B09B-C79EFE99639F@arm.com>
In-Reply-To: <6847D807-EDF0-43C4-B09B-C79EFE99639F@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 03b4b83a-dd38-43d8-d75c-08d9ed38e381
x-ms-traffictypediagnostic:
	AM5PR0802MB2562:EE_|DB5EUR03FT003:EE_|AM8PR08MB6369:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB63697533DEE57F58E1387E589D309@AM8PR08MB6369.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:549;OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 I+uoOkxb6MN1igsxkIYaDCqco56A4em/hjv2T6xWDxO1Y06jF/no32ABTH6qWSlXCq72Jc13OLyFrO0H7VlSDei6TwKg56EtbxFQFNc33WRKvsLRzwCYxdvJeqogkXEl7gjBpQ2nxuxS4nh43WfHKbR8yBVRFrNX1xNUX1qCumzdlrassWzbfDbPxKl8/7eNcQPDEnYT5/38rwG4vn0jydPQDCngQ0aNng4S26iFWoYzoRKf3iUo8cL2H48vbLDCkhlo9eDPwYm3dWsYq1/cP2xRD0FR8JfiqSL9hgFJ23Xyv9qbB8h8N6xTxVRQ0vdFI0sPMfOxyyzltn2KJwfTtDYa/sgaGvBdzmHLqoGcVV+Xp/B25pC9bPjxNNpNoYz91b9CQCxUoadCjkL1JaimNNshvsdaAkCl3iEfmo4GCEzRaJtkzd6hd568QnO2RQCxZkmfLKJpg3SikZ0YotmklE+WxSLKdL93TWZFP6PouZww4dU0W3NgT54tdNQaUYbI1RJP58afb1ZLtKuVET79kD/fXZzE9BnfKjLkAALHO0zTlQMiETCzL/JBEUnHrzPqkp+oc0wp29KAGXVKIoAoif/02oxjormyz4xllBFH1q6HSQZ3X7mHqe39YE3PrUP/tcn0p6uz+IgGAy1hhf72Yx8mmY+5e2OhZ7MFO9Rtk8fawMj5W4baDaRtGmzVOmvEoZvYS5hoS4R/COqBECicpPUUbrZmXmljL23cj+bEZHo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2616005)(186003)(26005)(508600001)(53546011)(6512007)(6506007)(54906003)(4744005)(6486002)(66556008)(71200400001)(316002)(122000001)(38070700005)(91956017)(33656002)(86362001)(66476007)(76116006)(66946007)(5660300002)(6916009)(2906002)(8936002)(66446008)(38100700002)(4326008)(8676002)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9A96C60F602F9E44A6F6AC8BED63AB08@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2562
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	823eafb0-3ec2-45cc-6068-08d9ed38decf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sseUungji8S8AR7o8yiU/KVCq7/z5fRzl58QQNHcIOvyoBUWkZhd2gTQl0v7aPdSmh1iIf6IIgdTVis9s3QDuxoUb/Q1G8bTIwXUGiJfYiy0lM8Fx35R5Cs6+Vl6HDgwFChtYzttZ0+dUdH+wl14PHLe7TcKkGDs6ta5+FfnGy7vKuBQk+r8E+wIS24Jn0YRam0laGJqMiLncips+GxTbmNAfqC6bKSC/gypPHkDrY1XX/YYQ77YH6dVzvyymtMj2IvqCEpoSBk42fCs0dUBpWpxUznBRWPl21z3YxaUTunG9VL7cYbLxgzenLQDwAdJRamUNj3zbrBPS9LccIux3XYo+usWHymv2SNQttp58kUf1JjkQnJYeN+LbIDWB5a9SvHIoP1SArWDevNiHdKDD+m14hmomQKlGrPa5ebcLk2tJypRc7bdcdKdqOIWP8nk5PT6Ydsuk2TjgmPQvBJS4WqjzsCmRUc8FomvtPgsccrRCXvt9BxPqZgf59D5G/yswyyVLF4FpnlSLffp2/Z3ibLI/jBDC4CF5nGPBDhM+1Wd2xL2SrEuX5oM65DRfnK/oN4ZZGnjbQ3vBd28EI5LurST4CFEi6kb/ATYLiV4Ws2ZvN8LkcYqc9pbvVnt2glViXLdT0qy/MSiHBOjryN6ES2rSR4XsKmD07uC30lyk/ttMR1gDBd8bdEDgdFDz4I/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(5660300002)(6486002)(53546011)(508600001)(186003)(336012)(26005)(107886003)(70206006)(33656002)(36860700001)(2616005)(4326008)(6862004)(40460700003)(2906002)(8676002)(70586007)(36756003)(81166007)(47076005)(54906003)(316002)(82310400004)(6512007)(356005)(8936002)(86362001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 08:31:24.0524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b4b83a-dd38-43d8-d75c-08d9ed38e381
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6369

Hi,


> On 11 Feb 2022, at 08:22, Bertrand Marquis <bertrand.marquis@arm.com> wro=
te:
>=20
> Hi Stefano,
>=20
> Thanks a lot :-)
>=20
>> On 10 Feb 2022, at 19:08, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>=20
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>


Fixing typo introduced by spell checker:

>=20
> Asked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by : Bertrand Marquis <bertrand.marquis@arm.com>

Bertrand

>=20
> Cheers
> Bertrand
>=20
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 64934cc070..d41572128b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -230,8 +230,8 @@ F:	tools/libs/ctrl/xc_arinc653.c
>> ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
>> M:	Stefano Stabellini <sstabellini@kernel.org>
>> M:	Julien Grall <julien@xen.org>
>> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
>> R:	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> -R:	Bertrand Marquis <bertrand.marquis@arm.com>
>> S:	Supported
>> L:	xen-devel@lists.xenproject.org
>> F:	docs/misc/arm/
>=20
>=20


