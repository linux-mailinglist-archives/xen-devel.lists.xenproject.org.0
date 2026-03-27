Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKieE2mMxmlELgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 14:55:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCC2345A72
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 14:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265692.1556501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w67ep-0005C6-La; Fri, 27 Mar 2026 13:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265692.1556501; Fri, 27 Mar 2026 13:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w67ep-000598-I4; Fri, 27 Mar 2026 13:55:27 +0000
Received: by outflank-mailman (input) for mailman id 1265692;
 Fri, 27 Mar 2026 13:55:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w67eo-0004vU-2d
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 13:55:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w67en-00006j-Ef
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 14:55:25 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c68c44-2eae-0a2a0a5409dd-0a2a4502830e-14
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 14:55:25 +0100
Received: from [52.101.48.23]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c68c4a-63bb-0a2a45020019-346530175dc9-4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 14:55:25 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5370.namprd03.prod.outlook.com (2603:10b6:5:249::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 13:55:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 13:55:22 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVhh2QX+IfrMB81zqosvz2AgZ8kClcAdXh+8N8BudTc3ZaPZJ5cUsozEVe/yeGIe+V7eSo240RfUKmzFnfr2SNbCmwuUqp39bfhS9dCUJlaQmQLfvikogv1uj1pFGDHbG9NL3iPPjQHnA/oJna7UdSEwti5AFuAF+o2VY+2Rge8k+Cd+xTGJ5SfXqeDAoRvircIYPB/i2zdngqya1lk8/y2n6dY56ZTnTRXUgAHVfiumM0dYLUmdtuRvhw0hRv7zXv8C5xTDuPQKDsnHJsk0/sq0UTwcvXrbXc3ZxfTAqvNLAmt3sxeOcTUqrs1/a1ATeGPN5B6I4GwiTV5rV/h7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhmHBEQUQsV67sJGN1j2fx0kLUU8zzBp+J69Zw8ktbA=;
 b=Ht1/9ru79fgMP5zfyG4oyj93khxvw5MuFXFDfM2nPUR9azKupcdyTWN3MYcNBmtHkMXyKBG1PS5sgBzm2OMuZBbPEpMCICDSaEmbLLpCOFW1VCaSNvhUBJnGYL1VGVAsSJRbK/HMNeuqrNX9l7SKKPE5B8rnFdXzi+44zDz9lNNpnEfEO2xcyt8X+WncolplbNIAraqjWMzEFpvQtchG5WcwRwlUsf5DjYtShZJLMS8/90A3eOZfPmAYEXSdrIFyNhUP26qcS0KRUQ63Kfku35ZIUreBujCWZOgP95jm4R3XrEgfALocXry7HHSok587e2VmJPoWXpb7LtIhBZlL3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhmHBEQUQsV67sJGN1j2fx0kLUU8zzBp+J69Zw8ktbA=;
 b=XKI9qy6IZK6WMjvyrpsPLC0Yni1gKJEcl22GXh7sx96ks3sHicK3tuP99ldhGjfrUWyeS5WuirLhnsuu1BU37ayQduZ5L17Bo1s5Fc9sXodeNFxsXQPoTVR6pK5l+yq8gOCe6FSsY+ulNfihrjV8uShXwyvDDxbG2DrhdaFF46k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/3] xen/uart: uniformly set ->ps_bdf_enable for all PCI serial devices
