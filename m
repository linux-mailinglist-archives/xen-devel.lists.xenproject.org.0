Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B559A5EA5B2
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 14:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411753.654801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmyk-0002Or-5p; Mon, 26 Sep 2022 12:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411753.654801; Mon, 26 Sep 2022 12:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmyk-0002M6-2p; Mon, 26 Sep 2022 12:12:54 +0000
Received: by outflank-mailman (input) for mailman id 411753;
 Mon, 26 Sep 2022 12:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NYI9=Z5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ocmyi-0002Lt-KN
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 12:12:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b0f7c09-3d94-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 14:12:51 +0200 (CEST)
Received: from DB6PR0601CA0044.eurprd06.prod.outlook.com (2603:10a6:4:17::30)
 by AM9PR08MB6257.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:12:43 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::8) by DB6PR0601CA0044.outlook.office365.com
 (2603:10a6:4:17::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 12:12:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 12:12:42 +0000
Received: ("Tessian outbound ee41cdb23966:v124");
 Mon, 26 Sep 2022 12:12:42 +0000
Received: from 46e3470fa324.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9646A717-E492-4F38-9194-E183D423BD61.1; 
 Mon, 26 Sep 2022 12:12:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 46e3470fa324.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Sep 2022 12:12:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB8201.eurprd08.prod.outlook.com (2603:10a6:10:39c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 12:12:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 12:12:28 +0000
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
X-Inumbo-ID: 8b0f7c09-3d94-11ed-9648-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Y+fMK/uOBNje0gfOClfLMq9uN2VAdgXkq1Oj20JjpCpRc2kAuuNmc1Sn84Ob5JElSb7AfmCDct32IRgEJsyJ6UWh6JUkO8LJSE/Ee98OMR+RJplGQHVr/+aC4ZH75OzDioMMjwqVzY9k94VPWmuNlR62vxIDFa/oQO2P0bpH4FFY40srLkmCur0vhskN2mNfw3TH99/ZLO+8jVt//7ADQ2gzhGZqKTfAI7Dl7rz1IPQRQjO8hWV6LrFpjZ5FcIZrk8Z2HxYu1bH86LYhLHjZBCNGnKLz00JTSMfdlaRY+zfnhfyzdrr9DJjUs1yH0QPf0PvLQ86Y0NRanYvyZnYQxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu7NPzDEEYinXa/mgVb2p4/OWTKtJG28ZFAZmKmc0Po=;
 b=EKYSA6+4I7ni2Cy7wrMlOJK0aYCD1vu5vXa+qWJqnF/q4aSYLVptpMRDcpFNKwqCjgQtaPWv6jmSKJaOTPNNKi9mgmzK1zJw+4qGw6Vu4VJPBwbNqyzvUazqXxZ26tdxr3TDnxU+RBCO08Bm+lhz1Vd7Cg5BJOz6ECuDKBb5T1qopuWXMpaJf/OPdf3CKAvt8A8Bwy1sTTBHeUzXbCSvkDtx1VO7ypnLXn7B/xwceqhRmVR7Llgf5UBt2/vhysu45rPjhGq+xyjFIWKlqx5UFNfwbT2rcyfdy9agVHOgTbMsoWkV7Dm4V0AjzUjAK42KovajRjBMZtOqTc0cuhn12g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu7NPzDEEYinXa/mgVb2p4/OWTKtJG28ZFAZmKmc0Po=;
 b=TDg4gcjxxkj8ZRrW5boWmuZCUL3E6u0PdXb/YDmNJ7dNGAGNJNu3zjgN+aF9CoY3ecX805BWife3V8+sU2TEhK4q3FmdWBpHKHtVFYPFpzG1DyTdtsFByhR4qMuxlMoNM8AiuAfKbfx95IkiMCOkWbSSWSqJJWUWMwzcrxIyXtc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a02ecd64d728cc1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+C9xe+8ITUA2c6TgQj7/m7Yzng6ugWlTF/z3+kph4zWSMfvdGBWiUwzmwWY3Vfu5c3gKWB4C6JLFZgtNcn9b5Ka0XWLBrHvDzqsFWcZIwcJRCLiSqwfD38LXy/dEYDbDho4avPgRO5WiMA7vQub4cfriQmrqkxBpiV7oz05oYBlYRHCQ9gpHiqbnV46NNI3nwNVF5s/nSUGnyzANW4GG22Viv/RqJO6iKrHSsHrp2LjmG2E2Wad3OZrAdgfjtmDOotN6tHLoIx9NAtzQa20o0bLFdMuptJVB8K2BZJp3Dsft94hqnwcJqkjZewdRgBEpE47VVsfA+adkzElfg0/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu7NPzDEEYinXa/mgVb2p4/OWTKtJG28ZFAZmKmc0Po=;
 b=bfzaUn7DbIKEZqNegiurkgmTuXQyytLV4c5oPxOzxdk+hYPRjKF9ukLX/1Ruyi00+vxseotfeQQLUwKHYfyDOfjblDA5Ru2U+DwXsXFtw+1Ee665DG+JaVBpBEuWPBHa9EBKphJNtzY4lGaJggFSoHr/I2M4NTI8KnDj6CFhl2pOXIGiyd38DrOoTVF2JG43rsJAGMllTDg1UoFCHoe/b5O8B5uds8oktrQoucCbe8ARjsRdwqlzJN6Ztsk/+IJHtA9LFoKmj4KaSi06Jg+1IShn3PBDlJDj7rHhx/nOjJwGoPbXJUhh6eUM0NAJZ3gStCr1rtxeTOCQHyDnIvnbUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu7NPzDEEYinXa/mgVb2p4/OWTKtJG28ZFAZmKmc0Po=;
 b=TDg4gcjxxkj8ZRrW5boWmuZCUL3E6u0PdXb/YDmNJ7dNGAGNJNu3zjgN+aF9CoY3ecX805BWife3V8+sU2TEhK4q3FmdWBpHKHtVFYPFpzG1DyTdtsFByhR4qMuxlMoNM8AiuAfKbfx95IkiMCOkWbSSWSqJJWUWMwzcrxIyXtc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 0/2] xen/arm: static event channel
Thread-Topic: [PATCH 0/2] xen/arm: static event channel
Thread-Index: AQHYzzv/z5KfzY5FpEi922tCq9+On63xpAUA
Date: Mon, 26 Sep 2022 12:12:28 +0000
Message-ID: <D0DBE432-5636-47AD-B6B6-CCC1D636CD19@arm.com>
References: <cover.1663928523.git.rahul.singh@arm.com>
In-Reply-To: <cover.1663928523.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB8201:EE_|DBAEUR03FT038:EE_|AM9PR08MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8fdf44-b63c-4274-b495-08da9fb86a1c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +LRUQ/RNpH1AkGsPwKdsMqGRAHNDqLNe+1q6ZBfIBtt84grUrpzfN5Mij0JeYbTo1vXnHbmBnwXyWhKICQ3ugeEfV70VTK31piSf/48RcTl+cCWxDydSdyCVKg5Nm5D+IvEcFBMehVgTqr/qKLcxqI9BWiBvq7jH5Z1050MKvb6k4twn7sO06B/MhSX/WP9BKuGCBL/y7u/l54EJuJmXT+HeLuLnW2KhOyaYZ4lGLbHM3IRL1lTez4sBW+rrwaefJtTEfGkqB3Uu2YKddDjMX6TUDXJfY15d1ZNSlEWAwDAB6GRUDXV1VMv846nneDS1+F66TWwdWhECy588q1VTBLZfRDcY+yBQ/z5HhEIsrn4oO2agTIwvSN6YLq8u9h7ge7EBm9BHVATb++PbaEYo3XYXxS6HRUAREl3BXulqG9t6XVlwzTr8tFbBRUEG3Ar4085yfO2xkmx7KyT6G9NvIXrKiWH2HG+H/41Irl+ycUHRg6t0xueQmdrxrJCvlPB5ZYgxQrWU3EHphTrla+YFUHc/hxmEbiBpjR3y+ZKD1yPc0t7Ppj15LziXo00rgqIl14AlbsqcxnKQmfRcGjyq2zuNzyuuoZRN8NLlXYm0E4Le6C9QTnll9+eUsE5GhVlINhNmeYyiPFEiEUiZg4VVLG/ySol8eLzgz8iOmDSABBWGROr6fFprH3Kn7bdYDxXfRJVEoRyBzl9w/ZYNTpZ097kuz5XTgaz/dQxdxGMOGt1EE+M0N2vYTYRUhptJ9F3sS4M/33KXkCzUha9uqjIEGAh+eLakyGkC3AVXkhf3Tq4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199015)(33656002)(478600001)(6486002)(36756003)(83380400001)(122000001)(2616005)(186003)(5660300002)(86362001)(38070700005)(38100700002)(26005)(41300700001)(71200400001)(6506007)(6512007)(6636002)(316002)(53546011)(37006003)(54906003)(6862004)(66446008)(8676002)(4326008)(76116006)(4744005)(66556008)(66946007)(66476007)(64756008)(2906002)(91956017)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <99049ABD367CDC4CBF25FA76348B4BB2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8201
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bea426ba-0ff2-4f18-58c7-08da9fb861bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A+0oqQNN6W8cQOKj1PlR68DzhkjzFdr6v1EywHNtAbP0AsXPZt7T81JBaO+NmswAK7OasdVAi0EfwLz9x29nAlck3pHqYCR8i4ZlR2NNMUgbCiJVBE0Gky0mo27gZk02OYZrQl6xPhjoBhYx+YFYlPyuSBzVAIknjUd2S6uPa5Cm7OGd7CW5DI6Du/Fc14XXYiBkFXQyR7vwOO3BUEzV0Jh8mNUm0cz9KwotKjJNU+gdXifQqbqI88mkNBT/x5ax661NVJfv762t8/pdHUrLhHIMUh9wbAXN8P+eCRPgL55S6ELYJVTK5iF34RBziT4jR4qKFwptW9B4sdYH+JXDw2R7fQlhuq9gfOJnu/vxZ/cuxdZCvceHUo/A7HQDPxVg+zU/5/XAhmSqRI5Kgwskv3pJh25V6JNOSeNJCepzARxbszHWb6zeHxS7EmQCq79PVu3FK32uylOthjV2p/mRsLQAyoyHUENwGZmLf86fl5p9KpsuVsvwUvjc+21sRJCb/feCKasLavt/cj/Ceb6nzBGWTveecJ/7ZB843eoVOLJ/S98N+0IKFZXNYiPMVRlom0vUQmL4tkS47O4f+a0uDq7YCgJuC3yaMS9wxWlxELhSCkbhN5mbQJiCcHyOIta0jwM1xF8cwqP8+9iWDyjWJjDHhIOZ6g8TBe2sCgQ5XeMa95HapugLm83bO8GBHbZ5bFzvF4BPaLvmK8S3CE4cOLUZ6F8dA+zEgWrADLsPgLN+uDyfwC9zPowB5zlUbPSoDkfsUYaDaYK1FdZPdbnqBg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(4744005)(70586007)(70206006)(82740400003)(8936002)(6862004)(5660300002)(36756003)(40460700003)(33656002)(86362001)(81166007)(2906002)(356005)(6506007)(53546011)(2616005)(6636002)(336012)(6486002)(41300700001)(40480700001)(186003)(478600001)(82310400005)(26005)(83380400001)(8676002)(4326008)(316002)(36860700001)(37006003)(54906003)(6512007)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:12:42.9255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8fdf44-b63c-4274-b495-08da9fb86a1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6257

Hi Rahul,

Please give the necessary justification for inclusion in 4.17:
- severity of the bug fixed
- probability and impact of potential issues that the patch could add.

thanks
Bertrand

> On 23 Sep 2022, at 13:02, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> This patch series fix issues related to static event channel series.
>=20
> Rahul Singh (2):
>  xen: Add static event channel in SUPPORT.md on ARM
>  xen/arm: fix booting ACPI based system after static evtchn series
>=20
> SUPPORT.md           | 7 +++++++
> xen/arch/arm/setup.c | 5 +++--
> 2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.25.1
>=20


