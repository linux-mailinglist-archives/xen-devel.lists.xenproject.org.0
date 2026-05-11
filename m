Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KWLHEScAWqDgAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:07:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA73F50A98D
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:07:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305878.1578004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMMbR-0001pt-2z; Mon, 11 May 2026 09:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305878.1578004; Mon, 11 May 2026 09:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMMbQ-0001n2-Vm; Mon, 11 May 2026 09:07:04 +0000
Received: by outflank-mailman (input) for mailman id 1305878;
 Mon, 11 May 2026 09:07:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMMbO-0001mu-PZ
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 09:07:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMMbN-00H4Tm-S0
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:07:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a019c2b-2eae-0a2a0a5409dd-0a2a4508b3c2-32
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:07:01 +0200
Received: from [40.107.208.29]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a019c33-63b5-0a2a45080019-286bd01d531f-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:07:01 +0200
Received: from CH0PR08CA0024.namprd08.prod.outlook.com (2603:10b6:610:33::29)
 by DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 09:06:56 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:33:cafe::8e) by CH0PR08CA0024.outlook.office365.com
 (2603:10b6:610:33::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 09:06:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Mon, 11 May 2026 09:06:56 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 04:06:56 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 04:06:55 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 04:06:54 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LV72yy0hazOjRNm5VBVJnAF/5Ghg1GGwn3xNG4YtRqSjEPwOm2diXdOXCdomDCI5orZiWSSdT1yt0DEDGzL2dvptSs6SmHgJ5Ahgfz+rjnOC50T+GQskfHoIgzkKPqrzUaZYwaTm7N09OGYAKZooni6MyYikS1Gi5SJAgyU86fFKRgzToLhbjDA/V9FglYX4w+bB7yM3Zp1TsTkInb+w583h2cCVHUFoDXgDDzxpuXKMOFQV3XhfEQeZMDyCCYqUrK8PjSO3dX95/qDq6xAig4fv86f9jj4JCkrBbDUKZ/bpTlfZAdcB/IbTa2uQrCSt389kV7RpsIX687vLbXhkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNNpEWZNOWj8GR5qhCHhoPedjD2cb6cMhr+uoI5xJQk=;
 b=GQpRDaJ8LSStkaIs0+IS2gS2vOzMMx+8gbanx5pTutEqPbvF/hZ/nb4V8LfMioKFDdRxgK/IePVdayAFBCT6BY4zq/MLVK+i+0nuGQfcAS/W2ezN0mLdLup2luGZ1g6jBULABfcpvJhTawDGjuON4WYIbdAP+3y4oE8BURIufSveZFEyI9CBMe1PGImLz5uYLzIzzkYLVC8v0q+Aeucn0NV0hLwduLYuOdQa1SBbCkdIMIetaIyX484eD4DAsn8lqBgchQIr5vOw6JGxLDJ0diWBH9yKDyFmShJ2WnDEf9mc1gllKc0dwLnHICPMlUOEI9AfmFR2ZZhRzD+aGfKwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNNpEWZNOWj8GR5qhCHhoPedjD2cb6cMhr+uoI5xJQk=;
 b=ds86QHYKm9oXOaNhhw9co9i4yqZW/+S3VfjwHFgi/hEEt0rxQXzBOTuSzxxuTqcy2qIDfbwtQ3ccgDgVwWvFJYiZ68eeTKuJ9oKt6Pyz8oPucB0QsmJBIS3yqJMy48b+PpnNw26GV9Clk/oYHnUhIaYFmidqUiS8f8e8pkZ9w+g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fd6d9873-d1db-4aef-acbf-6f7659f5c528@amd.com>
Date: Mon, 11 May 2026 11:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] CI: Adjust test needs[] to ensure binaries/ is
 non-root
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-2-andrew.cooper3@citrix.com>
 <a7932bc7-86ad-401c-b462-01078e6e11bb@amd.com>
 <455c64a2-bae4-47d0-a2bd-902be3ea6127@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <455c64a2-bae4-47d0-a2bd-902be3ea6127@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|DS7PR12MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ece4e74-363c-4a7d-1ad8-08deaf3ca6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5RmHdlYV8RT/DNCx/hbwkOwiTvd/xPrUiERWNFKqq+u8LbFUvrgm6Qfw2vjEzjhhZNF5HnxZbCEhmh3+iDL7tBT0FGKkloIlutflvmeeZXhsU9vswcAblKJ/uaTFKmLJtinNdek1z0Fr8O42TzUDtzsG5ZUvFK4QtCviC5bsTgPKjqS3tLdUPpla0AkGImfYidGdy1nZQVBjkAePFJEF3/ByBHqVvW+qjzj8ZCBxQmf/+C84j3QwdTS04JWYRTrmNzTZ6KFukGHv75nbD5S8+70Rm/sg0hVLUQtvsteGevdrC+1VHyQxH37TcoNXPprgRQdZLVa+kJ2RsWsOu2s3ShvwECLlGa8a8VE9aPppbHl9NfsKogIU+j1Y5WLTNlQ3X3hK2y1eOZOSd078JCnzcE2zs9CZ3PPNi3IAJGBsvxZisY4AgGS0TbVgctrYoIk/XU/LbE9yHdn38216aNr+8UmJcm4Y3yGwkaLJL0BNtn74Eb/WMOy3c/oZa/IxMXLdNuCX4rCaZ7KIx4Hm27A9udi/0EUDC0tGSAjpPvyO30jvUcczS3FXgGIaYeMbXTDagoDb90mf4hY5BNjVR7VSdszq7gZYZIgXhd3nWLkThdW8VEVYFtNtJBJ/0vXPF+oa3Wurlvnf34+kQgb1ta8CYcOj3Dv5xm/PDim80E1UtNT+daeoUFY+rCgDDeTIZ3WUDJi2yX2nW1wVV8TAgtf9nqrTorI7uW+1hI/cXDsOzM8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p7n6e9Oh9u6lH+QStZorANeaavRV1KQAuUlwLmkqi6UaEjxlZZLkheBkNZimDi1DQe28D5ePsCtYrCMkmXrxoQ2O3N5D+X7mNbRT23AYa/NqYph1BZyTMiMXtpeJl5EOrsmyxKCK9kmnxSGm5oTCGPR9mmudQnWb+vHAlNvqxvNaz5CyJdQASMEQ7M4a379uJbTqI6eeXjWnXevwfivwosUK/oHTriiF6vTeaJfRHJKvQYAYs6XqvzYvt7R9EcE6zgrNfLUUBI0mVEC7/hmEiwPj4GfEMPC3FmHPerWOhL5pxNED02eMFmeG5M50v0u0gcrEFo3EcH4Rqf7VuFNDpHU7ox7+fYf8Odo6RKCtusyfT0Wzbw4QbSdQ/HOyUmP+1l1FZeBBrSRQbm0EZn+TLSl2HsghaMu7Dre8c3rp7o3maThrxP3DHl4GZaF01brg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:06:56.4445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ece4e74-363c-4a7d-1ad8-08deaf3ca6d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007