Date: Fri, 27 Mar 2026 14:54:18 +0100
Message-ID: <20260327135420.7246-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260327135420.7246-1-roger.pau@citrix.com>
References: <20260327135420.7246-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0039.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a00c15-36b4-40b7-03e2-08de8c087d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	NOwHscqcH+XD5bhZI+aX/sOj7EI8SuBEMJCPnRex+/YIZKvKzxSnVE28jA7Ko8jpeCePZh/3s1dt2c3rq7QXUDlt2amDDuNts7sYs8H0A1Ca/rM2HNrARkSzqHvwJ2dkJwFPfjTcdFTGR6eSZWlMpCKMxlG9Us9vybdr9aEA0+xzy6IKxEybpYmeuL5v9RpDZ19eOQCoyzW19TphdyuHEiKMLyzQlMvS5DwrS4CKJErbirYveoabyZzYmyjfZB5QAMbHjKt+o7hVMX1F7SHtCQ0mGNHwetXmB424nKBCh4Mi9QO2JyY757wDjmJoionKXNjGOrdd7SuilALspQlI/NSHt0Scb5kPuZ8eyvG2aMZ/5BCOULdnqkZB7oTC6s+yHGM/mtvz6bQfI7fWbh6RpPhFLv5pFZM+zmlEo/uVKZU2GDAMGP/Nsi+XZb221cf4lFiSom+SmXv0DZw/A1MrEJZ0iKCB59Ijs//whkeG3TUrmiBWkEtgbNCTtpEvJhIQi+bljWbYjVxOV129GJVcanv1mANqbCFVeLpuDRfOi2UQwhejLLJcV5JvVEqLlzUkb6U6F+TKqkMukA4kA197YaKpSIb2n3qMwuUmQsSy4z0ZxokoaeWG/HGNGjC1MYAyeg8VQyGFd85kGAMRJJIiuBCb/nB/OaAD069+q1flY+OFMu2NwBJ6xlj6oiYI4P7B6QwC2DvkgWaYBRu2wjnSro7JgJZnSlS3KXEbTdazCJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWI3UFd6VWFDeDBQSzJnNVZ1ZWtsUXAxakVQYUp3Ujh4Vm5XbVNYUzJWOU5s?=
 =?utf-8?B?aDlpOGpWdEdiSlRNQ1E4eVZ4MHBPZjdEREg2dmZoRXZBN0N1WmRINmo1ZGE3?=
 =?utf-8?B?cmZZVE5RazhPMUM5T0RDOXFZR1VUcUZjbm0wM2pSRGI1NlR0TkJlNWUxcmVa?=
 =?utf-8?B?MHUvRjc3S0tRbzllS0dxQUo0MmRRWmRHWmF0VlhnQW1aUXRNQ1l6a0FKSzJi?=
 =?utf-8?B?L29aNlBtSnVDOURWWFJrUC9tTmRGUEd5a1RwenJGeHhuOFIreEtqN2VSM2Rj?=
 =?utf-8?B?c3pleGhyRzd2MXU3UjVQQzZUSjVvcHd4a3FjTHF1RlZaMzB3cnZzR3ZXZW5J?=
 =?utf-8?B?TnBkdkYybGxjM1lyZWtaeER5am1KSEh5ZEdGd2p0VW1PN2N6NGpJVkRIamU3?=
 =?utf-8?B?d3BWQ1pBdjZ4eUV0TDY5ejlTTFFmaVIrcmV1S3RlQWloZTJxeDlpcWdrM1ZP?=
 =?utf-8?B?VU11WDVQNXZwelpNcDBLd1ZDQS9wNUhDUzl3WnlUMURhSGpiL1AvU21XZnU2?=
 =?utf-8?B?ZjNCbU5CTkxaYllQOHI0YW5kclUzdmtZUXBXRTRja1JNMmVVcmlWSGJla29I?=
 =?utf-8?B?ZFBmU3RuRmYyd3ZUN2trUXVuaDBKS3JsS05DejJ4U2Qza3hVWjd3WFRJS0U0?=
 =?utf-8?B?cCttVXl0Q0VyUGhsblptZ24yMGh1alZCTElSWnpJbnFoYUMrVGpMbEtCeVRI?=
 =?utf-8?B?dWxPYjZTTmRhaTViNUYwS1VRNXJ1WWJvTWozSXNwM3FEZDEyVyt4VHRLa2VE?=
 =?utf-8?B?TVZ1My9vT1YrTGxRUFUxczR0dmZodnRQdkFydVJhYVB6VXh1YXptUTViVjg1?=
 =?utf-8?B?KzBPVzY5NjJuOFFUbFVWamZUaDNjOVQrQ21qVUtiY0xJdlcrS2xNZEFVRXVR?=
 =?utf-8?B?S2R5TXhMZEhvSi8rakk1ZVgwQTlOYjlGd0MvU05Oai9EY01BWHI4NG5qcDlh?=
 =?utf-8?B?YU8wQ3l2aVhmK0lNREM4eWNPWHVUUnliU2ZsUGxmQi9qMmNxZ3NINFpaeTVs?=
 =?utf-8?B?ODhSMENIN1JVWEc4dEV4OUFJelNVeFBBRmgwYXhMNmtoMHBQcVlCZjF3T0tE?=
 =?utf-8?B?OVBWemIzdStpOXphYmlHMW82aHh4Yi96OXJVdXdSN0d1NUUwTlNiZzBsbkEw?=
 =?utf-8?B?Kzd3aWFPdDlhS2JYcHM2N0tZNzZrakZWbFBHaEJoUm1Lb0kvRXBlQVYzcW8x?=
 =?utf-8?B?RDFZb3RVM0hVZmxVbUZpMi9pS1ZxR2NjS1B2QXE3THcyeERGcmhpeXdveEdF?=
 =?utf-8?B?dGV6OER6a3V4bklZOVJpdlYxNlNmNkVrVnZyUCtnandXMVY2RHIxSXFyRyt2?=
 =?utf-8?B?L29rWkpZb0ZadzRaQXZ1VHE3WEV6d0MvNkM3QW8xaUs1Z1dQWFFoNHl6azYr?=
 =?utf-8?B?ZGI4QjB0a3JkMUQ1M0FnL0Vwemc1L2F3UVYrWCtOK1JIWXNiejRScW9XQmoz?=
 =?utf-8?B?YTIxTnVzSE8zRTJ1cldCRHpneURWOVA3bGhwY1Zyby85c2hsYWlONGtOWkpq?=
 =?utf-8?B?QzljZ2VyVmVKVmY4eFpweElKa0lLTG5lemFHZ1lKeTN4VUh0Y29pWWNCcFRN?=
 =?utf-8?B?QTRCR21TSXZPT3VvcHhCb0hoY1k5Z0h5S0J2d1dWejY1NlpScFdDV2JHemgz?=
 =?utf-8?B?b1J6WTJWMlJQeWtXSHJ4aFp4WVY0dXlLZHVlNFNQY0xNOW9lcHBicll1cWov?=
 =?utf-8?B?MEFIQWFmSGVZVkdIYXJkdzdGd25RNFdhZ1BjMXJGc0o5QlFLcFJVOVhiNXFI?=
 =?utf-8?B?bkVOMjE5THo1d3ZPelFwdzkzay9ZNSsxbU9ZeDdLaFJ0TEpuSkZyaW5GZlBn?=
 =?utf-8?B?N0hJVHhOQ3BvaTQzWE52dGhtZ3pwRHdBc01yY0pOd3B5TW9sK1d2UDA3YTNK?=
 =?utf-8?B?K1d6b2h0L0pkZ2lwMFZJVHVmSEt1L0xvaTRTZXZPYUFUNTF4M29zc2M0YURB?=
 =?utf-8?B?WFNMQnBObU9BUFZ4ZlZTNFl6eWQ0cCtLY21RU0Z1bFBUblQ5UWh1bmt2bWdk?=
 =?utf-8?B?TXpOY1owbkQ0N2t1V1ZGRTY5Smw4SGVJckFraW5KZnhsRzU2cGpyRVhydE5s?=
 =?utf-8?B?U0FXY0laNnVjdWFJWEpXdmJXUWl1UzJVQkYvY21HOW5yZDdJT2hsRXRDbFhh?=
 =?utf-8?B?N2RaTzc1aDFGdDdmVkg1bjFpMksyQVBLSHI1RGhwbkpvTm1TZVdHd0lTRWtr?=
 =?utf-8?B?TjFqVjhDTE5kL05wWjhOVnV1MnZkbzBYNzZtMVM3NU9FTko0TlU0ODhSSUJv?=
 =?utf-8?B?VW5ySXlNM1BibWFiY2lkVDFLOHV6b1M2bERaOExoMVVKRXhUMkNrTkpJcXdQ?=
 =?utf-8?B?UnhKQUtvV1I4KzV4UndsalBYWVFqRGF1Q1cyTmJuWmtrd0xNcTh6UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a00c15-36b4-40b7-03e2-08de8c087d70
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 13:55:22.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNpSKzt9a3WtLHeIsZM/NpMm2FXkV9+ffuZ08Q4kgc+StoZaDyxu72b1IjdX9SpenJfio/vTKta12JnbzZufnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5370
X-purgate-ID: tlsNG-720697/1774619725-6957CDB8-C56201F6/0/0
X-purgate-type: clean
X-purgate-size: 2508
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EFCC2345A72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Auto-discovered serial PCI devices when using device=amt|pci won't get
->ps_bdf_enable, and as such some of the logic (like making sure the
respective BARs are enabled) won't be applied to them.

