Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4251E624628
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 16:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441958.695977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot9fu-0005us-HK; Thu, 10 Nov 2022 15:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441958.695977; Thu, 10 Nov 2022 15:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot9fu-0005sO-Ed; Thu, 10 Nov 2022 15:41:06 +0000
Received: by outflank-mailman (input) for mailman id 441958;
 Thu, 10 Nov 2022 15:41:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jazc=3K=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ot9ft-0005s9-Cy
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 15:41:05 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150075.outbound.protection.outlook.com [40.107.15.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14980c50-610e-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 16:41:02 +0100 (CET)
Received: from AS9PR04CA0159.eurprd04.prod.outlook.com (2603:10a6:20b:530::20)
 by AS4PR08MB8190.eurprd08.prod.outlook.com (2603:10a6:20b:58d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 15:41:01 +0000
Received: from VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::29) by AS9PR04CA0159.outlook.office365.com
 (2603:10a6:20b:530::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Thu, 10 Nov 2022 15:41:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT005.mail.protection.outlook.com (100.127.144.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Thu, 10 Nov 2022 15:41:00 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Thu, 10 Nov 2022 15:41:00 +0000
Received: from f04df8ca5a3d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C970CCAB-CCB7-4357-A35A-47417528718B.1; 
 Thu, 10 Nov 2022 15:31:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f04df8ca5a3d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Nov 2022 15:31:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB5387.eurprd08.prod.outlook.com (2603:10a6:10:115::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 15:30:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 15:30:58 +0000
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
X-Inumbo-ID: 14980c50-610e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dw20qXpPDLUFdY3yGvNOahBFHZ2N/PxDAhh/AqWEmLWf+fcJhRcsPWVDfuF5XysYpKtdy//h5Woa4SdGEe5h/NyyfKuVXOP48pt86YihiLwYshqxV+reJREQc/Bo8jSB1+vVcj+FS3UEspw5k7LycixXaI1BDOMHFBBlwr6nreu1Gv1L5TlDyEtSABYhku9HQUh7gEtPIAU6NE+ChYxrghPHmPyxk8zzF9NoH2Vo0/J7jgJDrvrnF82Jk9hefOjj7zuhG2Nc4YrxHmICEx064jpSSh4UyLoPECeW9X/YlZEIjPa1pg5curvGrOvtyopPx/dUL/IRXLww6CcZ1G18oA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw8EvDKGBg2jPS/aZQ+f/zpJmMBD5pLdBi0GUxsfPPw=;
 b=n6yLu1fbsScBx9sDRAaJfJY6hrMAQ6vM3NMntfGxenSqy3ENj4Qopir7DX+0skrbcQ8GdXbfZBVu+b8/g2vNbKhHygAJ/+ikf/409D4LSGXlq48XeN1c7/wVwdixqYX0ftITUE4HNW3LSrM9BOd9j5lxr1+MJZ0cKSfE5vhQ9qouGu3kGHPJ/ejtudIQ1wrXvhoNwxnrgI5Y348l3JrykZlAoqGLAAJcaL8/vaw+hj5EQRyYUB4k5n16biHfn1/RlQP8q2TB/UsxWyhusLnSA46omNakskblJXLYhKu5WehuEspdn1DFMWveDCKEjfCiJxuBu+0cEMJNiKJ/W6atyg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tw8EvDKGBg2jPS/aZQ+f/zpJmMBD5pLdBi0GUxsfPPw=;
 b=oFAU2lZTKU8HpKdD8v88IbID6KynjVbN5L2ziMlb7xmmYn414hGcgrzlTC6MPryf0IJTmRoXsjzPdqkts0blPO3EPOhoVi6UB313SM4gsJq7qOTQzbFXBpbHAVJnuIxszEHbnQ6Y5cGfpo2xysAEy3nKFDN8UH9dctVv9QlZaWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 606fcb29b1086a9a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GK4jpCZ+HU1wupQkQxGfo9+bFKhYbOmTXYE1ImHJYsM+8z6ozfdKCJSSSg+sK9o0fgxSmJwHu71u5RHQUmT6jXbJTl8afcgJjnDVoUCxFbBlCYrnCAI6YGil5FxNGEJNJl5zn1pbWFWcdqRFYBELk/805g8XJNDMgDae48+Cwvmoeru3p+TgbQVsGpqZj/tMDyTuLrAblfI5daJnebF9WbLSV1jvCd0iic+oObOzAD3Mixp9hBY5GDrP4AYqqcoPyLE+yi+RfzcXkI7qBN8z4qL8iNJGN8RQ4BnIl2BaZcCyaE99AWYYg5uHIfNfUy1xFmqn6Zqeh8iDKZZbV9n3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw8EvDKGBg2jPS/aZQ+f/zpJmMBD5pLdBi0GUxsfPPw=;
 b=Nt0KmO9J3uUeYQeUjNcHoRDVO1Q+Uga9jlRn17L+K0SnsYjwGKbkEIgkfpUkbET8h3AC8NLvvaQmwtFrH1Vsft00+0HTxfhcl+Z6BDJt+LR2qffi7cJtGp72BLWrro88nacFUU/augCFFcbyWj/LS01EAuAy0TQ30SVNkDhrVv2RwTz1Ezg4lN9VW3UUUuZTGSDXBYVTH4F6xfBVu8tPqRcxRIjkW0Wr8q473Xc1oCzQBh1enCdxt5OXw232MUR9dUY2J3p/HW0YCNFNSWdxIa0zlPihLUxlxXTMvZV9r+l9K/gh/VlBP8oIsCk/8UonkGW/B9H84G3eboD1zwCvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tw8EvDKGBg2jPS/aZQ+f/zpJmMBD5pLdBi0GUxsfPPw=;
 b=oFAU2lZTKU8HpKdD8v88IbID6KynjVbN5L2ziMlb7xmmYn414hGcgrzlTC6MPryf0IJTmRoXsjzPdqkts0blPO3EPOhoVi6UB313SM4gsJq7qOTQzbFXBpbHAVJnuIxszEHbnQ6Y5cGfpo2xysAEy3nKFDN8UH9dctVv9QlZaWs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
Thread-Topic: [PATCH v3 0/4] Yocto Gitlab CI
Thread-Index: AQHY7TFh2hDh7VPqHUGkPo4tUdJZza4okuGAgAAFoQCACog5gIAFE1+AgAAkXoA=
Date: Thu, 10 Nov 2022 15:30:58 +0000
Message-ID: <05E5D394-6943-4712-8716-7FE704B44B9F@arm.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
 <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
 <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
 <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
 <Y2z6r9n+A0cX69Yb@perard.uk.xensource.com>
In-Reply-To: <Y2z6r9n+A0cX69Yb@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB8PR08MB5387:EE_|VI1EUR03FT005:EE_|AS4PR08MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9c69df-fff9-4e3e-cdff-08dac331f7f3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6ivgGTcm1iOq7odWVzJrQpn4sKXU65xAGtgUTt1il7Ti1fSSF1tMWSWyV2/rXT7m4DqQZmF2kScxBEhPhMuTQY1pGcXujluk0iWS4NgW9FQgdza/4dujDQDN0AjHZT4QDNW+GCEFD4A+PuBwaXElxsDsl3oftUC6kaAy3t3I7h6usAxpAguJQwMC+poK+cPPHgItdg9qd7tpYfS3E1+FdGGWmNmuOh6xqbhdIfB31X+D14UmN1jfMY2vfYZd+TWdbYr7gOLOXuouaKdRA+JecCRg3BLVab0vvEjrdDcsRjZu+2EYEcAdQCxeRRGyzL1x+17OxV69ag7JKdkIBnhxQQA5XfQD9Vg3uQa671hmtdbqBcX1hZYr5spA/Cl/fMy9jQyJ/Vnq24Bk3vIi3Ne3TEwS7y58jZxXmVsfn+N5jvSwOz0DB15fQ62bvE4eB7jYf3pbFHBKqxb142MaXYFf+uRGC3SBd27X40dUHqbCMJvqVFpE3QgA0aaI09lS+ZDkZqOjyGlC7nPZm2RJTJYWvs+xNtIqz+ihv7pj++F7f+yNzmzcf1fWkG9mEwKYxD6CkdoHZ52cOPeWvekD5w+A1TtbaV2rF/7xDqWHemPxRe+z/l6vqoU/O+qN/Y7rKrwx/5pigwbvIfI6PiuIS+fshzKo3Sflgwne7R4JhQbCDpJPBYabZ9A67LrrHyriqi3bdiqaKH8tuDPwZuoH0UJVeg/0Q6W69L+PyG1rKBOTWRJcYK7UbWliQk4mMJ5jpvTJM+KqPiNlRae8Finsa2mK7zN5sfU9tgOWlJBKdpo3FxkJzyhTR8a4UDDaFJyI9awf1GEJ2n7OgMvATiFQmUmZuE8Fb9dKPPQKi3S2m5eoH7R1Uz/PLXSjjjOtAea2xANF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199015)(38100700002)(316002)(38070700005)(33656002)(53546011)(6486002)(6506007)(966005)(478600001)(6916009)(54906003)(4326008)(76116006)(91956017)(41300700001)(8936002)(8676002)(66476007)(66946007)(64756008)(66446008)(66556008)(5660300002)(122000001)(186003)(2906002)(2616005)(4744005)(36756003)(83380400001)(86362001)(26005)(6512007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <835A15B9243AF54C9B1285CB78E649EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5387
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	791cccec-6ae3-4c62-4dda-08dac3309112
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BcRwsE71FfRyFddqfk/CtMjY4gdqY75U+yNz+VmY6v1muK5t/hqNp5qWvqYtAZ9+TA8Zdi+1UXSCr1yt/fxwQBsJzSMgMMljf4BRWI74PIuZVYZAkckJa/36IiEA2xI97zkQ2n9+I+tz9hClbZmIIBGY/y00jEBER9nCCgebaQ1qSTZYQC5hAre3g6UuE516pbwN3fYlt1V+D0uIVjBsZ8qAVvQK5RjIqwZAnL8fhiD6Un388pSbUGTeXSviAnh6GiXEgOb2N75n8DFuAQ5h8yOJPprJZa/LNU2Ln4mniuuIMGsC0UtP1LFuHgyBVLgvCIengxxLMql0lLS58Csx69C4l7Ff6VrsMIBqgMACYjWmVqFuzVkYDRME2MCwoSL6D/UmHellnzqVKHXOwbS0wLH/2aUSozB+5NKgydF/lp08x56cuu0hkEY9jwLYSlND5ppAzXts60IeqvlSPb83yd4O/7tDPzjrnWKBZRH05WzwoBeUzI5FaAFOk45J/nndg40wD9P52brUBLgFSIEMCJzVmLQuPQoEEsWvJDJYXFWqIe9uhKmx+vpljfigUc+X0rYM2cii3p/eV3yxPk8wz3DFZjfj/qDpbtDqkedSTKNJkbq6zhiDZNQvtt96shln3QQ2/cEnP1rInzFEftCUNi5//BD55d4FZE1ol74RYLZ9PZe0ymxBr7MG2ZzsJIhpRkQt/qfHVoXet44N6ZWV4nTKaEVfnOJ9tC26merHYYDEWaLX0BbjsTe4M9h9x1E6NPOUqEsFfnfPRRH3dkYU8X52B9HcD2IhX4gj+Khj5WOTmtVwas950Q9jgoGybZt2MYTVFlG3n8S7+E7tC2HhVg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(6862004)(82740400003)(70586007)(70206006)(40480700001)(5660300002)(83380400001)(41300700001)(316002)(36756003)(54906003)(8936002)(33656002)(4326008)(81166007)(36860700001)(966005)(8676002)(356005)(6486002)(478600001)(82310400005)(2616005)(107886003)(2906002)(6506007)(26005)(86362001)(6512007)(336012)(53546011)(186003)(47076005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 15:41:00.6016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9c69df-fff9-4e3e-cdff-08dac331f7f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8190

Hi Anthony,

> On 10 Nov 2022, at 13:20, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> On Mon, Nov 07, 2022 at 08:50:09AM +0100, Michal Orzel wrote:
>> 3) Try to use CI to build and push the containers to registry
>> - it could be possible but what about local users
>=20
> FYI, it's already possible to build and push container from the CI, at
> least on X86, I've made it work:
>    https://lore.kernel.org/all/20220301121133.19271-3-anthony.perard@citr=
ix.com/
> This works only when pushing to the "staging" branch on the main "xen"
> repo as I've added secret variable there. (Also the branch needs to be
> "protected" if I remember correctly.)

Very nice :-)
Would definitely be a good solution to have a solution like that for yocto.

>=20
> I don't know how to use the Arm runner to do container builds like that.
>=20
> (The change done to one x86 runner:
> https://gitlab.com/xen-project/xen-gitlab-ci/-/merge_requests/15)

Something to look at definitely.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Anthony PERARD


