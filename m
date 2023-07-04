Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401D747469
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558439.872537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhKf-00086l-SZ; Tue, 04 Jul 2023 14:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558439.872537; Tue, 04 Jul 2023 14:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhKf-00084s-P7; Tue, 04 Jul 2023 14:48:45 +0000
Received: by outflank-mailman (input) for mailman id 558439;
 Tue, 04 Jul 2023 14:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGhKe-00084m-Nc
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:48:44 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe12::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dee2ea4e-1a79-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:48:43 +0200 (CEST)
Received: from DBBPR09CA0004.eurprd09.prod.outlook.com (2603:10a6:10:c0::16)
 by GV2PR08MB9302.eurprd08.prod.outlook.com (2603:10a6:150:d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:48:37 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::89) by DBBPR09CA0004.outlook.office365.com
 (2603:10a6:10:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Tue, 4 Jul 2023 14:48:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 14:48:37 +0000
Received: ("Tessian outbound c08fa2e31830:v142");
 Tue, 04 Jul 2023 14:48:37 +0000
Received: from fbc562dba8b9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CBB86CB-9F31-4BCB-A7C1-1E8A27324675.1; 
 Tue, 04 Jul 2023 14:48:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fbc562dba8b9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 14:48:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB10155.eurprd08.prod.outlook.com (2603:10a6:20b:62d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:48:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:48:29 +0000
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
X-Inumbo-ID: dee2ea4e-1a79-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLnOFhqSItkLt5xxwjGEwhD+ES50PHx4ePZo0o7xazo=;
 b=otqziaZeKDKuijmbzvL0ueVzCYh3SPLWqfHg7N5rDlK+oglkXcPzojr09wfGV2HV0AnIY3ZVP/WCqe4KmT+XQhjuWrVsYfNqLZPm+igK5ZPCP8deQe8dK/66LbPQL62LnhjaTn/1T/r6c36mNMJQutAaxlvBXYsxTErTyRDm4XA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06850714c190bafc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahAEHsXj0wZ2ShNu2SvMcoaTb9+edd2GpMVjn7NtdHmPmzHqD8oNMzA0s38MLXaCTxKPZmUNPZvoVNES9FN9fiYP1JOfV+r5KAozLnkPr8fJ36qaoNlb2NQqQI4COUU8anMr1HcYn/i6tsmELaG1z+gpB2ptujQ1CZHB27VNKG8yICLzOq8nBac0d4rhjE27ea6zmJhY0M7tOWfNs6/7e8ILvKXa8wKQc5gBTbSwRUW9XDzlO+auYMTAQC4BJkFizIUvo0CfYuZ6muQeId7DqFo5GrKN6WwuZ1mPkMiS3zMibDROePeySWjID/aCYn4K5fXkwBnc+mexy4U1m4QbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLnOFhqSItkLt5xxwjGEwhD+ES50PHx4ePZo0o7xazo=;
 b=fuc5xgZQMjkwiB6rEakDKUDPxW5XB8Sz9Y5zXJZ7HR5i4Akr36D8O1/GTJqEh14DRyNL+E4t0jXpnoIGS1LvJoN+PHJdEjD4K/zJ3N+1GM+pYa8rrcJF2anuCcp7pbCjOmDLr/LJH0qLzfaNn7sEdD4eqHssX++H8zham/yKrn6OtoO8IVeU2PsQJ/sP3Cz1PU3YhVWRLOmTFYpyfFZkJLZw97H0okDm+ZDR3G5yf+NpeOi9jYaihCth+e1FgyuBMeKYb7wpovOpqBKDW/a8cUFAzF/Xx2Uki4ZpewLuJ8Pq+UBoGNsOcIxmO/6pxCuC+eBbZ/9/HYAep7BPaUGmdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLnOFhqSItkLt5xxwjGEwhD+ES50PHx4ePZo0o7xazo=;
 b=otqziaZeKDKuijmbzvL0ueVzCYh3SPLWqfHg7N5rDlK+oglkXcPzojr09wfGV2HV0AnIY3ZVP/WCqe4KmT+XQhjuWrVsYfNqLZPm+igK5ZPCP8deQe8dK/66LbPQL62LnhjaTn/1T/r6c36mNMJQutAaxlvBXYsxTErTyRDm4XA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, Henry
 Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/7] xen/arm64: head: Add missing isb in setup_fixmap()
Thread-Topic: [PATCH 3/7] xen/arm64: head: Add missing isb in setup_fixmap()
Thread-Index: AQHZos+3AfbUxPj7/Uqgb3LGizDPV6+px4QA
Date: Tue, 4 Jul 2023 14:48:28 +0000
Message-ID: <BB7C8967-765A-4FAB-BFA1-D6DE5CA0CA85@arm.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-4-julien@xen.org>
In-Reply-To: <20230619170115.81398-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB10155:EE_|DBAEUR03FT024:EE_|GV2PR08MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5b482b-4b62-4c63-c118-08db7c9dbfc5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qSEa4yZ58G/OCH1UOxrg9fbKIVOGAteSjOYd8wUd3QstLXtKbuZonpVS4mCxA/85uFokkdv3b/V6Uu7hAKtpX+nT7CSnS8hWLT9yrqxntltjUtivsZ1UGeuXDejIsY5Ifr2p1aByhfzttVrkFVcLHzRcHlNUo3/88iVpvdJYs3TlB1epddVisBa6ICb89+UZQQ8d5BsvN/nRJehhZEuMHn7rTqGTj0LBOQ+ynb4GJRblSJwnzmQPqnq31Yxasru/NkpA9xoqcnW6b4UqRK+30KnShJOSuq1/jv9mDJqxSY5kPrVbAPlDJM04nScnFStAOgNh7Q64Q/0jqNc7BS+aK1bq6mGJ1rL1xHOwdLMo7GJZUuCg9A960EFNv8yfyFDiN/Vn4Mcc68195yNxFq/9nHQf55JZmoE6e/9w3UhLYnAZMW5vjp1dKuvhSKO8qIvBG2V2gRit56qwZ4eWsifqb8/Y3lTpaako6CbWN2Rvp62D6fjRzSK1im0ID5fr12VTkvAAnZXVjehe/OanijC/W1gxmjzoN4g/52HvClccNoYqYrrPXERfjXmuH+kSwixaAHGR3YDRLaYtZOAPWzGF764P17cAa1msCp1rA+6XQd4PszIxbZwZi9D5MhYAZgg+mw3QfmEvF/vVtbevWci7Ow==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199021)(186003)(478600001)(6512007)(53546011)(6506007)(38100700002)(86362001)(71200400001)(2616005)(91956017)(6916009)(54906003)(4326008)(66446008)(76116006)(66476007)(64756008)(66946007)(66556008)(83380400001)(316002)(122000001)(6486002)(5660300002)(41300700001)(38070700005)(2906002)(36756003)(8936002)(33656002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <06A96F0C47109640A34971FAE6F24ADB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10155
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a1f1fbdb-4ddd-4059-3d8f-08db7c9dbac1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R0UvdW56YYpz/kSOBwJNMy1WQLOlKzSQf5wj9oAWHR5mSvqo7y/29PWHFAUWkAvuTmahC9VCFywfKZ3X1K/dy+zuxIlPCSobM2VAb4/mnEIAhPR4JV1HtuEGdFEslD8BfyF1Dg2jKDO37LxGD88N3JzOs5Uc6shzBc+E72e1Q6epsRBbfadoc5vJrNxjue6EAApUaV3IXZQMmf/r4THBJTEIkYfT19DgushVoTTkG1qz7ZoHxF0Qd7+8ow+vaBv31L5xxJ8bzxrLoTiB+fkFkM8uEz6y/RQw66FkUtOd9kMiiB678YLn2FRy8nncNp/7niu3bMFYuXefSAsg/tMAUGpbdjWDsVQSjDumR0XbiKa5GudJZpXi9990wnTvzyZLbzcVYiZzwnhVWwaApkeFrtQxjylEckZ0AuVly/mMAv9TDwg4UmygJAXk+tWwabJlCoCDDcVmd3p1gA/AAmKB//a09jR5ViYDyU4ZouAIlI4CFtZsXR8RgBgZy8rVia6RDlDvNxoA/tH0MDJ40qu/gbOjXmNeL1xpQKpLj7Cv4/Q89YFL4Db597JJfhfQTfDW58tVaQKVYj8jJJnWypOUflVcsJZ7rB70Jjx1JsSy4UzoH3WM7y7bHs8VNPPwVms8XN3x7XODAwOb4O92Tt8Iy6I1PWnWnnS7d9HiRGoqTr9X2Sk1tjt3xCoRW00G4QdK3Mq+EAlqCuaHX/yWNvjx8ocT/p23ODkG7kfNcrnhMVRNvpmr6IRw5r7GFtmvxWHV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(107886003)(26005)(478600001)(6506007)(82740400003)(6512007)(86362001)(2616005)(186003)(53546011)(81166007)(54906003)(4326008)(70586007)(36860700001)(83380400001)(356005)(336012)(6486002)(316002)(70206006)(47076005)(8676002)(8936002)(6862004)(40460700003)(41300700001)(2906002)(40480700001)(5660300002)(33656002)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:48:37.2175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5b482b-4b62-4c63-c118-08db7c9dbfc5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9302

Hi Julien,

> On 19 Jun 2023, at 19:01, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> On older version of the Arm Arm (ARM DDI 0487E.a, B2-125) there were
> the following paragraph:
>=20
> "DMB and DSB instructions affect reads and writes to the memory system
> generated by Load/Store instructions and data or unified cache
> maintenance instructions being executed by the PE. Instruction fetches
> or accesses caused by a hardware translation table access are not
> explicit accesses."
>=20
> Newer revision (e.g. ARM DDI 0487J.a) doesn't have the second sentence
> (it might be somewhere else in the Arm Arm). But the interpretation is
> not much different.
>=20
> In setup_fixmap(), we write the fixmap area and may be used soon after,
> for instance, to write to the UART. IOW, there could be hardware
> translation table access. So we need to ensure the 'dsb' has completed
> before continuing. Therefore add an 'isb'.
>=20
> Fixes: 2b11c3646105 ("xen/arm64: head: Remove 1:1 mapping as soon as it i=
s not used")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/arm64/head.S | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index f37133cf7ccd..4ea64e70997b 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -769,6 +769,11 @@ setup_fixmap:
>         create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
>         /* Ensure any page table updates made above have occurred. */
>         dsb   nshst
> +        /*
> +         * The fixmap area will be used soon after. So ensure no hardwar=
e
> +         * translation happens before the dsb completes.
> +         */
> +        isb
>=20
>         ret
> ENDPROC(setup_fixmap)
> --=20
> 2.40.1
>=20