Fix by unconditionally setting ->ps_bdf_enable for all PCI serial devices,
and removing the special case that was done in some places by checking
whether the ->bar was set.  This also allows simplifying the logic in
pci_serial_early_init().

Fixes: 9738db88f68f ("xen: Automatically find serial port on PCI/PCIe and AMT devices.")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/drivers/char/ns16550.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index d384f1c69d2c..d05dc506ed9c 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -283,7 +283,10 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
 static void pci_serial_early_init(struct ns16550 *uart)
 {
 #ifdef NS16550_PCI
-    if ( uart->bar && uart->io_base >= 0x10000 )
+    if ( !uart->ps_bdf_enable )
+        return;
+
+    if ( uart->io_base >= 0x10000 )
     {
         pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
                                   uart->ps_bdf[2]),
@@ -291,9 +294,6 @@ static void pci_serial_early_init(struct ns16550 *uart)
         return;
     }
 
-    if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
-        return;
-
     if ( uart->pb_bdf_enable )
         pci_conf_write16(PCI_SBDF(0, uart->pb_bdf[0], uart->pb_bdf[1],
                                   uart->pb_bdf[2]),
@@ -440,7 +440,7 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
         unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
 
 #ifdef NS16550_PCI
-    if ( uart->bar || uart->ps_bdf_enable )
+    if ( uart->ps_bdf_enable )
     {
         if ( uart->param && uart->param->mmio &&
              rangeset_add_range(mmio_ro_ranges, PFN_DOWN(uart->io_base),
@@ -1335,6 +1335,7 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 if ( param->fifo_size )
                     uart->fifo_size = param->fifo_size;
 
+                uart->ps_bdf_enable = true;
                 uart->ps_bdf[0] = b;
                 uart->ps_bdf[1] = d;
                 uart->ps_bdf[2] = f;
-- 
2.51.0


