Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BE2707AC7
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 09:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536234.834391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzXzs-0007lQ-Oj; Thu, 18 May 2023 07:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536234.834391; Thu, 18 May 2023 07:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzXzs-0007jl-Lv; Thu, 18 May 2023 07:24:24 +0000
Received: by outflank-mailman (input) for mailman id 536234;
 Thu, 18 May 2023 07:24:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqpr=BH=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1pzXzr-0007jf-Ve
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 07:24:24 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0054737a-f54d-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 09:24:20 +0200 (CEST)
Received: from MW4PR04CA0264.namprd04.prod.outlook.com (2603:10b6:303:88::29)
 by CH2PR12MB4860.namprd12.prod.outlook.com (2603:10b6:610:6c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 07:24:16 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::4c) by MW4PR04CA0264.outlook.office365.com
 (2603:10b6:303:88::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 07:24:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 07:24:16 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 02:24:14 -0500
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
X-Inumbo-ID: 0054737a-f54d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFPQPwBrsbqjLisvRs4nBw3vMETRfQkPh/bJ0Qcm/pcEQJWo0c3gGrAXik+cdmxkY7Pdhlx9p8FJzPaNM4YDD+mXZ7tao0k0xbZwp6ZJu6tM1/jODoRzFRKUS0zjJSMm/nON0KnowMg280+GN/ebYaX58k7xs5Yk8JA+iXALlb1V2AolbM8dmpOl2MH21rwHY5uD8ZV+iWBBYL47c9Y2YzyJ7fNefUuJpRbewthr+KaO5R4pD9N0M0lR54+7wghRIfa98l2xrrJoaIhIpDeu8fwa/nWeInuXcUv5ynIH0vnVq7J0Qh95UufHqp47yJdt5HKMOA/eDxi0XDfs8tsufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SNJs7fPg68exoDmqAEaEtOXRxw5Tkn1OXE+a9gCg30=;
 b=XdPNXvpExShLMrENNkHBc5xmRzojkh72mSw4SLiqswmCNQP5EPUc99fiYoTTIqjz6RNY5wrpWJCTdqM0xb+UX/Cd8uC1P/fa0Gu9qY8MBU1H+pxct3MiPmDKvR1llsCO+QUbkbHKwj4o0RBqqkweIG7Y/7Hz7yM6iohjy6bdzwOtDk/nR0YbFfkxoiFggcCIOUfCLKpLZ8FuyCoZ01BrINop7jp0sHRlAwNhSefedlLKJcsedZ7h96ip3YxnX26yOuhYGsm3Fe8CWAfhU/tQaxaZjDvWq/A4cgj4dnC9XKkRIkVm4da3fQ8+Qjv0xtO00Xv702qqv/snPHtZrr74qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SNJs7fPg68exoDmqAEaEtOXRxw5Tkn1OXE+a9gCg30=;
 b=KPRAE0DvP7A+E0l+faA/Pzuh2Wo1PNQg5Opd3nGpU9yf3UKl/ev2CcBzuMgrHSzV46FZEJAGhyHEiOUrrr26fENpkiADjCGLa/st6LOyxFbPjNlz/Y3DIPEoSxuxdmcPgJA+a9qTwvVfImnbRPG9pfsX1/PycPmfAqjWwD+uW8I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6f3f4e12-ae5b-c58c-891c-fbce08283206@amd.com>
Date: Thu, 18 May 2023 10:24:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <roger.pau@citrix.com>,
	<andrew.cooper3@citrix.com>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-2-sstabellini@kernel.org>
 <c22a8925-15e4-47b9-6f5d-f85bbe802255@suse.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <c22a8925-15e4-47b9-6f5d-f85bbe802255@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT008:EE_|CH2PR12MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c4137a0-504b-41f2-edbb-08db5770e36a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jttaadZy8jHBzHjLqTK8MZYBfxSfyTbyv/1dSzeAmv5SNEi0SoBwCo20Fw+ForFFHtOJ0OVedeS2q9oEFTOnb+R0WttZsT70TJ4DICh5e3dvvdBE3lgpfORfPV7YrIFRslw/cTuwvOBfzdHA7MUFbsHNUGNH5hiHTpkP+h2oaUVi7+mfOFj0/ny89M8UOuM6Idfcchh104A3F/vwY5pmof8zkzRkbZhhSc6ARK3QSLP9vpPM9iNuL+u4PZ+Pm1PhY315mh+oAczy0NamHCil5m6YHdseUgdkiZCZkMlXiHb0ssp3lBlVlCARO3fF8hRpp8Wu6JLzf/uEARVoUnacR2moZxRr3bNlJMoGUExeDR6awhacFZWLPekzteQiOYxbjPIC1vccTh+kjAxmvrLsNg36gDi5LEwxtmUpLrig97tCK0+4PnESlyvgm82oIDQ1atqxHLenp7RsrIm5CWDYm5dMo7eP2TdaX6ARv+0dMfu/6i8LdNBwR0Q4vHJ1S7PrldC44/GtANg2dmcD6Z4llPs8LR2/qnHNPdJnfxmjeZwC+eqbPpBnztNWRn9JnjS3wAtkQVsEZ8NzHTt8TnsWFWJxDA6vGoRrcXbULco9+jIlN5Ag0tavzpM0YTsIOHJQ5ZA0fA5IjXWIs2SaDPefsLrNnWwmb/UMoa50GDFYc/EPq1NqxH0Ba1aCCF9RqGJBM0aVmAmdf+JRJGp+zVkWSZp+r4Pa3bJzfQIDWRS+ZhPwf+IrcERwPF9nzvYda++qh7Wf437tXtwpKKEO6RjSIZg7/g3fesDByZeqy4brpNQF/nCPfUKoRf+QzULszeOW
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(26005)(53546011)(40460700003)(36756003)(36860700001)(40480700001)(47076005)(2616005)(336012)(426003)(31696002)(86362001)(82310400005)(356005)(82740400003)(81166007)(16526019)(186003)(54906003)(44832011)(110136005)(16576012)(478600001)(2906002)(316002)(31686004)(4326008)(8936002)(8676002)(41300700001)(5660300002)(70206006)(70586007)(6666004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 07:24:16.4884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4137a0-504b-41f2-edbb-08db5770e36a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4860


On 15/5/23 17:17, Jan Beulich wrote:
> On 13.05.2023 03:17, Stefano Stabellini wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
>> the tables in the guest. Instead, copy the tables to Dom0.
> Do you really mean "in the guest" (i.e. from Xen's perspective, i.e.
> ignoring that when running on qemu it is kind of a guest itself)?
>
> I also consider the statement too broad anyway: Various people have
> run PVH Dom0 without running into such an issue, so it's clearly not
> just "leads to".

In my opinion the issue is broader.

In pvh_setup_acpi(), the code adding the ACPI tables to dom0 memory map 
does not check the return value of pvh_add_mem_range(). If there is an 
overlap and the overlapping region is marked as E820_ACPI, it maps not 
just the allowed tables but the entire overlapping range , while if the 
overlapping range is marked as E820_RESERVED, it does not map the tables 
at all (the issue that Stefano saw with qemu). Since dom0 memory map is 
initialized based on the native one, the code adding the ACPI table 
memory ranges will naturally fall into one of the two cases above.

So even when not running into this issue, pvh_add_mem_range() still 
fails and the memory range mapped is wider than the allowed one.

Xenia


