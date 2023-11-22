Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954EE7F3ED6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 08:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638457.994976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5hc6-0005Yi-NG; Wed, 22 Nov 2023 07:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638457.994976; Wed, 22 Nov 2023 07:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5hc6-0005WZ-Jw; Wed, 22 Nov 2023 07:25:34 +0000
Received: by outflank-mailman (input) for mailman id 638457;
 Wed, 22 Nov 2023 07:25:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d996=HD=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r5hc5-0005WP-5g
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 07:25:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51295842-8908-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 08:25:31 +0100 (CET)
Received: from AM6P192CA0027.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::40)
 by DU0PR08MB7565.eurprd08.prod.outlook.com (2603:10a6:10:316::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 07:25:22 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:209:83:cafe::33) by AM6P192CA0027.outlook.office365.com
 (2603:10a6:209:83::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Wed, 22 Nov 2023 07:25:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 07:25:21 +0000
Received: ("Tessian outbound 26ee1d40577c:v228");
 Wed, 22 Nov 2023 07:25:21 +0000
Received: from 77c170e0ade4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2BE1A6AE-360D-4102-9F74-46EA9C8BFBF3.1; 
 Wed, 22 Nov 2023 07:25:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77c170e0ade4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Nov 2023 07:25:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB7854.eurprd08.prod.outlook.com (2603:10a6:20b:51d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 07:25:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7002.027; Wed, 22 Nov 2023
 07:25:09 +0000
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
X-Inumbo-ID: 51295842-8908-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fkOmPtoFu4V+QwDOXpUSI67hw+W91eZy+8yfhwv7zuxc6CYNF3XKC9prWZdbEGGhC+niRDOWCtCpeDR2VQ2G2ltfdL7Kd6VauQQTBb9WjaoE0nk5Vf43WqCqH0LC8y4eKHBD+2A8ocot63CBV00CDm3vOuj1oZ1XZWcpkFdUW/AjwIBoc/J9RSbNO9yLfhivP5eYayBc6x3bkhX/WwNxOOVLxyqxM0G+m39maiicArlTo2ueLJ3i8Q/FZkYUlY064CQ3LSMekOIU79yN727i6+jfxulZmVCYBlCwYsWBXnlgZN9sEWkMnw3EYgkJpd1eEmjuJ6oPxRFGlaY6RDGlMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwkdA+/UVLHP0vBZBpNmKdGXKJYSDcxN7vw+GbZDFg8=;
 b=fSAWVSJjrVHf5RlCgnLnp7aH1beJukNs0pF14u31Yz0e9wpAIZnQHQWJ84HjDgR+sxZCLvLR5nL9GfdAe4nksNPnSIeDUD4LskJkatkOjkKyxDzL3JTZ2vuZqwz0v8TfcwoFF+Q8Kz+ggIUBbv6+ovbB44dP9Aul3kcRi6gZ4b+UylPPgwjAibCz54Kf5+njGbQCDpqODPrCZVIQHzeE/rz4wZu8WHn8VgEIQSw42cQa838s9TS1D/klstPm3oMPfHkjMr5cm2zRk+gxNseKIVsMBtmOI75LCMRpxLb7eG4SKrZo7jasfgBkMocGOXDW7ZtrDTVD3LIpC68z8UZWQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwkdA+/UVLHP0vBZBpNmKdGXKJYSDcxN7vw+GbZDFg8=;
 b=tlbpfYPtNuQNJDRN7q8BxbTWwZxCEOvchXAOOohVmtWYepY7aJlVu5i99NytU6VJRF9foh5Pk50Ek2gqfL6vLgEnu3qD6IlOVYCJDL6Z2JjjJ4BYkWhB2+yug6kUxKBu2kqpKRbGg3yk9+G1V783suwH61qP+jyXXL3Z85EFIyc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c77d31cd0c372e56
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KL+OaJGlaJ9PoPvqDfjs6fOVrGb2+d5wo3ZZIM+6j/Yf4ODx7FhxP336mB5e7lLCOoQsu8zHwAVt4BGCMdsjddryQmKpn4QxCGcf6Os5MfZsYJDHv6rAQ3/m7Z1sQU0NX727azQVeHQ5aX4yD2pq5kLUOdg5ED4EN1KufgulVWPrVzunLxdLGd6px/Yfns1eD859QyS8c1Hxqx03VBKLOl2NlttheWQm9+6Npl5yljTAE/F46X+/bMPGshx4n8F2Uau81Ya+5lYvQPXdflqO0DLV0iZna2GoqlADzW8R+3pHwIGROABpkN7rgKnjb6V/KZsC6aVMSe24v/8faHv76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwkdA+/UVLHP0vBZBpNmKdGXKJYSDcxN7vw+GbZDFg8=;
 b=KrcRYMLpH/eEZMfzb4vrPsVoPey6znF0RzhM/GrMgWjBRVs23v9Q1+ipSkHDlqVjZTx1FN9ToBimwYmquvcrWndnvSnx+ZGH7yI8OPRehdLJaAj06YJyIqtX13YEQcf46KsIjuCKD2/43NtX6zxrTO58r5kh8shgfVINJbSZBX9lKG04AEZroCNVyoM1QFrPmLDJSJsE7dGx/JDUHvWRd071JXe9OG/6Xy9M7m+1LLw6ZofWS21xFSpJ1ZMyW+miYmOECHKMPriRQeBrJm9/m5IDoYrppurkufwIs08MhJ9eQfbwtP5Ab06HKANUBQD++KKHk4koTmQd6jFGRvyd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwkdA+/UVLHP0vBZBpNmKdGXKJYSDcxN7vw+GbZDFg8=;
 b=tlbpfYPtNuQNJDRN7q8BxbTWwZxCEOvchXAOOohVmtWYepY7aJlVu5i99NytU6VJRF9foh5Pk50Ek2gqfL6vLgEnu3qD6IlOVYCJDL6Z2JjjJ4BYkWhB2+yug6kUxKBu2kqpKRbGg3yk9+G1V783suwH61qP+jyXXL3Z85EFIyc=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v2] stubdom: remove caml-stubdom
Thread-Topic: [PATCH v2] stubdom: remove caml-stubdom
Thread-Index: AQHaHRSAQgxp/yEYoE29tMVtjHxyKbCF79SA
Date: Wed, 22 Nov 2023 07:25:09 +0000
Message-ID: <B6CE7706-7417-4EF0-A699-93B97ECBD247@arm.com>
References: <20231122072110.22413-1-jgross@suse.com>
In-Reply-To: <20231122072110.22413-1-jgross@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB7854:EE_|AMS1EPF00000049:EE_|DU0PR08MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a15f0c-0df3-4330-fb50-08dbeb2c2ff9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iqyiDlty5bgJDieniUWjQnbByuSkOOfm6jUqA/flJ6KUatNLoMD4KNbmy1xCZyLQa/4J26QfhYDGn74QiEoeOrgw0o9UWQAglgm9Z7d+pQwTSCzkANFz5jCTyEZv9SpuJmpSoyQlWaCd6MCYHG5AYZXx0ojYPgMMjl3JrKT4MztEmIx1U0+pInZHoptVTy1kYjbR9L8h67Fdv224cAC4FFw8UJ9+vNckhe7Ir8kVxxAJ3/wfyh2PKqyNbrawnB3p3g4Ap18yoem7kUKgMcZ2uEfV+vp20KWR4KJ2TkmQqLOSvmL6doiBhjOuG0IsHxoD2N+pZ5p+pqdYwYJcunLWcfFrAhRdo2cIBDeC+4fqMnaUzootjKu55r+N4q1/rOsXIAKMpofFlYy9YOULCVvW7Jdql9QprWQ+BzRThy4bY24DtAZEFXrUrZsXUlAu6MsimI+lQVflAx8xacOT51w1FqtJI9PdYpEGtiCOJSB7bLP68VO1+ge+w8vGGakVI2Lgcda3pn2r6p88nmxXj+QJPdVgOtZ/Xw6ws+TiZ3fIG8Swu5tLdobBVnjPcX58LNs46U7c0T4yTW1CrUzHe/ZsODJ1BDJS4LZ8eGAi8iIqmIJOrkt2bVgoy1AxEGyw9ssePVz4vVn7TsNpemd/+G4saA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(5660300002)(7416002)(71200400001)(2906002)(4744005)(6486002)(478600001)(4326008)(8676002)(8936002)(66556008)(64756008)(54906003)(66946007)(66476007)(6916009)(316002)(76116006)(66446008)(91956017)(86362001)(122000001)(41300700001)(83380400001)(33656002)(26005)(38100700002)(36756003)(2616005)(53546011)(6506007)(38070700009)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FF2B32D9D29F07468D20FADA29B0D4A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7854
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	62a833c7-78b4-454a-31ee-08dbeb2c289d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/uX51REubECGqX3HnidJWix5X0rBYXTCPeCUJZqpmKugvroHIT75hhmWlkEbI1KPA77sVzNBCQnUrDU1XQyi+daoKBR668qFl+i5RlI7czBPinMUjIV5SXTCs5aW8kQoTNEcq5oQLwU4R0SDM/Ni+dRUFBmAyowuI9pipEwFUjzUWeZUwRxnzG9XW+5VwZrIrCRn9ZsuuF8c06sERrFdrvRG45dg7cF5kbZPUJ1mByndtB3AXCjiafQ1zHaz3ycNVdHVcd/TPRwpg4RnbKBQexF2ijxZ/Wsx0oYc19znhwNLF5o//wHRKAqOQWDPxMFp72iNS4reEQKOtjTWgHYeaQhAi8zpdH6F7582r6/UYPLPTblLemJFeIGGBWIpyPKtX12+wtFmd2W18sbxnmEbLQvgkwlPWvc6zpN9nFn5peVRDPkA1vPiAOzxNB4PJXkbcjRMt9QrrzgCrWvG7Lyi8pfwG2EJoHs+iolkZhWJvR4iXGSaMykf9BiQh0FFBEemkRQ3+9weXvosVIrDwrnohvH/VUD+r4+yAD7bO+3W2j0nqOu1Pdy7UMLcaai4Bgav2qa6Vxe/btoundnQBaibGTPNCEHS8GJcSYqdJVqlzYR+tiJVqz0VjHY+hcRKBSKvNMfQPIwMgrOkijKteU8pxcu8Pg7SE2cCvbJgR5ogbNh8P9VYqeQsFCfHqGHzf/n0isYX9WTnTF2VCVv9WhfUJg+kE3GHQquG0mvJ0hCjkp1+bIPJZwmGwegX5COsQgUB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(40480700001)(41300700001)(2906002)(4744005)(5660300002)(6862004)(4326008)(8676002)(8936002)(316002)(54906003)(70586007)(70206006)(26005)(336012)(2616005)(40460700003)(478600001)(6486002)(6506007)(6512007)(53546011)(81166007)(356005)(83380400001)(107886003)(47076005)(36756003)(86362001)(33656002)(36860700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 07:25:21.8588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a15f0c-0df3-4330-fb50-08dbeb2c2ff9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7565

Hi Juergen,

> On Nov 22, 2023, at 15:21, Juergen Gross <jgross@suse.com> wrote:
>=20
> In order to build caml-stubdom, it must be explicitly enabled via
> "configure --enable-caml-stubdom". The build process is failing due to
> stubdom/ocaml.patch failing to apply. Since the patched file has been
> modified in 2014 the last time, it seems nobody cares for caml-stubdom
> since at least then.
>=20
> Remove caml-stubdom from the build system.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - add CHANGELOG entry (Andrew Cooper)
> ---
> CHANGELOG.md             |  2 ++

Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG

Kind regards,
Henry


