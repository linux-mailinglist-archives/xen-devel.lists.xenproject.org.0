Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B95970DE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 16:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388976.625764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOJy0-000623-Ah; Wed, 17 Aug 2022 14:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388976.625764; Wed, 17 Aug 2022 14:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOJy0-0005yd-7w; Wed, 17 Aug 2022 14:24:20 +0000
Received: by outflank-mailman (input) for mailman id 388976;
 Wed, 17 Aug 2022 14:24:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=asjj=YV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oOJxz-0005yV-I1
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 14:24:19 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140081.outbound.protection.outlook.com [40.107.14.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 470b0922-1e38-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 16:24:18 +0200 (CEST)
Received: from AM6PR0202CA0051.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::28) by AM9PR08MB6770.eurprd08.prod.outlook.com
 (2603:10a6:20b:300::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 14:24:15 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::b) by AM6PR0202CA0051.outlook.office365.com
 (2603:10a6:20b:3a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Wed, 17 Aug 2022 14:24:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Wed, 17 Aug 2022 14:24:14 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 17 Aug 2022 14:24:14 +0000
Received: from 2b4229d21b41.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 520723CA-73A8-44F6-B9D7-93B2FC0BF203.1; 
 Wed, 17 Aug 2022 14:24:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b4229d21b41.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Aug 2022 14:24:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4488.eurprd08.prod.outlook.com (2603:10a6:20b:71::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 14:24:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.025; Wed, 17 Aug 2022
 14:24:04 +0000
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
X-Inumbo-ID: 470b0922-1e38-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QOETATqJc3dOpA+q/LGbB2VwCcbfS/9cgFMNOH/0Z1pA4LYzYKmNy6LzCcO1HTQBhQnPLu1I1NkW/Tcm70+zSevP0ulJNyypldD8hLbJT+71MGRB19ctyVtmK64A38lfTaMehuqLJtlCyaHMC++DSJ0lanD9+Cah1ywzo4lBW7/o5v+YxCN6jhZRJiU4m+eC4hhDD6huQm3I2ehvFojGLHeKe9LE9VSfun2t81BW0zAtjmPbslp/TTskxO3hayqEoNbamDM6uF0SUAO5/xmNj9N5LWCwQM8piE2x/LL1PCo2gSKN0nqO/jboUv/+6EGlIOYhBhQmhsJVYq25audnlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0l1DSorM3j5cICVZ3WhVkpwVgUcbH9HzCGIK2CTplM=;
 b=ZSngt7ZLMI+ERuIVeWmSdpEmApXfEphLH9cHvllJAimJAYAXEUiSXba2u4O5v73JhMFMZQGcR1AZ+6w7GIrFlj19iyP+zo8EE9UDjyJxYIiit4dkljmN8ButJehWtunN9Lc2wP3BKzRg4uFpN2k/zdYIVWCdzlp1Ta6LstmzoGYp5jCXSOEVn4etDbCOAUXhIEYNOGvyaHQ6iNTYABjaL/j3oouekVqdLp8W6HoEqH0wlFWaivuj3QiD8qD0K1Lnf0i1hqje5axY3ghNCKJlULk8XSAMERQub+L4eitLWhhfJUXqPjQkCVHxNY2mJ9lBwsonBR+5n4zQvflq/8eSQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0l1DSorM3j5cICVZ3WhVkpwVgUcbH9HzCGIK2CTplM=;
 b=EPMyrLJy8DOBB7WSiLHPgSYviwurj2gusD1W8EU/j6B9L+ytStp/ge83A3g03UbxxjwIwg0n/4g+trHB5duDtdT/063uaa3bsb96iooTzHy8Ce63pjRleFbZowRuzsZUAP2WJ2Ij8b7gyGSzfk+l6XfYoOj5iet0ZUdTcOL9umk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 57f50f28c7d5dfc2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwaEOx2w6ocd/i4XGYjEbWtY+BpgiSL8jmQQVavWW92p8PN3adPgqURd/sloPbQcg+u8uvUNcE8w0uxSKNeb1fdmqhlO/iKdgzuzjWzOIUdxN5s51OpOSrHgGSv5ZV3ADcQr7yf91Z228+yxefDEk96GTe0XYgyvtrRIPWrFc2qGGOfjVvSLf8xE9q+d+qhVhz039Bj9iBAHZLV6Bjm516pJdd9lpYbygARw7WI8nzbPGO7be+tPU3d1TgkPPfwG/XatAN0y0lt9J6m88QwFeL2Ew8dLE4VpZuBbhFUv7OcPLriqRYUIl6dn+vGZPGRa8nv3nMwVWFaDgDy3hhYodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0l1DSorM3j5cICVZ3WhVkpwVgUcbH9HzCGIK2CTplM=;
 b=XBt5Tx/928BjcNaja5MD/IsA7QBmbeisYe0T8DxkOv1c6gVjU7rnqAvbbmnxLF37UfTHF2bVtpUxDeW89YyddnKP18ohgWwFutODCv9pjlpmxhSapIOwhq9lg97qRh+e9lBjBqJHH95GaukAKVUMBGpS5Zl2D0t/IMttJPGdjDfVxvyrNz9MPn2Ez4CjXHFMzuXl3XVgVorF8ZmE8nRdXImGVjlFajPD8Bt7O17YriLR4U89JxQzin55Zn3crCStMk5qdUqFG7LleZ4L5YQmfDyvhYoExoWfJWLEXE18PPwnKDXfQ7esxy+8HHzomcSkl539IJqEVex/sGanRQikZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0l1DSorM3j5cICVZ3WhVkpwVgUcbH9HzCGIK2CTplM=;
 b=EPMyrLJy8DOBB7WSiLHPgSYviwurj2gusD1W8EU/j6B9L+ytStp/ge83A3g03UbxxjwIwg0n/4g+trHB5duDtdT/063uaa3bsb96iooTzHy8Ce63pjRleFbZowRuzsZUAP2WJ2Ij8b7gyGSzfk+l6XfYoOj5iet0ZUdTcOL9umk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2] build: Fix x86 out-of-tree build without EFI
Thread-Topic: [XEN PATCH v2] build: Fix x86 out-of-tree build without EFI
Thread-Index: AQHYshn5p8B+wu2e+kaYxiD64FUdFq2zJc0A
Date: Wed, 17 Aug 2022 14:24:04 +0000
Message-ID: <8DFC3EF7-4F6C-482A-9D7C-D56EE1AD6A81@arm.com>
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <20220817091540.18949-1-anthony.perard@citrix.com>
In-Reply-To: <20220817091540.18949-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2a74693e-44d2-45cd-ff92-08da805c295c
x-ms-traffictypediagnostic:
	AM6PR08MB4488:EE_|VE1EUR03FT025:EE_|AM9PR08MB6770:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KwWxbb5lBc+BByQHTvLtn845oP6+UWB7BKNIZn/7uvG9QHcSugf+9G0b48qZ856RIksJj6iHD1P2SvKUItDrWKSr49INvgjN2t3oAftoEirtEPmZe0n6WQYHcWJ8Ql8tRu0w6IZCuujbfIheSJALeKiMc8Z+HobKnSyfw4ngp+uVb0N2hZwHK5l6HeG5ZrQHErVa+03Sp//+2VAUeLWr3fuzdDRpfYtKOs5DoxCGObD6fv7695HxlvSwAs/PeSxlqlE5B6T1xtdwzgolFbIgTTVqB2/6G7AcnmbHbvpS9gLNJSlqzyQjCDql3kgrFNrtp7uL0m/whGHUrMD09lpr4bqrrurjfYMQw8SdjlYIX+wFSBAtBpOnCsJ4MchX71UUvNMi4DUqGTlQ6oNGwoqCLxAmm8Sdf+xAqq8PLUviwir23l91EX2PdSG0uXCePMCAktHXjcuvDs1/Zd8QfKl/MMjcdrnrQ2KKORy7NYcclDa8b79UCK0ebnCl+xsUdGv9hodux2TAUclVVx9+raf6byBWIH45NClbHrBYEefIxwnpFr7Ib5iZFkLWpvXq0AjhWbHTWnJO1HKz5fMgGft3L2e0xT7qJYFEadqj8enf8KC6OkjJbNdbuiM8grered9FpswbZN/YnAL66WtJllxgpn34Nols0pNQlmnt8YbbzcirItx/h0e92wBlBC858nQc3EvT7UZ0ed04fXCF2KinnwL2ZFitPB/k7GlCZbCJTty29+Pc79ArIJobx7Qc/UOfvtigaib1+LM/2x6gQfU4jN8ibzcQLW78lpgT+U0JePsJ+Kj/kByM6fFWcHYUy0WZquWVIm98zMm+zV1xF5Tl1g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(8936002)(26005)(38100700002)(54906003)(53546011)(186003)(41300700001)(71200400001)(2616005)(83380400001)(86362001)(6512007)(6916009)(122000001)(316002)(6506007)(66476007)(6486002)(38070700005)(5660300002)(7416002)(4326008)(33656002)(76116006)(91956017)(66946007)(66446008)(478600001)(64756008)(66556008)(8676002)(2906002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A1D7CC91F3EB9843885B556ED6B0572A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4488
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f2bb40a-3954-4488-b389-08da805c2398
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cMlraxuFrC6X16tSZSjCa+UylxvHOGsv41qBSNSYMWn17GWTJz4sxJtTbLdrBP4OsfMZr9wTHvzhY8i67pSrX/wyJND1aPiRsCGGN9GaSv6+bSDXKUsewC9wUcdDYiOvDCUZiDdSKKU9wWCrJo8iFZMiVi3gpzacxnrVSTIRiZmWI9Sz8/HllOnSCQVMnuMzkO53w8JO/6NBwNAKKhWvYGBtwp16/hvLE7Uqlw+TN4DUWlzVBVjM2CTstP3FCxAO6MxXkA0rP2LotJBdi5BK7eYs6mOTmC02QMfbrpuhc4b5XxhpVD9K7NHy2TOc1cII2oG2L1hRyNkKTS7cBdWmPGJUNM86tvkRxC3bDe6ivAvSjzEk8s4eO4oARlF4NIR3KsnkK3Qol5N3+aGkheVtVzRJ5FXXHxjec21E7xnganhsYHVaYGtljS22eRpDlwbiD4o7LhJQChOTxsCaJfdonMFRMFtppiqVqkPdwKVGlhS0VVT35Qe0Ki2xjBGRFvTH1hXjjvRhyj7mdENBPlzxjFhorooSJ0Rkg5AWbxcXwQIPy+XFlzWXwglAxhGfIglbHVLnnqHiwFYg4m+XOVDwXVM36VpS8fr3bevur3PP1Z0Sdw+MMq7ICaZhMOuHV5nVjL0mE5i9Gh23oc3lbXicL1MBdQrISOUiabCEty/a6rtR62crhfQ4iWDvbb1mq67iXRzU4nnJcueuqk3pcTyckzsL5e0zuoeMJeaHp5Ke8BAM5sQOWzVUndWrSnJRw+vmDdFub9CgTwLY+p4ZE/3PaszWESCyRRMNOxuFfIXHblgzJeAevUPDZ/s71EMCkN0t
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(41300700001)(54906003)(316002)(478600001)(82310400005)(4326008)(70586007)(40460700003)(70206006)(6486002)(40480700001)(8676002)(5660300002)(8936002)(6862004)(26005)(2906002)(36860700001)(107886003)(82740400003)(36756003)(186003)(86362001)(53546011)(6506007)(81166007)(33656002)(356005)(336012)(2616005)(83380400001)(47076005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 14:24:14.4091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a74693e-44d2-45cd-ff92-08da805c295c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6770

Hi Anthony,

> On 17 Aug 2022, at 10:15, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> We can't have a source file with the same name that exist in both the
> common code and in the arch specific code for efi/. This can lead to
> comfusion in make and it can pick up the wrong source file. This issue
> lead to a failure to build a pv-shim for x86 out-of-tree, as this is
> one example of an x86 build using the efi/stub.c.
>=20
> The issue is that in out-of-tree, make might find x86/efi/stub.c via
> VPATH, but as the target needs to be rebuilt due to FORCE, make
> actually avoid changing the source tree and rebuilt the target with
> VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
> exist yet so a link is made to "common/stub.c".
>=20
> Rework the new common/stub.c file to have a different name than the
> already existing one, by renaming the existing one. We will take
> example of efi/boot.c and have the common stub.c include a per-arch
> stub.h. This at least avoid the need to expose to Arm both alias
> efi_compat_get_info and efi_compat_runtime_call.
>=20
> Avoid using $(EFIOBJ-y) as an alias for $(clean-files), add
> "stub.c" directly to $(clean-files).
>=20
> Also update .gitignore as this was also missing from the original
> patch.
>=20
> Fixes: 7f96859b0d00 ("xen: reuse x86 EFI stub functions for Arm")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

I do not really like the empty header but I have no better solution so:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Also I did some compilation runs and it works.

Cheers
Bertrand

> ---
>=20
> Notes:
>    v2:
>    - instead of renaming common/efi/stub.c to common_stub.c; we rename
>      arch/*/efi/stub.c to stub.h and include it from common/stub.c
>    - update .gitignore
>=20
>    CC: Jan Beulich <jbeulich@suse.com>
>    CC: Wei Chen <wei.chen@arm.com>
>=20
> xen/arch/arm/efi/Makefile           | 4 ----
> xen/common/efi/efi-common.mk        | 4 ++--
> xen/arch/arm/efi/stub.h             | 4 ++++
> xen/arch/x86/efi/{stub.c =3D> stub.h} | 5 ++++-
> xen/common/efi/stub.c               | 5 +++++
> .gitignore                          | 1 +
> 6 files changed, 16 insertions(+), 7 deletions(-)
> create mode 100644 xen/arch/arm/efi/stub.h
> rename xen/arch/x86/efi/{stub.c =3D> stub.h} (93%)
>=20
> diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
> index bd954a3b2d..ff1bcd6c50 100644
> --- a/xen/arch/arm/efi/Makefile
> +++ b/xen/arch/arm/efi/Makefile
> @@ -4,10 +4,6 @@ ifeq ($(CONFIG_ARM_EFI),y)
> obj-y +=3D $(EFIOBJ-y)
> obj-$(CONFIG_ACPI) +=3D  efi-dom0.init.o
> else
> -# Add stub.o to EFIOBJ-y to re-use the clean-files in
> -# efi-common.mk. Otherwise the link of stub.c in arm/efi
> -# will not be cleaned in "make clean".
> -EFIOBJ-y +=3D stub.o
> obj-y +=3D stub.o
>=20
> $(obj)/stub.o: CFLAGS-y +=3D -fno-short-wchar
> diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
> index ec2c34f198..950f564575 100644
> --- a/xen/common/efi/efi-common.mk
> +++ b/xen/common/efi/efi-common.mk
> @@ -9,9 +9,9 @@ CFLAGS-y +=3D -iquote $(srcdir)
> # e.g.: It transforms "dir/foo/bar" into successively
> #       "dir foo bar", ".. .. ..", "../../.."
> $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
> -	$(Q)test -f $@ || \
> -	    ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/so=
urce/common/efi/$(<F) $@
> +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/so=
urce/common/efi/$(<F) $@
>=20
> clean-files +=3D $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=3D.o) $(EFIOBJ-)=
)
> +clean-files +=3D stub.c
>=20
> .PRECIOUS: $(obj)/%.c
> diff --git a/xen/arch/arm/efi/stub.h b/xen/arch/arm/efi/stub.h
> new file mode 100644
> index 0000000000..b0a9b03e59
> --- /dev/null
> +++ b/xen/arch/arm/efi/stub.h
> @@ -0,0 +1,4 @@
> +/*
> + * Architecture specific implementation for EFI stub code.  This file
> + * is intended to be included by common/efi/stub.c _only_.
> + */
> diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.h
> similarity index 93%
> rename from xen/arch/x86/efi/stub.c
> rename to xen/arch/x86/efi/stub.h
> index f2365bc041..9d2845b833 100644
> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub.h
> @@ -1,3 +1,7 @@
> +/*
> + * Architecture specific implementation for EFI stub code.  This file
> + * is intended to be included by common/efi/stub.c _only_.
> + */
> #include <xen/efi.h>
> #include <xen/init.h>
> #include <asm/asm_defns.h>
> @@ -8,7 +12,6 @@
> #include <efi/eficon.h>
> #include <efi/efidevp.h>
> #include <efi/efiapi.h>
> -#include "../../../common/efi/stub.c"
>=20
> /*
>  * Here we are in EFI stub. EFI calls are not supported due to lack
> diff --git a/xen/common/efi/stub.c b/xen/common/efi/stub.c
> index 15694632c2..854efd9c99 100644
> --- a/xen/common/efi/stub.c
> +++ b/xen/common/efi/stub.c
> @@ -30,3 +30,8 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
> {
>     return -ENOSYS;
> }
> +
> +/*
> + * Include architecture specific implementation here.
> + */
> +#include "stub.h"
> diff --git a/.gitignore b/.gitignore
> index ed7bd8bdc7..3a91e79672 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -311,6 +311,7 @@ xen/arch/*/efi/ebmalloc.c
> xen/arch/*/efi/efi.h
> xen/arch/*/efi/pe.c
> xen/arch/*/efi/runtime.c
> +xen/arch/*/efi/stub.c
> xen/arch/*/include/asm/asm-offsets.h
> xen/common/config_data.S
> xen/common/config.gz
> --=20
> Anthony PERARD
>=20


