Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E0600C3E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 12:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424308.671630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okNGJ-000132-Kk; Mon, 17 Oct 2022 10:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424308.671630; Mon, 17 Oct 2022 10:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okNGJ-0000zw-Gm; Mon, 17 Oct 2022 10:22:23 +0000
Received: by outflank-mailman (input) for mailman id 424308;
 Mon, 17 Oct 2022 10:22:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CpyK=2S=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1okNGI-0000zq-8j
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 10:22:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94f17010-4e05-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 12:22:20 +0200 (CEST)
Received: from DB6PR07CA0115.eurprd07.prod.outlook.com (2603:10a6:6:2c::29) by
 GV1PR08MB7780.eurprd08.prod.outlook.com (2603:10a6:150:58::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.26; Mon, 17 Oct 2022 10:22:17 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c::4) by DB6PR07CA0115.outlook.office365.com
 (2603:10a6:6:2c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.11 via Frontend
 Transport; Mon, 17 Oct 2022 10:22:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 17 Oct 2022 10:22:16 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Mon, 17 Oct 2022 10:22:16 +0000
Received: from 9d2546b8ec30.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 43940249-2CA7-41FC-B8EF-42E569EA5667.1; 
 Mon, 17 Oct 2022 10:22:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d2546b8ec30.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Oct 2022 10:22:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8716.eurprd08.prod.outlook.com (2603:10a6:150:86::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 10:22:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 10:22:02 +0000
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
X-Inumbo-ID: 94f17010-4e05-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OvptQdfGkKraWNrlZhJ/fiEmO61vU/LK6lvcO9y7/KFO9A6e36+CRMjPgHImIplmtuw+wls9qTiEBn4JajBR5/lwYdjMqddaowWN8LYyLOI8PHGKottDz3hslweHBhBLriaDhGCFbCMczJgtbRR5gYbw+nFxfEjh5lOfjBETm5XLwndWB1V1N60hBIwCPc+43N+nLp4EH0sIcRDpqRhORyVY8OmTI7SxKCni5OAOs5HgH6RVCZ1RJ1RG/XzKq3482EJM63qLh3GDwIfWUEPLqPtLd7qda7TtneVoQa60tpmeX6mERpjczrPpfa459kWuqMBlSKA72SaRLV88h60hDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjgYRXZ2eKw7mJKiP/3t7P0aktt7VzvirkBLOefd5jw=;
 b=jilwzIfBUOvvy/WTnyaL9x40njGcEIQcrZSyJrlcs0/2BdP54p4c2+k2RQqqgLG14ZVUABtfOtleTQLyObUc0XTWLY1BQ9c0m13OWS5bs210Fsi92upJmaOIybuXAei5B3HOdnEtIa9WUIYiISUaIroSZcaQzq7G1g6SbNdrN3wv330rrVM1jaVGeoBe5d5lenjHR6/qNxq17hhe6ZHiHOsKCgXWgZYmiUsyyMXpB6g6Rg+QWp0EJr+soFwrNeAtBRUiJSuvpHUt2PFB3tUHSaf/eS98dCFR5cMa/TQ0DdXEtYKtlrN0jHZULVPYIc04XtOtAWiDnzzHp5HZjKqpaQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjgYRXZ2eKw7mJKiP/3t7P0aktt7VzvirkBLOefd5jw=;
 b=h5OvBpxCnVUMU8GklUB09GQjnEMwRQzbdWi8dqZ08BSgFQyEFTwW6eA9wf4SMeyHvBLoiySZyOI4Dr6AnvATu1w+3K7iqFPwQPPynOT9V4K4jhrfeyVMh6HS7RxDd63RhchWTw2iL1YJLIX4QzUAMEJumeGgZoZiYEBCehnuEBY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5f840a435bc7d5e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQEWCpgF5cW2G2mwzVfC1DE5xb88/cTeuV4/WB4ekR7Hm2J3TCD0F07OAnj6nco+LJXzW+gmbnilEoF5ImvPSZyeqjYKfQ/wzY3XlVl11aRneHgKYEebmnBbK+daBcbF5quOAYkhlQjDE1XVCbBIeWNTXEH/GRAhsqBQqJm4H2n6/eBaT+i/90gBdGvqFok3BuwE3j4a1usy88iVZAvAHNdoTHJUpvtaZzX37g+Edv/lcR145B8CZrjZyan4uTQkrbFpMUiE6xpvh7IdQe08ewt1lr9Z5rVjUV0aCjxd7NrfYhzgdzjft7Sf2oNj9xRPF1As2PMh9RF5UFsTp3qt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjgYRXZ2eKw7mJKiP/3t7P0aktt7VzvirkBLOefd5jw=;
 b=jB3h/nYQJ214P4lYF7JLXMKC2OqiPPqixDVUF3Ek/o2y/MqBb3xAtlL7zirHCijW5u0ZklXrVjMYPzor+54yckFjpI7E5c8fYeM9+lVQq/GzoTxzCYPBtfeQzE9UUBg2zHRK5AMVcHve9Zj7sfX/SDJrSC80ph2lqBsTbfhJC5PVc00tMwxWtztwKcKQOP1qAv6/vadguIwqiyj504a+ov1tCC4+mUf8+sB8eKd4fFlU5DFP2SaiQ5RqNDHlqnwxzHh7AZKsevh7z4EuGGz0+Y4gVLedA18xsMiXa91IspUA2fAhTWlEZiRI+0J9vH8VKKfeja2/pihw6bRh4lPduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjgYRXZ2eKw7mJKiP/3t7P0aktt7VzvirkBLOefd5jw=;
 b=h5OvBpxCnVUMU8GklUB09GQjnEMwRQzbdWi8dqZ08BSgFQyEFTwW6eA9wf4SMeyHvBLoiySZyOI4Dr6AnvATu1w+3K7iqFPwQPPynOT9V4K4jhrfeyVMh6HS7RxDd63RhchWTw2iL1YJLIX4QzUAMEJumeGgZoZiYEBCehnuEBY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayankuma@amd.com>, "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Henry Wang
	<Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Jaxson Han
	<Jaxson.Han@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Thread-Topic: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Thread-Index: AQHY3vmtdKYr9F2nyUuznJvSQYcvHq4OMlaAgAEAmYCAAyG8AIAAEfiA
Date: Mon, 17 Oct 2022 10:22:02 +0000
Message-ID: <6D2FD203-04D9-4CDD-B57D-E90F5BC5CC3A@arm.com>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <alpine.DEB.2.22.394.2210141109400.3690179@ubuntu-linux-20-04-desktop>
 <e5e337cc-9478-e4d5-e7ce-71138817f56e@xen.org>
 <2FED929A-C718-468B-B385-5C80CEED0664@arm.com>
In-Reply-To: <2FED929A-C718-468B-B385-5C80CEED0664@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB8716:EE_|DBAEUR03FT058:EE_|GV1PR08MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: d7fb464a-0c28-4cdb-38fe-08dab0297761
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9mYf0PCzMCBH3AOMGf7atIRK96jm05Ej3Y0KNtdFpBdvhlVRSHVtrquNt/ZcXrhaUM/67yi18jSxNx3iWxhd6nLC55YboQJ+pUUqw/cYKvyYSNyRh2DxYA++hCbVwv7JAp0PFPtORG33G3qpnSxRuESHVk1btaLKKtPP96uthmsXcHa23yamBcC9ienNDJWlFI7sTtzA83A55mHDG3VLoS9QpzRq12HuxrPGJmJT0pBOZPhJJQsi4DkygbssQATqEBmgP4hD3LfwewveJtEUaOeCnDGLxyuWQP8k4b1JCzNBRbxSPqtW1oo6twKoXrJjuAiAwRTwyVC8cEos4c0H9HAqc+ba/oubublrTk6DkBfwy2Je28bWkPgXHQP5kgXVqR7HtupPco78fz5PdyKwUgrKQnIYdVeNYM0uyOkftIANmDh1WVH3/TqgkmoV62st/E908aaepSA7bN4qaPgbx9AtszmqG4Z8D8FweB5XDRwY04d6imyBencxReyN9AjHHRr/AQUaW9sp/PklSPp7Oj0WBVpcZ19DSGuII3mxTFcJ9X8/VMRuj3taRS9dWjQsNYWIbBMhyJp7aTOlNuKmn39yQ2eMAS+dvvqF4vx/grhTFcsf5oRMr6d7pOEWV13erDr4XglyXMuVydLsuRi138P2/mv43nIHgCyRLHpY3cMjBKWdxGyrqhkVoY4R0iWzfEWLpvE5rxW3r+UDVERx6m+76M1LFg11JSkpsNNkL9V/JNY4M+WM4agsMaZGW+Koy6Pc7LvNlb0W4J5qlFcymJXZ9zzAFWnKu2okju9gKN+k/p3hBVxV8FP16yFxj8EYfgVPsflDUEqWZGSDQzL77Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199015)(38100700002)(122000001)(66899015)(71200400001)(38070700005)(966005)(6486002)(478600001)(54906003)(6916009)(36756003)(6506007)(41300700001)(186003)(2906002)(53546011)(2616005)(316002)(64756008)(66446008)(66476007)(8676002)(4326008)(86362001)(76116006)(66946007)(66556008)(91956017)(8936002)(6512007)(33656002)(26005)(5660300002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D7787E83003DA741B5B5F5F561C95979@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8716
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	de71c839-0e7e-4d4d-c42b-08dab0296e84
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4kzR/UP4g+enp+67XdrQ0xRBztjbgjyBbeKn/YNNZRaBYMdV4YN2ZUrwYW2LanEyCoz8tak+VQX3B74QuZzj805TPNGt4SxLPf1QlBC1mkd+mtRU5fy3qeNnTL2251XbaFqv6scVdxE1+8B38pXBLiE/8qBZEmc0j12dBJq/at2w0Zlr6sbLQfmHjzZv2tZ8++lzNROUv446VzkJYot9ExetAMKpw9XWQlyA01ahZ+k3KiLQ1EHRlmKnX9cztz9uTYlt6KYnBTaTDSqY8bNNg/ax1Jjg4R7DPF4KpxGFGi7Hvi7idqbWrrD5OrMUzouwYZYTfsJq2rhGPOY+ZiT+L6P3sw8RAhKBE0P9ZZkp8nzw5Oc6mUpR8caoPvQy70WBghBhfOQaHxz3JY1KSG5j57WHdpfuRQR2PNCUUycmUNUGKp78sJmKRTUg5bTrrOjjv+R7zbxqZKYmsriof5l423Gm5L+FIi5/g8GRryBZp/d30dhIMvCBUHWi9MN2AQZQwNicLViURiZzNWFExzhyRSrYDwZFIb4y24MFudvDWidG8Z1ELox18fxpi2lPPhhVgU4hXMo1ER/3A8lbC405YIFO3h5WgzW56Dy2lA/U86DlaJ13Nwma5p5njVEqMpu4PL3CcxjGWMBT0wC4TqAWURT1CBaHOqIsYpZmQgwzu0nGE/uOx6iNRMjNl/7w8Cu6bvouVB+37JUiE2Rk1Tx9vf/9yB8MYtHlWO9oGmBZIDT3lvWBHyTGE7LoRJ3OKnTGCefhbc/SICIyYzx19fUaG8bwG/HXdyo+XMY6mD+x47c=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(6486002)(478600001)(6506007)(33656002)(41300700001)(966005)(8936002)(316002)(54906003)(8676002)(4326008)(36756003)(6862004)(36860700001)(40480700001)(356005)(81166007)(82740400003)(2616005)(86362001)(336012)(82310400005)(40460700003)(70586007)(26005)(6512007)(83380400001)(2906002)(47076005)(186003)(53546011)(70206006)(66899015)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 10:22:16.9354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fb464a-0c28-4cdb-38fe-08dab0297761
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7780

Hi,

> On 17 Oct 2022, at 10:17, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi,
>=20
>> On 15 Oct 2022, at 10:28, Julien Grall <julien@xen.org> wrote:
>>=20
>> Hi Stefano,
>>=20
>> On 14/10/2022 19:09, Stefano Stabellini wrote:
>>> On Thu, 13 Oct 2022, Ayan Kumar Halder wrote:
>>>> Hi Arm mantainers/Folks,
>>>>=20
>>>> Please refer to the discussion
>>>> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
>>>>=20
>>>> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed vi=
rtual
>>>> platform.
>>>>=20
>>>> Zephyr is trying to read GICR_TYPER which is a 64 bit register using l=
drd
>>>> instruction.
>>>>=20
>>>> As GICR is emulated by Xen, so this instruction gets trapped with HSR =
=3D
>>>> 0x9200000c.
>>>>=20
>>>> As ISV is 0, so Xen cannot emulate this instruction.
>>>>=20
>>>> The proposed solution is to use two sys_read32() on GICR_TYPER to retu=
rn the
>>>> lower and upper 32 bits.
>>>>=20
>>>> With this, HSR =3D 0x9383 000c, ISV=3D1 so ISS is valid.
>>> Hi all,
>>> I wanted to take a step back on this issue before we jump into the
>>> details.
>>> Differently from other instructions we discussed in the past, strd and =
ldrd
>>> are not deprecated and are not "unusual corner cases". There is no
>>> statements such as "please don't use this" on the ARM ARM. If I were to
>>> write an register read/write function in assembly for an RTOS, it would
>>> be reasonable to use them.
>>=20
>> Just to be clear it is fine to use the ldrd/strd for accessing non MMIO =
area. The problem comes with MMIO access because they can be emulated by th=
e hypervisor and we don't have the syndrome. At the moment, this is only a =
problem when accessing some of the GICv3 (including ITS) registers.
>>=20
>>> So, I struggle to see how we'll be able to deal with all the possible
>>> RTOSes out there that might have them in the code. We can fix Zephyr,
>>> but what about FreeRTOS, ThreadX and the proprietary ones (VxWorks,
>>> etc.)?
>>=20
>> This is not an Xen issue but architecture issue. The RTOSes will face th=
e exact same issue on any hypervisors unless they decided to decode the ins=
truction.
>>=20
>> As we discussed before decoding an instruction correctly is quite diffic=
ult to do (what we have in Xen for pos-increment store/load is just a band-=
aid). So I would expect the other hypervisors to have made the decision to =
not implement it. AFAIK KVM doesn't suppor them,
>> Note that looking at ID_ISAR2, it seems that ldrd/strd is technically op=
tional. Therefore, the RTOS would have to assume it is targeting a processo=
r that supports them.
>>=20
>>> Unless we can get ARM to issue a clear guidance that strd and ldrd are
>>> deprecated,=20
>>=20
>> Arm Arm cannot say that because ldrd/strd are necessary to modify the LP=
AE page-tables atomically. What we need to know is which instructions can b=
e allowed on MMIO accesses.
>=20
> Definitely this is something that arm arm cannot fully answer as it is al=
so down to the full platform. MMIO accesses are going out of the CPU and he=
nce wether or not 64bit MMIO accesses can be properly done might also depen=
d on the bus or the IP on the other side (some peripherals might just refus=
e 64bit accesses or some bus might only be 32bit so the operations would ne=
ed to be divided).
>=20
>>=20
>> I think I already raised that when Ayan added decoding for post-incremen=
t instructions. There are plenty of instructions (or combinations) that doe=
sn't provide a syndrome and yet the processor doesn't prevent anyone to use=
 them on MMIO.
>>=20
>> I was worry we are going to have to continue to decode instructions in a=
 non-compliant way in Xen just to please a few RTOs that may not even run a=
nywhere else.
>>=20
>> This would also reduce our leverage to request a change in the RTOes or =
the Arm Arm (maybe there is already a statement I haven't spotted) because =
Xen will already (badly) support the instruction.
>=20
> Going back on the ID_ISAR2, if Xen is properly setting the value seen by =
the guests, there is not reason for us to actually emulate those instructio=
ns.
> The emulation code inside Xen cost a lot in matter of lines of code and w=
ould need a lot of testing (which is missing at the moment).
> So as we have a standard way to inform the guest that this is not support=
ed, we should stick to that.
>=20
>>=20
>>> I think it would be better to attempt to decode them rather
>>> than just fail. I don't like to have this kind of code in Xen, but I
>>> don't see a way to support R52s without it.
>> That's not specific to R52. This is anyone using GICv3 on Arm32 core.
>=20
> Agree.
>=20
>>=20
>>> That said, of course if Zephyr was to use two 32-bit reads instead of
>>> one 64-bit read, it would be better for Xen. And we have more important
>>> things to deal with right now in terms of R52 support (it is not even
>>> upstream yet). So it is totally fine to change Zephyr and move forward
>>> for now.
>>> But medium term it doesn't seem to me that we can get away without a
>>> solution in Xen for this (or a change in the ARM ARM).
>>=20
>> See above. This is an architecture problem and we should discuss with Ar=
m first before continuing to add more decoding in Xen.
>=20
> I will discuss it internally to have an answer but I think that the answe=
r cannot only come from Arm as there are for sure hardware implementations =
that cannot support this, as explain before.

I had some discussions internally and here is the official view:

From the architecture point of view this should always work but this is not=
 virtualisable (as there is no syndrome register) and not recommended as de=
ferencing a pointer accessing MMIO registers is not safe, so it should not =
be done for MMIO.

Linux is not doing those kind of accesses and KVM does not support guest do=
ing them.

So I think we should not try to emulate this.

Cheers
Bertrand


>=20
> Cheers
> Bertrand
>=20
>>=20
>> Cheers,
>>=20
>> --=20
>> Julien Grall


