Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035CF4460BD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 09:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222207.384285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miuhU-0001vm-Vn; Fri, 05 Nov 2021 08:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222207.384285; Fri, 05 Nov 2021 08:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miuhU-0001sn-SP; Fri, 05 Nov 2021 08:35:52 +0000
Received: by outflank-mailman (input) for mailman id 222207;
 Fri, 05 Nov 2021 08:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQ27=PY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1miuhT-0001sh-4A
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 08:35:51 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe09::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6050ccb2-3e13-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 09:35:49 +0100 (CET)
Received: from DU2PR04CA0189.eurprd04.prod.outlook.com (2603:10a6:10:28d::14)
 by AM8PR08MB5587.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 08:35:46 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::57) by DU2PR04CA0189.outlook.office365.com
 (2603:10a6:10:28d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Fri, 5 Nov 2021 08:35:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 5 Nov 2021 08:35:46 +0000
Received: ("Tessian outbound e7ce0d853b63:v108");
 Fri, 05 Nov 2021 08:35:46 +0000
Received: from 69b117715896.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 925DAAA3-B598-45D4-8693-62A5955D5BF3.1; 
 Fri, 05 Nov 2021 08:35:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 69b117715896.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Nov 2021 08:35:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4900.eurprd08.prod.outlook.com (2603:10a6:20b:cc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 08:35:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4649.023; Fri, 5 Nov 2021
 08:35:36 +0000
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
X-Inumbo-ID: 6050ccb2-3e13-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUaJlqk60YkRIp6Y0mBmrcjnA8Te8bnQDYSxJU9iyGU=;
 b=jNRaVrcwKncL72v9/u4JD2kRctgNuBXmtm6y7KPiW4wj8GMlsEc7oPPzPfaQG5m/U18hmIlzpT60mg5szPOvl9yo/tMYQdef+mn3MIAfMsKOnZZRqxvNdbujHdA6kx98GcZY9ZQSvO6/ri9HVXwWKwbG5zMRp+XOqEbGQ9/QGVU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32e54b1b3dad7c3d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik4236GJMmLycz1/QX50heDEKr94UV0gByB7i6C6kntuWRVVfX3fe5UQ6xbkSmF9urp3qr1B086JxqcPL8izm4HZmhuYLiNZZKme49hRSnf18dYLuuiahHaDdQmE6Z9B1kD2gF9FOnc+832o73LcOBl9fnN4Zj2eyXsdDfY4sldoWuk5BB7FNV3phqj6P+nFXoHb6H7aWqQ0hAiff+cNcrK13Ieqcvv6eiCl3t3KId/bPn0i/xP4b6iX1VB6il4DuG9AN2X3sRH6GFDiZ/Xrr2T5Boj0GY3E9Aork9VX180grOtWhTWy0wtGsLwS4H/xGR+72blvY7PPNPMxksbw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUaJlqk60YkRIp6Y0mBmrcjnA8Te8bnQDYSxJU9iyGU=;
 b=isRPOjbHK1Y28LIe/iitXM49wJl+ZE3Az3ImMZyQz3epMpd58R3Lmwto8wggUvn3nXN2z7F8swFxDf7ipoSXl4nbAPk26kxPbd9l8OhSHNyzYjXT2z1Cdj+DftNWHFy7mh37kTlSyJqzRaRp4JakrxRlLFJw9N4DePHcl1/bHXT75FJP3CGN6JhJhRTDE64F/+k/+cRHOeOqnbw6LE3SELIHPYEF69dMB0J5bKfTOLv+JjJKtbuHCaDpeRsIJ/7v3Op33gOw6NfB24fhm3nI2y2YMA8RGf70iiJFfreWudMc6pjzSacvgF6s19/hDPJX+N9wAILdKk8MYiO/ET6GLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUaJlqk60YkRIp6Y0mBmrcjnA8Te8bnQDYSxJU9iyGU=;
 b=jNRaVrcwKncL72v9/u4JD2kRctgNuBXmtm6y7KPiW4wj8GMlsEc7oPPzPfaQG5m/U18hmIlzpT60mg5szPOvl9yo/tMYQdef+mn3MIAfMsKOnZZRqxvNdbujHdA6kx98GcZY9ZQSvO6/ri9HVXwWKwbG5zMRp+XOqEbGQ9/QGVU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] MAINTAINERS: add Bertrand to the ARM reviewers
Thread-Topic: [PATCH] MAINTAINERS: add Bertrand to the ARM reviewers
Thread-Index: AQHX0b8Z5UpGAFt+x06A4NMH1xlmkKvz+86AgACg6IA=
Date: Fri, 5 Nov 2021 08:35:35 +0000
Message-ID: <F999B8F3-0EB5-4D25-9125-BD2BE85B8C8F@arm.com>
References:
 <alpine.DEB.2.22.394.2111041357580.284830@ubuntu-linux-20-04-desktop>
 <9f3208df-f3a8-e5ed-ee30-aed152d32ad5@xen.org>
In-Reply-To: <9f3208df-f3a8-e5ed-ee30-aed152d32ad5@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: be0c96bd-ae24-4fdf-70ce-08d9a037436d
x-ms-traffictypediagnostic: AM6PR08MB4900:|AM8PR08MB5587:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB55875AEF3BC4EE6159C723529D8E9@AM8PR08MB5587.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PDSd++X0Rd7yWxZUVDls4pq/neVwoUR95q8CNALzIOEtuh/ehLKwUJk0C0Bi/LGAFsnE2P1I0RtEBrXUxDZkToBpSXvIT8H2CwFFwsCpWevgVWTZFvzsjsnxgZ3Kv/Wcpg2QhUUWcu7sSbVZJNneguRoNrLTsQoyzQ1cxxJhXlSEyb0+TKpOBkn106TfDYoRpkiKWA5iSs84GA2jBODJYRtgf4n7zia2Nt8m6yhE5TyD8Pl7xJRfRlIPytPBfQtlDFC/iqfG123deQQogDdbW9OP9okokFk90EzW6PBrmg+XRJQm+B889qaB+ddbFngQ2F7j0ZLrZmFsEWznfQdtAXcqSYzUxL+kXXCGQBc+7AWjh7D2fY8YYM2kiqrgUAf9zHT8/BhecfkzLKwNXDAcjqN4i3MuqG+rNOUsWNGDpdItneGI46hDx/CspjWh6nwg1erXQN1feXA4x5TS1fsamJ1SlYagxRfUl4hlH1TWTM5EvMgznr+Z2HCdd8NkMyljdNMbF+1dWFjOxuGYXTati634CfAPluCA/PoaD2/QDR5NjKpS2J73/Sgmr9qNo9nc0mF4xHgJKwZ3m2oXWZz8JgqHg15w4sjjdSblvXCP5zaKOGdZ51uUE8MznCqxhkf1rqvc043342PeSrvLfInGbI2lBrPez1hHKmn5YZ1XIJw8M0bku/veXdcp6rjr/VpfG6iE97r+bSjFJ3l/sq6cz3AkSuAGuefG+WoeDsu2PKoqJgU77bkvj7mg7k1eFIXI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(186003)(6486002)(64756008)(6916009)(8676002)(83380400001)(8936002)(26005)(2906002)(6506007)(2616005)(71200400001)(38070700005)(5660300002)(86362001)(54906003)(33656002)(6512007)(508600001)(122000001)(316002)(38100700002)(91956017)(66446008)(36756003)(66556008)(66476007)(53546011)(66946007)(4744005)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F82EBC2D2F9B5A43A9C1F4F434685956@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4900
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3b87b23-c375-4a4b-0e77-08d9a0373d83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1EZCTx/rcJAtnBNtyg+OCxOB60gB6nmzaNn2nbr3pNpUsoBdjcW1xAqq3cNu5xvZgROQhJ/qgI/9ldjRp0l9TxUMopn594jvK62UdQqXqaYy4mcwP1J2s3rCLZYcI9nt1v2R6u9OM9dnLKh4ra/vZJRd8atKiWFjHwn7cYpIznTD3/cxq78G9sSuIJ3p3o1j7cL/Rd4FGAL5RBzW9TkqcG65pwc0zA+kP1wGvFxkkmKbvJ+XWD6AYiKVXc69r2H5TghPtyULPIOBvkxImT8K6a7kt8aRQq7ZKqQutqfB2LpATPFB02yEKIPVhtBSvNHEWwnOaXb3ujbH+rPD/K+RLidu709kOKKBMlRIBhlWx8VsUa5xrpMTjDtCwW4+jpT6QDVjCG8m4GXYXnpGXEKKDpRnj14A1Z0v3OVFnOsqvfD26VVYY4vmNkTc3YmXwWRzwtGT3dQvYHKfgmFwzZBdANqZ4I8vHUP2xEn93ug/R+vy22iuIM25HCVub5jpq9vNotOULx7npMa+ZUDauQNQ4jk5IVoYjVvFu461HCAeZ9igiX8iV/sBMM1cxDAtYqEFbAOIVopofWOel/7jfzURWUIfcMningzUpsmCYYi2PaJkjQJ3nZFtdAqYbbc7Nzdddm4piC3JnydlNxCqraHJKvj7xnsYwE1riW3QEDWTo0RqonEECfQ+oWwTFX1ElrN5RRd1+PnoOoUYMVIMVJfk1w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(107886003)(53546011)(81166007)(47076005)(4326008)(356005)(36756003)(83380400001)(5660300002)(4744005)(33656002)(70586007)(70206006)(508600001)(2906002)(6862004)(6486002)(36860700001)(8936002)(8676002)(336012)(86362001)(2616005)(6512007)(54906003)(82310400003)(186003)(26005)(6506007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 08:35:46.4447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be0c96bd-ae24-4fdf-70ce-08d9a037436d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5587

Hi Julien,

> On 4 Nov 2021, at 22:59, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stefano,
>=20
> On 04/11/2021 21:00, Stefano Stabellini wrote:
>> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> I am not sure where the Acked-by is coming from. Can Bertrand confirm on =
the ML that the is happy to be a reviewer?

I can confirm I am happy to be a reviewer :-)

So I can say:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

>=20
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> There is a missing signed-off-by on the patch.
>=20
> I am happy with the proposal, although I will wait for the two remarks to=
 be resolved before giving my acked-by.

Then it might be easier to give my ack by on the v2 signed off by Stefano.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


