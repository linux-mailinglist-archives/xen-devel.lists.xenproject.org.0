Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E226F6DC5
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529816.824643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZzu-00083v-1E; Thu, 04 May 2023 14:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529816.824643; Thu, 04 May 2023 14:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZzt-00081J-U1; Thu, 04 May 2023 14:31:53 +0000
Received: by outflank-mailman (input) for mailman id 529816;
 Thu, 04 May 2023 14:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Gg4=AZ=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1puZzs-00081D-Fe
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 14:31:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67515649-ea88-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 16:31:49 +0200 (CEST)
Received: from DB8PR06CA0033.eurprd06.prod.outlook.com (2603:10a6:10:100::46)
 by AS8PR08MB8299.eurprd08.prod.outlook.com (2603:10a6:20b:56f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Thu, 4 May
 2023 14:31:47 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::22) by DB8PR06CA0033.outlook.office365.com
 (2603:10a6:10:100::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 14:31:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 14:31:46 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Thu, 04 May 2023 14:31:46 +0000
Received: from 883d0a7524a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78955CA4-2807-49F1-B95B-30FAA3DE5579.1; 
 Thu, 04 May 2023 14:31:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 883d0a7524a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 14:31:39 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM8PR08MB6436.eurprd08.prod.outlook.com (2603:10a6:20b:365::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Thu, 4 May
 2023 14:31:38 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb%7]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 14:31:38 +0000
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
X-Inumbo-ID: 67515649-ea88-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtzQXUYKMj+AdmzNXO2SGo6npQB/QyLYID7bcjuPU6I=;
 b=oP6tEUcnoF8CbHfAToc0wtN77NzoY969wUUUZrDkNGo3I293WxU61tVp/d6TUVJ9D5269o7Y9yEg6ULOj0JolCj7IV9o10iY9kyiOaW65MDDenpj05rVwyac7RZvoxBe2l9F9LLuxEz6DuNtjhIL32QIUzTPXFFJ1aRI+PUU9Yg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a89e8712633c4e1c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8G18LqzIc64k+tDxq/EKlThpU8nnjlVFGJTUfTjr/n5Tb8XCQRCvbADkohE9dzJABDOAqalxCe9ITsWxx6aW6iaq4WoeiTC7c+q9CQAbr9o/wB5Id3FwH62RCFa1UqtM85FK61Wp9mb9X8aa8jZBAtWPFrYDVKQlwZ3cffAISF9m3gYYPZXoPxY+VAt4mZfyIQx/542Ac4CDHC0P9QRH4JUXWbdTtrDGiuFuY0LLFoInNRvAOamOkYnn1bMu09m49LLFOingZozRYbv+2xA5qISWu+oDffNsoYf9czMD20E/xSg/7lVrD5BoLGweCTzU859cWU779zywKmsceoGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtzQXUYKMj+AdmzNXO2SGo6npQB/QyLYID7bcjuPU6I=;
 b=KnsemLskmTl6iWxGV2GiSlZkfPNQxqYDHz7nlHVE9TEGULUQ1EM43QxrH+6JGXYeY1MGU+MAcmGr7pNxq/x4HJlMrtV+EuNxL7I9/XtxLkxEVPo8HNcWJP4Ct91kv4OgT/5PRtXjlwhlZdkhx/y4HTccdUg9zwl/hVn3bsPfZnMW4m175b3HSdfT8CJFmjwcOo0D3v65ySymdzH7Lv04/1uvLaq248JTBSDqty/E6N6qmJcPOiiziiaZJeCSym+iFbbuC27er5GApeBdrkSrqGERt/H7Rlsn0Jv1Ztf1FLAjDIKxwX0/iA4kqii7NanknJSriptkrnI+oWStukBTKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtzQXUYKMj+AdmzNXO2SGo6npQB/QyLYID7bcjuPU6I=;
 b=oP6tEUcnoF8CbHfAToc0wtN77NzoY969wUUUZrDkNGo3I293WxU61tVp/d6TUVJ9D5269o7Y9yEg6ULOj0JolCj7IV9o10iY9kyiOaW65MDDenpj05rVwyac7RZvoxBe2l9F9LLuxEz6DuNtjhIL32QIUzTPXFFJ1aRI+PUU9Yg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	Julien Grall <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>
Subject: Re: [XEN v6 04/12] xen/arm: smmu: Use writeq_relaxed_non_atomic() for
 writing to SMMU_CBn_TTBR0
Thread-Topic: [XEN v6 04/12] xen/arm: smmu: Use writeq_relaxed_non_atomic()
 for writing to SMMU_CBn_TTBR0
Thread-Index: AQHZefsV/U5NscHjSECspfoDYyGz6a9JwnmAgABzyIA=
Date: Thu, 4 May 2023 14:31:37 +0000
Message-ID: <675F9B31-1720-4AD3-932A-67D98FDDF7DE@arm.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-5-ayan.kumar.halder@amd.com>
 <c8021f4b-1607-23df-803b-ac162d9d4324@amd.com>
In-Reply-To: <c8021f4b-1607-23df-803b-ac162d9d4324@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AM8PR08MB6436:EE_|DBAEUR03FT011:EE_|AS8PR08MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc6f856-30cb-4b91-6906-08db4cac4a24
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f1/OVeizTfDOGIwcwymgm9aa+ZdQ7MwQhX3knN+zTsdCZ2v3VgDMBE8KtknyjVmTjTi6h4XIX0/bKkRvGFNO9oReqbMnAhSYYTq2Pu4KVbK3tc4HclJyGF1TKwog3ABJDZVfuC/1jyd8tNTm79iZeK7u0NLKdJeFiYznXX1NLoFlst2rEe2hp/sfIyVfs7yb9IihyauBI7PN2lCLqfD4LoIaRCPEmtB3nigIWLnqMHxsXOIcMjSjuvmbWugMBCDQnWtETFMCgLqd6LfmEQSV1HHqml1p+g0su91jAz9a+MBdW/fGnY5fki6CfQ9CWROhmWMPX7YfGyM2poTLpYu2XKy9zZKirDts1C0I5p2Yc3qxP4uV6nVghv8iXqEjT2vOpc3TMbitIRMuUC5cjKJ4omDb1BEoKsViJCsx4gnMqrI0GJI+rpC4gd/kftSWELdnsbm7NIYMVhUW+/pDrKYb9jXDMqV1qeUbNubJk0t21re8n9qkLxx/a5pyh5ZcB0nBJHgNKjNJKXUilHYSuf9dIxGewfas6gp7LEvDOFxe1f/IMcJtsK+mfvo8fktchpE505kuAsTVzvnLlpTC+hQrqg5SKZZHvmHlN2azpVW9sNZZK2JZ2vhc/Us+VuYNCfNRKc1JBno7TTpI3r+S2Z5Swg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(316002)(83380400001)(91956017)(71200400001)(6512007)(478600001)(6916009)(186003)(2616005)(26005)(54906003)(53546011)(6506007)(6486002)(76116006)(36756003)(122000001)(7416002)(2906002)(38100700002)(33656002)(5660300002)(4326008)(8936002)(66476007)(66446008)(8676002)(66556008)(66946007)(64756008)(41300700001)(38070700005)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_675F9B3117204AD3932A67D98FDDF7DEarmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6436
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd986f87-4cfd-4b50-359b-08db4cac4509
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IwS7ChGoMOHUo4PDaCMqwJlpC/ITlaB37nejg+7k1xvO8SQW87GcC398MLQAMO0FT6y5E8BE0AfV3roJSBPuK9mLU7q7PWo7KiiohrLSKKyieqPuzDZWJ77VSQSsNxkNHNmdmJj5mD4B4+julM9+u9mrlRgmGgpY/FVP5r9DTaI4rWG2Vm8G+MLpRTe6x4i5hlZ9YCqbXAZLZoi7YtnXmYri7JQym+RmxW1CRVLuFyj3L7TkmH0n0oToqdfwHpHxeuZF9ofMeCA1rXHthMx2kUk43QodP4bRG0KUtn1GUuBYIFVoMY2pTKDa5ihwz7cRqHkxzCZlbKL0oH8vYoHR6XU6NPqBSFOq+c7qIvlgRBE6L7zUKF+zWarXWtDUPMm1yrR1mnI0VnpUF5a4PejhqNht0SvVWEg/gawXVgejKPbcX/9O97dWjHmZcv2NmsIrpO1tBic6XR9yWrKq5EttnRXtaqi/MkaTIFSGTSSfDwH5P72Wn8RYxry2/sTHSXIh7m/Njvxv20uujdfcNJTvGLplkj7hJmzuXjndUfGrMQflkNrpfiYp0//7kHhwVL3y4T6vlkaOUG4m7z1e0yhiAlGAJHA59kx9JYHxM+d2AzEcBPXKyiahlOyKeuN7PkPqPMFtc3bBLYlWPha76LezPefPuMNbNXVcQFin6v5HFB3SYNreN4q88/q2wnSiR76pSm657Q0BVOO+pX78L03FQb+gZgmwr4C+2Ls7/Ysuroo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(46966006)(40470700004)(36840700001)(45080400002)(54906003)(186003)(478600001)(6506007)(2616005)(6512007)(53546011)(336012)(26005)(36860700001)(6486002)(47076005)(4326008)(70206006)(70586007)(41300700001)(316002)(34020700004)(83380400001)(6862004)(5660300002)(8676002)(8936002)(82740400003)(81166007)(2906002)(40460700003)(356005)(40480700001)(36756003)(33656002)(86362001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 14:31:46.5043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc6f856-30cb-4b91-6906-08db4cac4a24
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8299

--_000_675F9B3117204AD3932A67D98FDDF7DEarmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ayan,

On 4 May 2023, at 8:37 am, Michal Orzel <michal.orzel@amd.com> wrote:



On 28/04/2023 19:55, Ayan Kumar Halder wrote:


Refer ARM IHI 0062D.c ID070116 (SMMU 2.0 spec), 17-360, 17.3.9,
SMMU_CBn_TTBR0 is a 64 bit register. Thus, one can use
writeq_relaxed_non_atomic() to write to it instead of invoking
writel_relaxed() twice for lower half and upper half of the register.

This also helps us as p2maddr is 'paddr_t' (which may be u32 in future).
Thus, one can assign p2maddr to a 64 bit register and do the bit
manipulations on it, to generate the value for SMMU_CBn_TTBR0.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from -

v1 - 1. Extracted the patch from "[XEN v1 8/9] xen/arm: Other adaptations r=
equired to support 32bit paddr".
Use writeq_relaxed_non_atomic() to write u64 register in a non-atomic
fashion.

v2 - 1. Added R-b.

v3 - 1. No changes.

v4 - 1. Reordered the R-b. No further changes.
(This patch can be committed independent of the series).

v5 - Used 'uint64_t' instead of u64. As the change looked trivial to me, I
retained the R-b.

xen/drivers/passthrough/arm/smmu.c | 15 ++++++++-------
1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index 79281075ba..fb8bef5f69 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -499,8 +499,7 @@ enum arm_smmu_s2cr_privcfg {
#define ARM_SMMU_CB_SCTLR              0x0
#define ARM_SMMU_CB_RESUME             0x8
#define ARM_SMMU_CB_TTBCR2             0x10
-#define ARM_SMMU_CB_TTBR0_LO           0x20
-#define ARM_SMMU_CB_TTBR0_HI           0x24
+#define ARM_SMMU_CB_TTBR0              0x20
#define ARM_SMMU_CB_TTBCR              0x30
#define ARM_SMMU_CB_S1_MAIR0           0x38
#define ARM_SMMU_CB_FSR                        0x58
@@ -1083,6 +1082,7 @@ static void arm_smmu_flush_pgtable(struct arm_smmu_de=
vice *smmu, void *addr,
static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
{
       u32 reg;
+       uint64_t reg64;
       bool stage1;
       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
@@ -1177,12 +1177,13 @@ static void arm_smmu_init_context_bank(struct arm_s=
mmu_domain *smmu_domain)
       dev_notice(smmu->dev, "d%u: p2maddr 0x%"PRIpaddr"\n",
                  smmu_domain->cfg.domain->domain_id, p2maddr);

-       reg =3D (p2maddr & ((1ULL << 32) - 1));
-       writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_LO);
-       reg =3D (p2maddr >> 32);
+       reg64 =3D p2maddr;
+
       if (stage1)
-               reg |=3D ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT;
-       writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_HI);
+               reg64 |=3D (((uint64_t) (ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_=
ASID_SHIFT))
+                        << 32);
I think << should be aligned to the second '(' above.

Reviewed-by: Michal Orzel <michal.orzel@amd.com<mailto:michal.orzel@amd.com=
>>

With the Michal comment fixed.
Reviewed-by: Rahul Singh <rahul.singh@arm.com<mailto:rahul.singh@arm.com>>

Regards,
Rahul


--_000_675F9B3117204AD3932A67D98FDDF7DEarmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <341421C73333064887EE899DA89C9868@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;">
<div dir=3D"auto" style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: sp=
ace; line-break: after-white-space;">
Hi Ayan,<br>
<div><br>
<blockquote type=3D"cite">
<div>On 4 May 2023, at 8:37 am, Michal Orzel &lt;michal.orzel@amd.com&gt; w=
rote:</div>
<br class=3D"Apple-interchange-newline">
<div><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">On
 28/04/2023 19:55, Ayan Kumar Halder wrote:</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;">
<br>
<br>
Refer ARM IHI 0062D.c ID070116 (SMMU 2.0 spec), 17-360, 17.3.9,<br>
SMMU_CBn_TTBR0 is a 64 bit register. Thus, one can use<br>
writeq_relaxed_non_atomic() to write to it instead of invoking<br>
writel_relaxed() twice for lower half and upper half of the register.<br>
<br>
This also helps us as p2maddr is 'paddr_t' (which may be u32 in future).<br=
>
Thus, one can assign p2maddr to a 64 bit register and do the bit<br>
manipulations on it, to generate the value for SMMU_CBn_TTBR0.<br>
<br>
Signed-off-by: Ayan Kumar Halder &lt;ayan.kumar.halder@amd.com&gt;<br>
Reviewed-by: Stefano Stabellini &lt;sstabellini@kernel.org&gt;</blockquote>
</div>
</blockquote>
</div>
<div>
<blockquote type=3D"cite">
<div>
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;">
---<br>
Changes from -<br>
<br>
v1 - 1. Extracted the patch from &quot;[XEN v1 8/9] xen/arm: Other adaptati=
ons required to support 32bit paddr&quot;.<br>
Use writeq_relaxed_non_atomic() to write u64 register in a non-atomic<br>
fashion.<br>
<br>
v2 - 1. Added R-b.<br>
<br>
v3 - 1. No changes.<br>
<br>
v4 - 1. Reordered the R-b. No further changes.<br>
(This patch can be committed independent of the series).<br>
<br>
v5 - Used 'uint64_t' instead of u64. As the change looked trivial to me, I<=
br>
retained the R-b.<br>
<br>
xen/drivers/passthrough/arm/smmu.c | 15 ++++++++-------<br>
1 file changed, 8 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c<br>
index 79281075ba..fb8bef5f69 100644<br>
--- a/xen/drivers/passthrough/arm/smmu.c<br>
+++ b/xen/drivers/passthrough/arm/smmu.c<br>
@@ -499,8 +499,7 @@ enum arm_smmu_s2cr_privcfg {<br>
#define ARM_SMMU_CB_SCTLR &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x0<br>
#define ARM_SMMU_CB_RESUME &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;0x8<br>
#define ARM_SMMU_CB_TTBCR2 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;0x10<br>
-#define ARM_SMMU_CB_TTBR0_LO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;0x20<br>
-#define ARM_SMMU_CB_TTBR0_HI &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;0x24<br>
+#define ARM_SMMU_CB_TTBR0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x20<br>
#define ARM_SMMU_CB_TTBCR &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x30<br>
#define ARM_SMMU_CB_S1_MAIR0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;0x38<br>
#define ARM_SMMU_CB_FSR &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;0x58<br>
@@ -1083,6 +1082,7 @@ static void arm_smmu_flush_pgtable(struct arm_smmu_de=
vice *smmu, void *addr,<br>
static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)=
<br>
{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u32 reg;<br>
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint64_t reg64;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool stage1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct arm_smmu_cfg *cfg =3D &amp=
;smmu_domain-&gt;cfg;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct arm_smmu_device *smmu =3D =
smmu_domain-&gt;smmu;<br>
@@ -1177,12 +1177,13 @@ static void arm_smmu_init_context_bank(struct arm_s=
mmu_domain *smmu_domain)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dev_notice(smmu-&gt;dev, &quot;d%=
u: p2maddr 0x%&quot;PRIpaddr&quot;\n&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;smmu_domain-&gt;cfg.domain-&gt;domain_id, =
p2maddr);<br>
<br>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reg =3D (p2maddr &amp; ((1ULL &lt;&lt=
; 32) - 1));<br>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;writel_relaxed(reg, cb_base + ARM_SMM=
U_CB_TTBR0_LO);<br>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reg =3D (p2maddr &gt;&gt; 32);<br>
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reg64 =3D p2maddr;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (stage1)<br>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;reg |=3D ARM_SMMU_CB_ASID(cfg) &lt;&lt; TTBRn_HI_ASID_SHIFT;<br>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;writel_relaxed(reg, cb_base + ARM_SMM=
U_CB_TTBR0_HI);<br>
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;reg64 |=3D (((uint64_t) (ARM_SMMU_CB_ASID(cfg) &lt;&lt; TTBRn_HI=
_ASID_SHIFT))<br>
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;&lt; 3=
2);<br>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">I
 think &lt;&lt; should be aligned to the second '(' above.</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">Reviewe=
d-by:
 Michal Orzel &lt;</span><a href=3D"mailto:michal.orzel@amd.com" style=3D"f=
ont-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
idows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;">michal.orz=
el@amd.com</a><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none; float: none; display: inline !impor=
tant;">&gt;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;">
</div>
</blockquote>
<div><br>
</div>
<div>With the Michal comment fixed.</div>
<div>Reviewed-by: Rahul Singh &lt;<a href=3D"mailto:rahul.singh@arm.com">ra=
hul.singh@arm.com</a>&gt;</div>
<div><br>
</div>
<div>Regards,</div>
<div>Rahul</div>
</div>
<br>
</div>
</body>
</html>

--_000_675F9B3117204AD3932A67D98FDDF7DEarmcom_--

