Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA274748B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558458.872577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhPD-0002pI-9k; Tue, 04 Jul 2023 14:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558458.872577; Tue, 04 Jul 2023 14:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhPD-0002mD-6J; Tue, 04 Jul 2023 14:53:27 +0000
Received: by outflank-mailman (input) for mailman id 558458;
 Tue, 04 Jul 2023 14:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGhPB-0002m3-LF
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:53:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86cd72e6-1a7a-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:53:24 +0200 (CEST)
Received: from FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a0::6) by
 PR3PR08MB5754.eurprd08.prod.outlook.com (2603:10a6:102:91::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Tue, 4 Jul 2023 14:53:22 +0000
Received: from VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a0:cafe::1d) by FR3P281CA0167.outlook.office365.com
 (2603:10a6:d10:a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Tue, 4 Jul 2023 14:53:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT016.mail.protection.outlook.com (100.127.144.158) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 14:53:20 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Tue, 04 Jul 2023 14:53:19 +0000
Received: from 9e57fe66d626.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DFBF878B-4C3D-4B10-AB23-C6721D1F26B8.1; 
 Tue, 04 Jul 2023 14:53:08 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e57fe66d626.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 14:53:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8452.eurprd08.prod.outlook.com (2603:10a6:150:84::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:53:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:53:04 +0000
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
X-Inumbo-ID: 86cd72e6-1a7a-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkwcAseB8LlqXiCLqvgL6pdB6Q9BOj6gCp39v1t9gqU=;
 b=Lt0kzWLKdXwDzaaAgBFqKIkosO7FG9yQbj20UJk99OpTfyTsiRsaOim86P+llrD0c0kkgyCsYy053LpuD1NP37gWpiX/C0R0T/QA928I24G0Njhx28skbW0pryJETuU6+UolMRO4zYsNEWg13iYCefHvitGYY7Rf5E1ACnueiSI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 989a7c2b5bfc43d2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwmexbrW8eszM0U1dYuUntJJecs7QUXi92gf91XrzNMORoYxIgS2hPme4pk615XEapl5Ri8lZ7Dp20PfMd23FqvW/ljae8+RMnFYOsvJ8c9dh728gKjH6tYsszu0v2F1u3W+E9w4Ass8BUA/pwwkcyhdojfD8KbOy/k+0lXSVqC8KxlfS9Ki9QJUf04CQ+iJAbuujGdv5MwEmxOHMMUYdJ/8U932c4NpzYvyDMMSObDKx4Cfo7h/Bh4OJPIWxqQpGyOBYfyvvW0agohfYoG8e+3szLPPu+mJRE0ZITFHtk29W7na2lKG3+q19VVpecBo7MlneEq9G8a62zwDl0uq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkwcAseB8LlqXiCLqvgL6pdB6Q9BOj6gCp39v1t9gqU=;
 b=kUm3vtzVUNMXhF38uD99uR0hXk54yS6gQ0pGVtnU3DbnFGKnd/7HA2rJR1p7fawMfJSC63+NqMLZADKWAsuO4AuTuA/XZ0NsuwlZ68Wiw4/C2C8k0B6E5OyQHBBtYoK1X8CKGusTO+Smj5SHIOqDwRf9fohcpNVOx3r0nzJaDHa7VM5tjJWN56Q4IYIOv3Wma+9xD9pVekBra2wK13D6nHRfNHbBD2S++n4SsWyOdndZQcQ2OiUivSmEbv+kvCiP9eA7Raxbk8AcJ9Y0S/th17I/SoeYHDoIpge/PoYkPLmvLq0ZUu1XpR/7yWQt+NoM2fvqLEHWxaioU/43syaqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkwcAseB8LlqXiCLqvgL6pdB6Q9BOj6gCp39v1t9gqU=;
 b=Lt0kzWLKdXwDzaaAgBFqKIkosO7FG9yQbj20UJk99OpTfyTsiRsaOim86P+llrD0c0kkgyCsYy053LpuD1NP37gWpiX/C0R0T/QA928I24G0Njhx28skbW0pryJETuU6+UolMRO4zYsNEWg13iYCefHvitGYY7Rf5E1ACnueiSI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, Henry
 Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/7] xen/arm32: head: Add missing isb in setup_fixmap()
Thread-Topic: [PATCH 1/7] xen/arm32: head: Add missing isb in setup_fixmap()
Thread-Index: AQHZos+47vv7EKE9Uk66+3hYHIyzLa+pyM0A
Date: Tue, 4 Jul 2023 14:53:04 +0000
Message-ID: <821C567C-5A15-4FE0-BB7E-50F95A61EDAD@arm.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-2-julien@xen.org>
In-Reply-To: <20230619170115.81398-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB8452:EE_|VI1EUR03FT016:EE_|PR3PR08MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e9183d-04da-4395-357f-08db7c9e687a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 olPZkW0q9FZbL0V549kpI71l9uLiZDI9mmNMAXHLYUm9XP7/3coT1cRrSm3l2vcf2KJNq8iieypXalMTcrxy4eY2fYVEA+hzus/wZQyfuk2diKpmNzDSKAicnG5rlc0GDfPqPBYBO8glvVB0Ed0QmL386RGI3DRvvPgmpnPAfuTwCMvfw3BXXEOTTAIh7Lt/yrbgqcvO9aqpHC9WsEPDSgO7mJh4zx5C4peINtY+OfPPXRVBqu6vMiNc9X0pLxIqqflciPo07sRgMhJYGTkyhu1/x/HiG7APL0TSQKGypnuWs5HUnhp0Tn3L2n9Ew93Y2VD4B/CjBV7o93aX729onCwxap1I+jHJW9If1z91IgTBzO3v6Tqa1YDFcXc/QTJCrIlQ9eWcKx1/Q332rDpZj4TEWooZuSWi6EWu2dHQh4AcbdAgoVQHfsl05Q6U4iubPao0cUIWb8F7dL6F4Tsy4ADHSk6zSLSVjH5vNP2ZD7o63X/b+nikKVwhs9CL8AHGZ9mkQ6AlR9AUbEx8vwSspeNbXTjfpfk9fB39NacV/uv6vvBuv+1YdCdevoebbKlLQ+akAqtVkruQOlRC+7ae/9obj9TTOck0+OLkQ752DO2d//WUzfr1UE/a7Rc/5YNyaBof5TrSamNoVXGfDl2m9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(4326008)(316002)(66946007)(64756008)(66556008)(86362001)(91956017)(186003)(6916009)(76116006)(66446008)(6512007)(66476007)(6506007)(53546011)(83380400001)(122000001)(2616005)(2906002)(6486002)(38100700002)(33656002)(71200400001)(5660300002)(478600001)(8676002)(54906003)(38070700005)(8936002)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7059F9B6D7D0CC4DA5789884CAE70013@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8452
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	65febac4-2b6a-4291-6f23-08db7c9e5f46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	npFEcwkgv42ZxZkUsh4ruU7eDkKc5t5Qk6Wjpx/pe5bLks8Lu+1Y+/KqHdui8YiSBmL9BvCLlItLM9mgJikakTaqfjABP4CAw2P3s+Sg/tK3qNQXFxxP7ZdLEbGM7mzWz0FVZMIgveGYpsKMBo2AA4nv+FLEGahM0ZlgZ+XWiwRI1fI9hpqvVb917V3aD626RJR8DfqD3qK9+Ob3UR5rJG0+GC0wV+yI2zQcJqYupJz7lR05G/nLtmm/lW2N8cwdvfsicabir7pVFEXZKADApJ9K42SzpQXsm7oESHqsLva8r8tvpB05fRtAzgAjz+wIsalhuA6KtDz1xTMzrsjOLiZKit9ofT9xbqjeB5NDKGkWQ+wY4KOe//nvY95AjuVRnufUC8WAo9RbuamRv1z3BMdcIR5sD3bAQ2BJexpqYZnyfKj2PI9xVkU3Ei1YQvVHiziTibKE9bTFZSMNELADAFDcdT8ot4c5b0rOa8i5h4bk9Kckq0kd8PvXHOXyxn7tIvspCcvKwxnDkqA7V8WngIlfs1TUxepHlq2kzsMQ6tgzPMwDaA977H0sPdv2YHusluPIeVxqo7QSO894fHyhqNwtW3F9FtSHQ1QI7sUcMhkIYNYouSt7wwiF6X0TChimeQmGaDrglm8ya/OFxxzLYLhv6H2kASKF+2UNHx2j8gV3NfIloEaY1tmvoLcXAGEM/tUy+Nzp5W1F2M3sO9pJF2VOMpBC5iQ8d2eOkXyR3IJLvgD2riHOfRo41e3D0+I+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(8676002)(8936002)(54906003)(6862004)(478600001)(26005)(41300700001)(33656002)(36756003)(6486002)(2906002)(5660300002)(86362001)(316002)(40460700003)(70586007)(4326008)(70206006)(6512007)(53546011)(82740400003)(6506007)(356005)(40480700001)(81166007)(2616005)(186003)(83380400001)(336012)(82310400005)(107886003)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:53:20.1480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e9183d-04da-4395-357f-08db7c9e687a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5754

Hi Julien,

> On 19 Jun 2023, at 19:01, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per the Arm Arm (ARM DDI 0406C.d A3.8.3):
>=20
> "The DMB and DSB memory barriers affect reads and writes to the memory
> system generated by load/store instructions and data or unified cache
> maintenance operations being executed by the processor. Instruction
> fetches or accesses caused by a hardware translation table access are
> not explicit accesses."
>=20
> In setup_fixmap(), we write the fixmap area and may be used soon after,
> for instance, to write to the UART. IOW, there could be hardware
> translation table access. So we need to ensure the 'dsb' has completed
> before continuing. Therefore add an 'isb'.
>=20
> Fixes: e79999e587d7 ("xen/arm32: head: Remove 1:1 mapping as soon as it i=
s not used")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/arm32/head.S | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index f9f7be9588b1..6ca3329138e3 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -751,6 +751,11 @@ setup_fixmap:
>         create_table_entry boot_second, xen_fixmap, r0, 2
>         /* Ensure any page table updates made above have occurred. */
>         dsb   nshst
> +        /*
> +         * The fixmap area will be used soon after. So ensure no hardwar=
e
> +         * translation happens before the dsb completes.
> +         */
> +        isb
>=20
>         mov   pc, lr
> ENDPROC(setup_fixmap)
> --=20
> 2.40.1
>=20


