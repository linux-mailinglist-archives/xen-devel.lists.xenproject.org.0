Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C95FEC8D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422685.668884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHvp-0003JL-QX; Fri, 14 Oct 2022 10:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422685.668884; Fri, 14 Oct 2022 10:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHvp-0003H1-MT; Fri, 14 Oct 2022 10:28:45 +0000
Received: by outflank-mailman (input) for mailman id 422685;
 Fri, 14 Oct 2022 10:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojHvo-0003Gv-Bp
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:28:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9a16cc3-4baa-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 12:28:42 +0200 (CEST)
Received: from AS8P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::25)
 by GV1PR08MB7874.eurprd08.prod.outlook.com (2603:10a6:150:5d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 14 Oct
 2022 10:28:35 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::28) by AS8P251CA0018.outlook.office365.com
 (2603:10a6:20b:2f2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Fri, 14 Oct 2022 10:28:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 14 Oct 2022 10:28:33 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 14 Oct 2022 10:28:33 +0000
Received: from d7ede52d05c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DAFE02A7-CCF5-4D6A-8F8E-B4E6E4E34E3F.1; 
 Fri, 14 Oct 2022 10:28:27 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7ede52d05c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 10:28:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8691.eurprd08.prod.outlook.com (2603:10a6:150:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 10:28:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 10:28:24 +0000
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
X-Inumbo-ID: f9a16cc3-4baa-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=co/ydTdkXnuD8lnFE6iNDk9jAJEJafQHtBr8psqk1Ot8+FEObHq8mNxEIAZwwevoBSZGuD/Y59+U1wj4V60qVxA4vnVFjRl4nyIitrq5WeJwG+H196StF5cpaAJKWXR26xi3rIt+sr9oRKfEBTiOBvI5amVEn2iPm5mi5V35H3uNoouwqcJ9eR4/GHjx3xKEqSwCpEONH5hJCvf8d8oMwnF6ZPmA8PR2qYFt48FNjtWWPqwXhm5avSaiCxjxrE/sHU5xPMzU6qPSQZf/atj0g2jntImt62amf62T1JzTI9+Ev++HEkjqkqYsPoxVy8Zfu9armvgoEL74soFEFtxVaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXFItBA4ng3GKzEsgRIez/mUlHcsivWZppKhdzPm/Dk=;
 b=QDS/PD3yL8EmOUjwyS0d7JLhHpOTie8CKc6UpXyFnLQAfgi42HwnmRAcyHURuqatjsW7noxEvITjkgKutoNMaV22IBTJwQL7AW55FIAREbQUQTQrJAJA/bzpGBuuka8C5UARj6AhIvT9dJreoORt2C7lmEzgfNXrmUDnjDHxJY25X8l9MjeynUoVSaaVSrsgUWJGalYtafEbbpyRJNDLXR+UtZgrzh8Kpwu1a0sOPvzFdVwH2LqkZhWPdPnJAgRYh0Bd2ve/qNlDd1Kt6/QHLw8Xw8SfmHR1nmJee4zA/1hwrg4YTR+w6Y9RVwJzLOgHlujA64hBv8JM+UFw48US0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXFItBA4ng3GKzEsgRIez/mUlHcsivWZppKhdzPm/Dk=;
 b=EFqyNKEIwhzjMAPOJwROSu07n2bHOhsCOFKeHA4TRy1dBuwHB6Ki4e99YIy+C0XbzeQ5vhsZLloJo6upFQJoJk4glCCJsBn/6fleGqDYGXcneOvNCv+gDfC8wP+XT5YpYElo17GD1Y6MvEmlkP5098otoKpcAeUkvDK4aFvl0W0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/1yXXIJCyt12+ZiA6nVSCtiHS3slou9zKfVvTaGFtFddjK9PH766VIy96wFsdNGtWbCSTCbUz3uCNtCbkB57JuXdpZfOkKJQeRjSnz9yUGjruFM+emml1pXaFQ9+nPC2imQkecdYraDisbNJQXgdJhQzGBNhfwV3VPTI4NV/uD7aO0FsYJ2oISRwptDIelLzwXVz4UdNgjfwLRbrYvx3La3ccIJUQL1+EgrHMmdC6Q0CutFE5u75ffGaT1sEwigzssgt/aXi/1L8wyIYbFRcpVuVn4lLaNHQrQB1zL6adI7HfTheo4tSeUriXZ+OAnzxYgemHQRCt0n2IzVwzmJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXFItBA4ng3GKzEsgRIez/mUlHcsivWZppKhdzPm/Dk=;
 b=biKiG3kAlagJaYInTdmslvnso1CLM2HGh137Cwz1XY6gwsL4/TcnzuerAI/myVOsix8g1Jt1JvSblE9AVdPms25LdhU0o7GlID3kJPGroSGNnDPb53DiUAIjXCpJZ9MeoOPPMLSNfSzsZaK0ZxeBvNdW4JKl2O9wmHcSAmVGVyI1g5LL2FlKH8G0DuS9SlopuC2QrV0OYC4nfwVZCtidEnPWimlHi+SXl3xv9m1L9eXs7jfYAxpTQi7tkh/oOJp0Y6HlFvug3kecivlY5RYtazPPETta4zW5k/VXNKzVZuKAkIv0DFCl1s3J/RZAwJzq4qHRXhKmsude/I0hPXBXfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXFItBA4ng3GKzEsgRIez/mUlHcsivWZppKhdzPm/Dk=;
 b=EFqyNKEIwhzjMAPOJwROSu07n2bHOhsCOFKeHA4TRy1dBuwHB6Ki4e99YIy+C0XbzeQ5vhsZLloJo6upFQJoJk4glCCJsBn/6fleGqDYGXcneOvNCv+gDfC8wP+XT5YpYElo17GD1Y6MvEmlkP5098otoKpcAeUkvDK4aFvl0W0=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [XEN PATCH for-4.17 v5 00/17] Toolstack build system improvement,
 toward non-recursive makefiles
Thread-Topic: [XEN PATCH for-4.17 v5 00/17] Toolstack build system
 improvement, toward non-recursive makefiles
Thread-Index: AQHY3wSf1tDccsob1U2UzC8OPggTyq4MneqAgADO4WCAAECRgIAAA4iA
Date: Fri, 14 Oct 2022 10:28:23 +0000
Message-ID:
 <AS8PR08MB7991AF5A4FCE5C063F854B6492249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <381f1ae6-d539-ad52-79da-e44e9dfd5066@citrix.com>
 <AS8PR08MB79916265D28F1533ECC538F992249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <Y0k2cQu8a3sHKSkf@perard.uk.xensource.com>
In-Reply-To: <Y0k2cQu8a3sHKSkf@perard.uk.xensource.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 60ECE8307B92304383F343A27633E081.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8691:EE_|VE1EUR03FT046:EE_|GV1PR08MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: af437635-f9cb-433c-43ad-08daadced8ac
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 U0TV7OwqIxPlsDZFs5lS5oXoyHGNkP0P5+9A5x+ATMU/dgz3U1J0jLk1kcaI3p2d7x2dAN7T3Q+S/I9pNablsCqd5pFZt79ynugOhFZ78ITbemcnuaP81+daOfIUMNejTbKcPUbrmEEJNnVOBmd1RyGkIvRDQhi9cC9D5vlaJIsiJHvI21UiSM3QyfumZcSFPDcf2xabCbUn3liRbgTTma7BI+RT+pAoOqVv3ShMeX92IUxMW8lHWQeXXxWhgVDNORu8wQnDSvWcfuiJB9oS6SCwcSjM23GP/5l+OIwmLCUMdoXmoKQf6M4cxJN6Nilyz4B2sCo7ZJ9TJEFXpKtOPUcnlZbl+4AMbKIT8OEqyGPksJDlF2FOHlA+F8eVAydZj+kmF1a2PX0p80FL73HGDv8baaHPABTkBrs5pG7Wk6qQv4IXcgcioGkoU4o4Cv3s7/HSwsjJwvjfoaq8bYnVt8+V+QPbXOvkAyUG+qqusn5/P+5oFxw1Ck6p5NQ992WVgUHqKruDI996AypvWwOqo0R0ekgD9OL6HnZdXTbgoJmG8c++vwgdnSgoDAcdybL1cQ0LJHX/5Sp8i1G+SfLQZ4R2dpQloLlDCfkU0d20Gtl+Dj7yPZe1qyC/dpa3U5P+9zPcQ3SZyOP+oRz6HfWmsem+CcPAaKFDG28pKaQliLWilLNxuTcrlDs/jMoNB2gpB4KyAHhdn1WRWvXF+HapRgOWtDYWIej8KImTv+4UzY7Yj4yAjkIXbR4mvHODeXXhprT51bKg1Fy59AosKx3GSWPTKljhLumLvMHqqpXz1QE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199015)(53546011)(26005)(66556008)(83380400001)(86362001)(6916009)(38100700002)(7696005)(4326008)(64756008)(66476007)(8676002)(66446008)(66946007)(6506007)(76116006)(2906002)(33656002)(9686003)(8936002)(5660300002)(55016003)(52536014)(41300700001)(316002)(186003)(71200400001)(478600001)(966005)(122000001)(54906003)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8691
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8928b0f0-fa98-4138-6a41-08daadced2e5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N2gj6rnQSCUv7n3FRVFyC4K/3UruWh9ZNOvmlKGo/0LTJu1sP4GfqK8IgVlD/pIW9XlVLD0lODm8ie/an8AEWiG2614MWRkyr54lKVB3gIvq9Ec/UDRvVTMY/mMMo2rpemXfFKuP12bJoSPwJ08KU8z8Cy5BHUW+Z6KlbspfggvZrWlzH30scNzDPoQ+ZPg/6IqyIQ7MGSHWuP7iJb37t9NYFKkTCxDS6WXR+7FOKofTUSAhSWw+Yz6Gq5wGyynUurzOpEKO4d2P080A9zyapCgbTJ+4NdwpGfD0yiDU/LNkP15EYwYdHDhNYGq8sjn4EntYgxMoyAXriKHvrl89Q9tOV9VSVKHAJi2K3YMnUMfWwbSlRJInBN5dwN3q+5gb9uTzIRw7fgYm8zouigUcPRUclzVnBh4r0YmZqKIuogi0wuV3AXL/ztA6bx2WubOfztqrIFNik5Q5fLUfr0wZjoZyB+tNLmhx8KcW2OZEHsfLhIqLjMe/Hh1OV4ztVe+lnRW0H4Hk4016RNqU6Tzf35u9sYqB7O6x969XzF+40z1nxT+dqH6qJnbqhhmaN2VVm3Xj85FTu8/v/vnaqBCf2jAzC7pw3lUgfe1vuWAA2uQd/dVuDxb4TjDMVbjGypMdMHAQ8LKx80g3Z8+ghdhAEF6CffyD5PoGeOEJc/NqEevQ/DfWPyfcPt87yLxuS+XPcR1w/kx5yzBk9aBF/UZDdyj3By+c1HdPwN8YCEAEniNWTmSbDy5Qfu9E84aqQCoK8SOIvEi7E4/9Wt8zjJSRfQVU5OpZ3/m1Pwp5+Ki4FdE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(9686003)(83380400001)(186003)(336012)(26005)(82310400005)(70206006)(2906002)(70586007)(86362001)(52536014)(4326008)(5660300002)(53546011)(7696005)(55016003)(356005)(966005)(6506007)(40480700001)(33656002)(316002)(478600001)(8676002)(47076005)(54906003)(41300700001)(6862004)(8936002)(82740400003)(81166007)(40460700003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:28:33.5132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af437635-f9cb-433c-43ad-08daadced8ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7874

Hi Anthony,

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Subject: Re: [XEN PATCH for-4.17 v5 00/17] Toolstack build system
> improvement, toward non-recursive makefiles
>=20
> On Fri, Oct 14, 2022 at 06:26:09AM +0000, Henry Wang wrote:
> > > -----Original Message-----
> > > From: Andrew Cooper <Andrew.Cooper3@citrix.com>
> > > Subject: Re: [XEN PATCH for-4.17 v5 00/17] Toolstack build system
> > > improvement, toward non-recursive makefiles
> > >
> > > On 13/10/2022 14:04, Anthony PERARD wrote:
> > > > Patch series available in this git branch:
> > > > https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git
> > > br.toolstack-build-system-v5
> > >
> > > I've done a full rebuild of this (with the 2 noted fixes) with Xapi, =
and
> > > it does resolve the Ocaml library linking issues.=EF=BF=BD Thanks.
> > >
> > > So T-by.=EF=BF=BD If an allowance for 4.17 appears, I can see about g=
etting some
> > > of the more obviously-trivial areas reviewed and committed.
> >
> > Release-acked-by: Henry Wang <Henry.Wang@arm.com>
>=20
> Thanks.

No problem, my pleasure.

>=20
> > Since this series is quite large and just out of curiosity, do we have =
a
> > pipeline or CI jobs to test all the modules that affected by the makefi=
le
> > touched by this series? Would be good to have some test results to
> > boost our confidence of committing the series.
>=20
> I did push my branch to Gitlab, and that the pipeline:
>     https://gitlab.com/xen-project/people/anthonyper/xen/-
> /pipelines/665987083
>     (private to xen-project members)
> Only failures are I think the same one as on staging, test failure on
> arm, but no build issues.

Sorry for the arm failure, I will try to respin the patch ASAP and hopefull=
y
the CI will be unblocked soon.

Kind regards,
Henry

>=20
> I'm not sure that everything is tested, but most of it is.
>=20
> Cheers,
>=20
> --
> Anthony PERARD

