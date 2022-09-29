Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3535EF41F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413647.657424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrXC-0004BV-I1; Thu, 29 Sep 2022 11:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413647.657424; Thu, 29 Sep 2022 11:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrXC-00049G-F1; Thu, 29 Sep 2022 11:16:54 +0000
Received: by outflank-mailman (input) for mailman id 413647;
 Thu, 29 Sep 2022 11:16:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yp8n=2A=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1odrXB-00049A-2W
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:16:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32834d9f-3fe8-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 13:16:43 +0200 (CEST)
Received: from AS9PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:20b:46a::15)
 by GV1PR08MB8258.eurprd08.prod.outlook.com (2603:10a6:150:89::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 29 Sep
 2022 11:16:36 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a::4) by AS9PR04CA0045.outlook.office365.com
 (2603:10a6:20b:46a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Thu, 29 Sep 2022 11:16:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 11:16:35 +0000
Received: ("Tessian outbound 86cf7f935b1b:v128");
 Thu, 29 Sep 2022 11:16:35 +0000
Received: from 83a413327a4b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BE80D890-6B86-4121-8D1A-B5E767AB51BB.1; 
 Thu, 29 Sep 2022 11:16:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83a413327a4b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Sep 2022 11:16:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB8PR08MB5402.eurprd08.prod.outlook.com (2603:10a6:10:11b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 11:16:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%4]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 11:16:27 +0000
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
X-Inumbo-ID: 32834d9f-3fe8-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NikX2UhJ6u9tmNp4B4/jqkLUo3DmAs9MxTjPKorpQnDEs7qpoE9VrNEARYhc2S01eMunwK2gOKzukI+pRnCN5KnEcK+sQ7zQ/ygVsDL6jV+gvZL6JUTjEvIkrzJ8kPVkTFEZUImLgzh/zAvzpE73b2JjgLx2ahwFD9LlzrJky9GmI6/KEcRLlTb/13yaGnml56NjIBDdimGQ+TF6NgglYcNojltrmoSiqXFBjLiVSb/xCpdNSZzJmzsXKKoxNzK4VblXfv/s+0xnSUq3qj1o0UoWCIEuFLO6nxFzebpt8kP9I1C59cHE0t4F0KuMjpLTRs7rom+dW6VXff3xJkr12Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nue1Q+h37LMaipuMDMdJFIXXqxiH4nrmJDPBE8izBvw=;
 b=OL1lcyuOSF0tOu6HGXvbjP3rDV1Hz6Ag3mvnVqYA/4FeKTmk92LjheG/QHAMQO8zoBPcEKZLPBRIjEcN5bF7T4/BsEBPG3K4TuisgZyJcjVOZrVjoScbJxZNl6keJ/3A6D3ginW0ju0/rdOfbTxdt2lmeXOz68nGoEDRxkN2XKn1FG80wWof5ox2+a8M6a8y0SC7ylstENrgGeFB108mUhqLLx8eRG/iedBqgjCN9/BSwGjvQUcUjrGHIqQzABHzH2C4q0PdOYwoo9rxW7jdllr1XYML7i++PlrzLFf7m/vY72j49Le1mGH7tLZDrSjLtthDWDDae22+HiRL0UTIvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nue1Q+h37LMaipuMDMdJFIXXqxiH4nrmJDPBE8izBvw=;
 b=Vzs87Tqh6Bk5QYm+8Y6Zs9XQBYHuJPjgmAyjq3NiG1Y6a0c2UQxm4qPMlEnAmLJLiS34nBOaV8MgmmRN7JsnQQxTqn8iAYN/egctEpUMrN+ToMKAvGHx7oBkgoO8Ul+esna4qBN7eMxvhqgkeGCTnqndqZOYUzTe83IQh93VRlw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IX4Xo98LkfbjBU5fbbJx4G8JbBdym75wD8HAYhQ/ypEsxhzVXmCEWtw1dMgocxpb19asjvx+8vLdw2i4pK+nw0CqNv39B5X4N1OMv4MFvCUBxLOMcenJ7Vc33w+nD6y4eUHrTwJlS8XmqWAgUSGZ82+z1uHFRK5iO3KL1tgezBb0COLyP0Qnm1EvTNLuuDHYi7hTLvslFO65RYSNdxs1Eu8xYXuoxQYJ91eKEHook0jzCdpOfflDJSKRCI/yrYp/lYm2TpxGv33qa1WtC06gvlWX0q7lg0iWEhltwVwtET2tqQ+Vccs0wzdJf3mb2UXXsXUqhGoEWALPcXEi5S4mXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nue1Q+h37LMaipuMDMdJFIXXqxiH4nrmJDPBE8izBvw=;
 b=PYNCwImi9+Hr1G3NT5rak4q1lKhCSdqKO/uEoj3D7nOxKfAuV6oqqVrhciEaJOCH9Kg+wB8Tkol3PSzQzInqMMfDZfhl0lMgotu9qEZpu5N6rlcmGQgBf7MGTuqNnFtEU9GxUGuA3RSGxd5x3lOGrI/haY3pqsEx7ECuJxfqazDZCFrAn2oe5c7y5bHF3o1jxBD7CY1arrihFY13bD4J8th+Aep8GXpWBwQllIOlVofcadUWmRDcH/zYznFs43V23uSEU4fcQPut35gvUbkeB5QRcBYwax8HXbQVGwopDDx+yPwdHo4XrDbCKOfY3ZuSJwTC6LcV/wyNWcnz8XXN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nue1Q+h37LMaipuMDMdJFIXXqxiH4nrmJDPBE8izBvw=;
 b=Vzs87Tqh6Bk5QYm+8Y6Zs9XQBYHuJPjgmAyjq3NiG1Y6a0c2UQxm4qPMlEnAmLJLiS34nBOaV8MgmmRN7JsnQQxTqn8iAYN/egctEpUMrN+ToMKAvGHx7oBkgoO8Ul+esna4qBN7eMxvhqgkeGCTnqndqZOYUzTe83IQh93VRlw=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: RE: [XEN PATCH v2] automation: Information about running containers
 for a different arch
Thread-Topic: [XEN PATCH v2] automation: Information about running containers
 for a different arch
Thread-Index: AQHY0+kahUHESaJZ20SwAAiPmBTh5q32QMNw
Date: Thu, 29 Sep 2022 11:16:26 +0000
Message-ID:
 <AS8PR08MB79911E70613EF312933D3DFA92579@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220926135838.47330-1-anthony.perard@citrix.com>
 <20220929095131.61034-1-anthony.perard@citrix.com>
In-Reply-To: <20220929095131.61034-1-anthony.perard@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 363FA94BFAB6ED4D8BF0A401152DAA91.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB8PR08MB5402:EE_|AM7EUR03FT023:EE_|GV1PR08MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 209b4fb5-67d4-4319-18cb-08daa20c1271
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C+Udl+Ty3c1bObCzEe5gYObfEgpYTZdUjhDRBKThbopgpN3esaiBQf/5/Zk0n+2K/UM37u4XSygONQdxAgH2GcyTSnIV/tkAVH2tWZRHvIEnzD2nmtGqYL1XBxB0qLrssQfcIyoIK58FLpd/aay+A1nVMutGL4ly1AzgR0KoQhU8TSvbjhjVOylePZfrX7z9bpdoX+bH8sD7SR/AqPxUDti7lrYFVfaf03RcS8ktpoCdTGJMXGU6EPYLLUy/9KS/wwGlqkX839BhTAO1nzUjHpzP3FaK18PFKxNdu8ABuH4G0cEjILoGiuS+kHGb9pMdtqiThswmns5I3vQxN4wGwMhgMvR9HQD9ZYqVGRcxv2oYyVBvYzxwdQgBX1bvMRI1JjzTpcJPAskGwp1WIJDJ66LcvOlJCVBrr6OR/3fxAjcEbxCgV53EJA0q/drGizJ2JxQhcVf1kaROpEhfxJ9uQIdk4Am9/NV+1TQK5Qn/2oaiw+XqcJvUSi2p9nnUxPCrPuxmVtsjZN5+8982EvZ+Vccz3bO9CfrisDKtM4eaBQbLDX77VXz0L4R5uaeA1rVHglJiwJkGFXVcN/dMyC2MB07U+qUVffVyp061zEZsivqsq0LZRJSgchFDh6sno8J7/smIceyhjyOoS61dI7g6qFUD0G0RN/VEyS+n2uUirIgTgBlysILxoUrf1GI8lFLnp1gwM6k++1OmXWjJIgTT2FsVePRikVoVHjEZnO1TbZdT0EminJK8cSdRtd3DIEZ6nlmOHnDPDJq/mLOQ7ffAx9M1hSiOkterv6E9w4xwlZoGRERPjE6wbtaJ/Ix2WtKa5fBnSWmJZQx3rlNJ15OPWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199015)(83380400001)(122000001)(33656002)(71200400001)(38070700005)(38100700002)(186003)(86362001)(478600001)(966005)(6506007)(9686003)(26005)(52536014)(7696005)(5660300002)(2906002)(316002)(76116006)(54906003)(110136005)(64756008)(66446008)(66476007)(66556008)(4326008)(66946007)(55016003)(8676002)(8936002)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5402
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba2842e4-624d-4150-3f74-08daa20c0d20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o4OpQMzqnSFV/TdHlTyU2ugdMyLqZz6BaI23MX5+oKgesA850oPrtd3TAwE1QaIv4vPBrqkryfZy8tTVi7DpqAifNd/G5mEPlCXdollk5ki38MrNP00I5Brc3i9dCULPx9AxPdEQ0Uy5MlCxkAmP9edwgNeS1wAvfynCjYZ1s1AfscebdQrXBzA8F5RXmyoJANCUFT9LP3G4UG6mZTJ6X7lhlwNBwYk6UIpqTtkCh+614dRaRMcTj4co5PUI3u7Fe7G8wMz9A9YjNAxJ5HIAUQam+nx8ZSQf8oxjH8aEsebSr9y+bd6ktH1jW5/FyiVxzEZtOwAt6Uo/8fLsB6WEafMVoPK17FgczYRKwf7JTzg2YfLn+9NFzZzNTiU55/TyDS5YtAu6yj4p1YyuQLe/6Q6b+N3tEvcecyUtqpX1jCKfVq0UNSotQ3SP5sY5iIM5tZXt8E81u5UWH7dUUCMUbZBTDt8HPyp7HTjjaUb94Kq1dbr77K8da3iKzcAdWOSeFfXYkqsov1qrsBB3pf4sqJYDIykgIr87EdYolgED87gBLPZhohgR2Ls8wzt8Q4+VmkoCBlVxFm3iWIn91pvDH10dSPVAPnzjP+HqiUCOU6l3PDPwwHQQhl0H051QCaJ2ZvC/ZOHUSTasNd3bKJN9Z3MGUxa7k0/Mub9NZkHGhMLVwGuahW8LstMMr5gVT4vQX4ISK8b51bSsBvmbia46H8JFlSFxo9iTw8ag0k9eK45m04ooVC7YbVHAYKSShp1NbKkrQxhk2zw58HBnCn+X1x3ikFIu52l47v6cyQjEz5gtsfN5TOpBFemQTMzCE6eYO+ikq1l1x2/4cdL8nSsuGw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(107886003)(110136005)(40480700001)(33656002)(82310400005)(55016003)(54906003)(41300700001)(86362001)(356005)(52536014)(5660300002)(336012)(47076005)(8936002)(966005)(26005)(9686003)(40460700003)(4326008)(316002)(478600001)(7696005)(8676002)(70206006)(2906002)(186003)(70586007)(36860700001)(81166007)(6506007)(82740400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:16:35.8430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 209b4fb5-67d4-4319-18cb-08daa20c1271
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8258

Hi Anthony,

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Subject: [XEN PATCH v2] automation: Information about running containers
> for a different arch
>=20
> Adding pointer to 'qemu-user-static'.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

I didn't see the for-4.17 tag in the title but I assume you want this
patch to go into the release since I am in the CC. Since this is a pure doc
change and everyone can be benefited from this, so if this patch is
acked/reviewed by CI maintainers, feel free to add my:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
>=20
> Notes:
>     v2:
>     - reword to point out that it's an x86 thing
>=20
>  automation/build/README.md | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/automation/build/README.md b/automation/build/README.md
> index 00305eed03..4cc1acb6b4 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -102,3 +102,16 @@ make -C automation/build suse/opensuse-
> tumbleweed PUSH=3D1
>=20
>  [registry]: https://gitlab.com/xen-project/xen/container_registry
>  [registry help]: https://gitlab.com/help/user/project/container_registry
> +
> +
> +Building/Running container for a different architecture
> +-------------------------------------------------------
> +
> +On a x86 host, it is possible to build and run containers for other arch=
 (like
> +running a container made for Arm) with docker taking care of running the
> +appropriate software to emulate that arch. For this, simply install the
> package
> +`qemu-user-static`, and that's it. Then you can start an Arm container o=
n
> x86
> +host like you would start an x86 container.
> +
> +If that doesn't work, you might find some information on
> +[multiarch/qemu-user-static](https://github.com/multiarch/qemu-user-
> static).
> --
> Anthony PERARD


