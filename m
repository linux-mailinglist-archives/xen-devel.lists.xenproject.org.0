Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C8A747D09
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 08:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558799.873208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGvyH-0002O2-5G; Wed, 05 Jul 2023 06:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558799.873208; Wed, 05 Jul 2023 06:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGvyH-0002LS-28; Wed, 05 Jul 2023 06:26:37 +0000
Received: by outflank-mailman (input) for mailman id 558799;
 Wed, 05 Jul 2023 06:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUcB=CX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qGvyF-0002LM-JP
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 06:26:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1e2a3ac-1afc-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 08:26:32 +0200 (CEST)
Received: from AM6PR10CA0036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::49)
 by DBAPR08MB5814.eurprd08.prod.outlook.com (2603:10a6:10:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 06:26:29 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::3d) by AM6PR10CA0036.outlook.office365.com
 (2603:10a6:209:89::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 06:26:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.22 via Frontend Transport; Wed, 5 Jul 2023 06:26:27 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Wed, 05 Jul 2023 06:26:27 +0000
Received: from 9360983e0b9a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EFC8AFB4-6883-4B71-A135-F1E4F4D88581.1; 
 Wed, 05 Jul 2023 06:26:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9360983e0b9a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 06:26:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAVPR08MB9628.eurprd08.prod.outlook.com (2603:10a6:102:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 06:26:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 06:26:15 +0000
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
X-Inumbo-ID: e1e2a3ac-1afc-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvBBDYnk7AdcK+fQoBH03oejcpKFeolnTm34igi6Iyw=;
 b=imwZ4H3kPOlnsWzLlpQY8eN/hPEV/lbbRimcIdR46d/e8R+n1/WvjlJxE+rmeDepWHZfEgZqrhi+aw3UYqvC0GFaysU0QyHgfgd2Rn+JEJluxFHWyJKPCaDIaedXs7RcwGQSJBYSuYsWSZyzIAzGxWH2nwLnAxEaqMa7n5LTJks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d5c49eec29cb142
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cal+RpHZUlbkzT3kovTFueXm/CgSIOotho+Qfoyku15KwiiHZ5mvXXQyGOwoxQaOb21wIKNRRFKbsQm7uYu+jiPWx6+PgTIvQ4SZzlQvkkM19Et9LFj1wWwDQNp2g0MxVz1TQWHuGSce/Cl/BdnkB4L3I34oTm5PEvi1CQavr4HW2BLi1OD9lhGhkL4Le+DzxK9OrOFushWsfkOjcncMw5dGmQ+zY/Ftz7eKqe5lZG2M0ej5sjG4KS2/RJS04JVGSsXU3yYqjHSs1pIgpM2wbC0/5riARxG9ifhf/dwWAVF2dZdTPJfTRW6Y30IRjmk+9czoa3Tq6jnd7bfmCJokrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvBBDYnk7AdcK+fQoBH03oejcpKFeolnTm34igi6Iyw=;
 b=HQGWcGnar4O/KowZASvO05Le2he2sfoAnlt3jJJplsS+cZ6RmbySuPiNc+jAz/ximHJGm2HqYzQuYHmbiQ6zHQnaOL5sAXa5daomfI5KygNP5V6DeRMPYWKa988+ynGoUB3DNb7pqxbOuwSKYc80szNOoY82sOizWNURwE8TVaFhkUYDqfu/D2wlsDZNn3jVe9O2ffg97odKWYPXTqYceDZy3UBNtwjbHJTwLKrq3pEtJ0hhxCrgThWO6PYd/l5cVS8Bos9WmjQeARhluEeEx6lksvcWHfGhsD9lZjdcfXeOxT8Cm0KEq1X3CywVngIKzLO/TjAgDi1CRv57+/h3Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvBBDYnk7AdcK+fQoBH03oejcpKFeolnTm34igi6Iyw=;
 b=imwZ4H3kPOlnsWzLlpQY8eN/hPEV/lbbRimcIdR46d/e8R+n1/WvjlJxE+rmeDepWHZfEgZqrhi+aw3UYqvC0GFaysU0QyHgfgd2Rn+JEJluxFHWyJKPCaDIaedXs7RcwGQSJBYSuYsWSZyzIAzGxWH2nwLnAxEaqMa7n5LTJks=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/2] tools: Fix ifdef for aarch64 that should include also
 arm
Thread-Topic: [PATCH 1/2] tools: Fix ifdef for aarch64 that should include
 also arm
Thread-Index: AQHZmhGAbKd3CRm5gUS5RUtvHum0Za+pg22AgACfM4CAALxdgA==
Date: Wed, 5 Jul 2023 06:26:12 +0000
Message-ID: <C1445DE0-9E12-4FDA-BF75-BB8F16242D3C@arm.com>
References: <20230608135913.560413-1-luca.fancellu@arm.com>
 <66c3d183-460d-4f34-a331-01ac4d65fc9d@perard>
 <a2df163a-ac61-e53b-25dd-fcd33703adf2@xen.org>
In-Reply-To: <a2df163a-ac61-e53b-25dd-fcd33703adf2@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAVPR08MB9628:EE_|AM7EUR03FT046:EE_|DBAPR08MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: fd06fbac-f641-4268-dce2-08db7d20c3c7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jTu8rZ3atNTjoLWU+mMH7CqSCTY04GXXt4cl+monxt1SOAoVjBw5mOfVKRz4CJWza/PP8eaN9gi5PuE5CpUiQ+o0LJoqU+tahxbxauA3pGaTEtpw6e6j3BiIDarXosHwY3oVLVSWk3VpXBGN3Jm/yUzrcS2CvPt8B2m7YlRkHrERW2tS/FQRFNYgaUo9Q0TibNhe0V7x0C9iGzIl2rJr8NbHHfbdnpybRKxMhmzUX4re1b3KEMmBl5B1qNrs6Sx92O0nu8+l12Lul4Ev/Eb3ysImEr6ZAAlGM2LI0Azqg9s4WvokYoQGIAPtcRraR1NiDFWG/c4c8zpDEq2BRy0s+WgQMkyVwiLIEAUgV6XWsxvjnwnxX8Dud+iohc4m/R+wB1Q3ez06A9uyBoalbL7rZOJcviqasZHl0WJjylbyUUc1XQ6eZi6uXP2qJRnX42RddXxaxhV/K9M8MeVV/SM9K1ljHGTgtd5+reGDH34IKUBaHGkcdehqfuViD+90uXJMV0yyv2EdKhqOcENHS1cqbgSzqOhkrSl0KQ7yBNgNxiwtd6tarAzsCzmP1/O+foIX/SoEAjoR600/mDTrStSeYwnbP2zH0lTeMxuEErfdec+BzaHEuGPW7gKv68cp+hra9j28iK1pYqUQEA9aitkbZg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(8676002)(2906002)(41300700001)(5660300002)(38070700005)(8936002)(33656002)(36756003)(86362001)(6512007)(6486002)(71200400001)(478600001)(6666004)(83380400001)(26005)(76116006)(186003)(53546011)(66476007)(2616005)(66446008)(54906003)(122000001)(91956017)(6506007)(4326008)(6916009)(66556008)(66946007)(64756008)(38100700002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A7A3209BE5D174408F8A3EDACA5A1E07@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9628
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ca4b8cf-4784-4e39-1898-08db7d20ba87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3XjpSWq3O0rTmebQPVB6Mc9bj1IYz3c1f7CtHhojM8Cy9h8Kn9rgQGPNLKnQGGI5avkrCqxPmCTcSg+XrKWzRqUYBPZri3M5zNfOdZgjr7naBNx5yuYT8W8qh+v5Mer68H7KnKqpb7YCQqvZ8Zns8KWvCQtIRcxuqcYKrS7w8QCBfCjnwGCjgrSh/Gr1VJOsfiFGuJdFTpiSfGGw45Oyg8sKa8L3pvCzrLI7FkBjghevjx8HxypXGWOtclnLj/vMZq9rG3yMdhA6BS5Dwi1XlcK8NeWIxn4V8awpK7ezlb7Ftns/WJOXkPxSPv4LHGV13VR1S1Vd/e8esPnH489BER1UTHJyh9JMtAzROt1P86Tsv+zwGXGu9jOxlS9geRIk/mMvvelq1roY2a0PV+cVGoHTRVezAO9CYFHR/ml259yKG6vNFoKi7q/yhLRaaNwoAxCBU54cXEqX0IXvYsGIbQPMC/gShrYpPDRSO0gocrn9nY+VQ2Lq37c88JBXhSR6UXNwUTmH+cHX4AcsFMLshMx3Wb01fxVGUyW8iOu9z9BqzH7zIEWm05D7/3sH+WFujyvYPR9coUYYKuVEqlbvQ1IM0ChqVgWpS+SvwDPASpSXKMNHrXtGVWOd5/3OjOtgf1hy82iiZgQwyF3U/1M/r9HP51ZYJOMARm4iYi80mECIvZe+B2BrAJFUmqR17bNN8CLn8S02PCPTRisHjY1LNpyQhhWQZvBrjzsnQwae9dIbWFa/PGnLp3sDemRjf+Mx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(2616005)(4326008)(70586007)(70206006)(81166007)(356005)(40480700001)(186003)(86362001)(33656002)(6486002)(6512007)(6666004)(54906003)(6506007)(26005)(478600001)(53546011)(107886003)(36756003)(82310400005)(40460700003)(36860700001)(6862004)(8676002)(8936002)(5660300002)(2906002)(47076005)(41300700001)(82740400003)(316002)(83380400001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 06:26:27.9669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd06fbac-f641-4268-dce2-08db7d20c3c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5814



> On 4 Jul 2023, at 20:11, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> Replying here because there is no cover letter (in the future please add =
one if you have more than two patches bundled together).

Sure I will

>=20
> On 04/07/2023 10:42, Anthony PERARD wrote:
>> On Thu, Jun 08, 2023 at 02:59:12PM +0100, Luca Fancellu wrote:
>>> Commit 56a7aaa16bfe introduced some SVE related code that is protected =
by
>>> '#if defined(__aarch64__)', the issue is that this doesn't take into
>>> consideration when the toolstack is compiled for an arm32 Dom0 running =
on
>>> an arm64 platform, it should be able to create SVE enabled guests but w=
ith
>>> the current code it's not.
>>>=20
>>> So fix the issue by compiling the code when the toolstack is compiled f=
or
>>> both arm32 and arm64.
>>>=20
>>> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling fo=
r Arm")
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>=20
> I have now committed the series.

Thank you

>=20
> Cheers,
>=20
> --=20
> Julien Grall