X-purgate-ID: tlsNG-c1860d/1778490421-B6D73DB1-B56C75CD/0/0
X-purgate-type: clean
X-purgate-size: 3431
X-Rspamd-Queue-Id: DA73F50A98D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim,vates.tech:email,cardoe.com:email]
X-Rspamd-Action: no action



On 11-May-26 11:03, Andrew Cooper wrote:
> On 11/05/2026 7:16 am, Orzel, Michal wrote:
>>
>> On 08-May-26 23:29, Andrew Cooper wrote:
>>> The binaries/ directory is a composition from the artefacts, and also used as
>>> a working directory for most of the tests.  If the very first artefact is from
>>> a root container, then the test must also be a root container to use it as a
>>> working directory.
>>>
>>> For arm64, the existing linux-arm64 artefact suffices.  For arm32, pull in the
>>> microcode-x86 artefact as it's the smallest available.  This bodge can be
>>> removed when all build containers have become non-root.
>>>
>>> For the qemu-xtf-dom0less-arm64-*-xen-version jobs, use *arm64-test-needs
>>> ahead of alpine-3.18-gcc-* (as it's a root container), and to deduplicate
>>> the *-export dependency.
>>>
>>> This will allow us to change containers to being non-root one at a time,
>>> rather than all in one go.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Doug Goldstein <cardoe@cardoe.com>
>>>
>>> We should also stop using binaries/ as a working directory for the tests, but
>>> that gets very complicated very quickly and I don't have time to do it at this
>>> juncture.
>>> ---
>>>  automation/gitlab-ci/test.yaml | 10 ++++++++--
>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>>> index 8770c523e228..517af1732437 100644
>>> --- a/automation/gitlab-ci/test.yaml
>>> +++ b/automation/gitlab-ci/test.yaml
>>> @@ -15,6 +15,12 @@
>>>    - qemu-system-aarch64-6.0.0-arm64-export
>>>  
>>>  .arm32-test-needs: &arm32-test-needs
>>> +  # Bodge to ensure binaries/ is non-root.  Can be any artefact which comes
>>> +  # from a non-root container, and microcode-x86 is the smallest.  Remove when
>>> +  # all build containers have become non-root.
>>> +  - project: $ARTIFACTS_REPO
>>> +    job: microcode-x86
>>> +    ref: $ARTIFACTS_BRANCH
>> I don't see it being removed in this series even though the containers are non-root.
> 
> Correct.  The Alpine container still being root is discussed in the
> commit message, and is why ...
> 
>>
>>>    - qemu-system-aarch64-6.0.0-arm32-export
>>>  
>>>  .x86-64-test-needs: &x86-64-test-needs
>>> @@ -569,16 +575,16 @@ qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
>>>    script:
>>>      - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
>>>    needs:
>>> +    - *arm64-test-needs
> 
> ... why use here is ahead of ...
> 
> 
>> This also pulls in Linux image and rootfs which XTF tests don't need. I think
>> it's much better for a test to list the actual list of its dependencies.
>> Otherwise you are asking user/developer to dig into the yaml.
>>
>> ~Michal
>>
>>>      - alpine-3.18-gcc-arm64
>>> -    - qemu-system-aarch64-6.0.0-arm64-export
> 
> ... the alpine inclusion here.
> 
> This can get reverted once the alpine container is split/reworked, but
> not before.
Ok, so once the Alpine container is reworked, we will get back to proper
dependencies list. In that case:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


