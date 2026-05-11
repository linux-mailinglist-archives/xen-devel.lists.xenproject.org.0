Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBUpEIwlAmpooQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 20:53:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74697514B1F
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 20:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306366.1578358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMVjR-0005yz-Fl; Mon, 11 May 2026 18:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306366.1578358; Mon, 11 May 2026 18:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMVjR-0005w4-8u; Mon, 11 May 2026 18:51:57 +0000
Received: by outflank-mailman (input) for mailman id 1306366;
 Mon, 11 May 2026 18:51:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wMVjP-0005vy-HR
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 18:51:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMVjO-007EpK-RG
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 20:51:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a022540-bab6-0a2a0a5309dd-0a2a4501d11c-26
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 20:51:54 +0200
Received: from [52.101.85.34]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a022548-c1f2-0a2a45010019-346555228de1-4
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 20:51:54 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7792.namprd03.prod.outlook.com (2603:10b6:610:215::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 18:51:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 18:51:50 +0000
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
 b=siJmZm/InMatD5Yx8d73HyB9uHUQmtN6b0Qwmc62DtAIkwMtiTs+vpiqc6fOH87NEO2ymH46wPfEyvUk4icsrA5yC0BbfTNhUEtHB4FCYNTBWYD5mDFiJODdtDO2gOB5+FQRzBMGmkMQKIhhGxwL4NXctaegeIORTaBhPVhoexhk2PHvMZWxrWJQT00Rhx8pTDIBWDjfAHQwSVH80FkVSPJV5qua3tExA7A6rik1+V8MdP3nMY8qSh5HA5wDQC05GroglWDmqwvFjAiEn4hkpvphSD7xvzfk59Z+7No0pNxwGVq4biFAVUrfd20C+1eXNAlzxEmF71IdDuy/ZaCJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWhMxsqM5QCJaP97OCbM04Lq6/lCSArZnYYo/iyvrYk=;
 b=v6rVugydnnmmohOFkO41Gds7KlPmAu6neFbGWf2h7/z1WD4vGaFjtCst/TzhhwOEUuR6053Xg92YfqLX2J/WoW8YOxF/WnC/VEEB/oxCgY4mVnhtDsVkSZ8wcPmiukGtns+im8C9S8enPqDWqBspqqxXUPh+Fnvcf7Cb3JyG0KmqsTzP56q2mEdYm4jo2gJJ5vRwhTlqpyoUYHayFYWOw20DW4eoRwdVBEuwvVGdgjxH6xeX/Sdel8RY+IEvExaciPeodER6isFlSfodQ9aqibsUiHwpPpzVTrqu03ZePG3+pQmVV4J7Gl54ASntOfa0GxPVnIarvCAp7AWkjxMBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWhMxsqM5QCJaP97OCbM04Lq6/lCSArZnYYo/iyvrYk=;
 b=FN1IIq+c60Vb05MsQcPYQFIUBRA8dXnQCewMtdNvwMed997jAtz8FRNWHJWixlu35hPahBN9I+XyCULj6fLOhUpAJgdBCqkaEOYBllw6S6HlHDK5QB6BScwHZT3cJ+u19sUd3UqwluNfOqCZaVyG10q97TiJLlpwJAGr+oeoQqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2] x86/dom0: enable pf-fixup by default for PVH dom0
Date: Mon, 11 May 2026 20:51:45 +0200
Message-ID: <20260511185145.23750-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 640db228-2350-4255-abb7-08deaf8e5c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|3023799003|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	43QlVrp95OuIp9DciDZpepq3tuwmRnVaLKD15xv2wTjrIJZpGchBmFG0RwRkhq8oyXbXrBphPOewE9VD8J7d+WtLJiXCOzVsnWenjLG0MDKmwO5HLOVkMKtXF2PbDHxdEBjsqicFq3t/vvKh+m+C0dhiVASKxY9279n7YhaBeqUQH08Q9WC0dnyIKbo4hTiNaFpRizjaWKZf8XQtxKJaFdVfJcHFRonnyqpY8Z+nC2NHa9yhrYuqTTsVrW2o6g8L1ZYAsbX5ewsSJAVXrT8k0IoSWDAk3nPyrIkndIRAScnWPbicE11aqYVssQPa5CEf4AOtpNnGqb3OykxrTdAFUyZbTxu4y2+YJWPHmReBO7YE09j1mWzzFGodE4MWHBJGZLUA9hd5LVcbsuTGAT4mP+xm6/9NjPRRvYeWYy2kduygL+oyScm2N8wY0EGirCpCerJzFog7nEw2Cl+f+Tg3ojH1FszH4GZ+zkGUQhoRzl7+W7PgwKQ+BKpM2OD+JfPql3yV57M0SCZ91EneT/jchYwrlH1xYN9OmI6GuHSAVQ0uotHaYwjMiIb08oOKnOhtYNSC8DT/z7KYh6zYIiXeCr8CCECJx7SMnRmFUafW/cxntT+4/1GcykYgIa80McQzNRzawIOkJhL3d2U1PewXDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3023799003)(11063799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWtOYkVYeEsyMHcxKy9rUnZyWUxHZlZ2Z1V5ekxKTzlDRWVrbHhSbWg0akVx?=
 =?utf-8?B?TDlVLytualdrR1RwcVlPYUREK2V4eDBDRDBlQ3NWR2lLdiszd0dvblhzRnI0?=
 =?utf-8?B?MGgvWVAzM1ozYlpOMVNqbnVCOWU2SG1FZDNxR2NFWmJmRE1zY21tNmZNdHlp?=
 =?utf-8?B?aW1DM3g4MDZXc2t5QTRDQXEwU3Y0VklZeWVjY21KQUFmSGlNeVFiS2xTYjdH?=
 =?utf-8?B?YmJjaWh4NUhhNU10UzZSbCtKZGFVdGVFbncxaWdHbkJuK0EzSEsrVk9IWlhy?=
 =?utf-8?B?MG5SUU5neFl3TVBhRXBpc25hOHhPaURBRnlCS2E2V0kxZG93eHJBY0FiaEc1?=
 =?utf-8?B?OENFSmRic3V6RmV4V2VmZ2FVNjVCQTdtaHpEcUNtUG5lZHdFMFVpZG5SSGd6?=
 =?utf-8?B?emtDZGFmYWpVL1RDUVJzc21meENTUUxpbklGNlpuU2d5WEVhT0JDOXhub3lB?=
 =?utf-8?B?RVNHNWk2R1dkSUxnd2JnU3R5OEcvZkdMcXJUR2ljc04xKzcwTnpHdkNOZVo5?=
 =?utf-8?B?RmJ0UXd0ZURWeG5vMDhwQ3VPNXlNM3o5WGpBb2pCcCs1WWFGQk1sVkQ5bDBy?=
 =?utf-8?B?T0QydGFabVZjL25OTWdnOEFFVldPNnlsUXhVV2RxY1dZRjhDMEZ0akNPRE5R?=
 =?utf-8?B?c2hWV0JHRnpMeDRzM3Z2YXlHeVBERkhnczJzZ0VEemNyTVNOdnpKODBhaVlz?=
 =?utf-8?B?ZTZpMW1nVktIeUJXQ2lOcC9XZ1YzUVozYk9CUGZ1U3FhSlJQRjNlZ0Y0eUNX?=
 =?utf-8?B?TlFBNUxxSVpKajVPNDhWbXVpUzBNbFU3cDJpa213YTRtZFZWSm4zNkxseGFL?=
 =?utf-8?B?UktjRHJHVmNiL09UMWxuc3A2aXY5cWlCWGg5dUFWZHZkSGUzUUtqUGx5a2ho?=
 =?utf-8?B?c3Z1U3dZWGd0TVErbng4SE9IcmcyN3VzdkhIblZlN1c2UHg3MDkyYjNUZGFz?=
 =?utf-8?B?RVFHUnlyR3FKaS9SL05JOWpqZjMvKzBQSGFYNjAxNmpmWm81aDJ6ZGNBbGpH?=
 =?utf-8?B?OXJZUlVFL3lkNHhOYWtjU08vTk9uZEY4bXppajR2MXRtZ3hnYkxVTktncTZE?=
 =?utf-8?B?MTFFbDMrNzNYVlJ2NENHOWV2U3VES3F3cmJBUnRjMllaQWJVOE9CQXo2cUkw?=
 =?utf-8?B?TDg5WjNyOFhXaEFHblBJT04zUys2cDhZR0NiMFhZaFUyQS9YUmF6TnJGYnN3?=
 =?utf-8?B?dzJUbEF3RHVtbzlYTUlvZ0JZRCs5WHByNnRGR29SU3dUZlJVR1dPaEFOTWRk?=
 =?utf-8?B?M00ySkFSVXh3NVo4VHd2Y0pvLzcySVB2OVJ0MmxDV2kxQXZ3SGdJOTZ6dWUy?=
 =?utf-8?B?eC9reUlSN0VETm5NbE9mL21QaC8rYUtDd0lxSU5YdTJRRDFZTGZ1TUJnMnJD?=
 =?utf-8?B?NVlxbENVRzNhTWZoZldOVk1rNlJZODhGTmFmeFFkRFhudjBkZUU2TnRFYmVn?=
 =?utf-8?B?UU92OXJFbmFzaTA5RStqZUJRc1E1dnd6aGpBYnF4WjhrdmV0MHljeDZBR3Rp?=
 =?utf-8?B?TDA3aHpmaGRKZXlWemdmZUFaeFZxZi91T0pXbTd3VHlxM1c4RUZKNGJjTjVx?=
 =?utf-8?B?V04wYnA4UnVhWE5Gd1cvcFBnK2N3bE9scWtCa1NOYTdLYnBNYURJaVlEaGNl?=
 =?utf-8?B?N2UyZ1Q1S00rRW5CZzhHRTlBMnpPNFIyaTlLTnFZbmdReTlsQ0FsZFVwME41?=
 =?utf-8?B?QWFNYytKQmdJaVY1K3FUL2hRMkppS2NEN0IrL0dJanlXU3VzUGtEbmxXaVUv?=
 =?utf-8?B?RHRzTFE1UitBQ29sZVVTMFhnSGJIN1d0ZjQ4dVRuQTVtV0VsVlNKQVN4V2da?=
 =?utf-8?B?bXZGT09sWDBIUDBwRzhNWko5eFQ1TFpSN282OElTcURVTDl0RDI4QjdLdXdM?=
 =?utf-8?B?N21UTXZMMjB4MTMrZ1BReUpZaG9DM3BWSm9yUVBMTmxhSnBiOHF5a0k3UVNm?=
 =?utf-8?B?WW52b1hQTTVLOC9kUDJlUVRYamRkTkN2bEZkWktCa1hCdW1paEhyWFcycW9l?=
 =?utf-8?B?Ry9VTysyYVpwZUNCL3Yxd0YrYS9tSXhuQ0NXV09WVWc1OGJvREUvTm9uOG4x?=
 =?utf-8?B?Sy81clVaSlhhTzhCaE5KcUlsTDRvK1JFcTRwZmJtVFpyRVZGSzRpdkUrSjJV?=
 =?utf-8?B?YmVvTWh5QnhCZjBBSFJyempQZktpYjBwQWI4a0l2b01QK0RnSmlyL2F4alla?=
 =?utf-8?B?dVZRQ0FKN09BOThXcEFVWUh4VSsyT05oSFFTWngzVW1YQUlORE5lM0ZFbHd6?=
 =?utf-8?B?V2dHcStFU1FsRUlOSlZYczc4TjYrME9iTlhCOVdFVXFGd0dMY2Y4WjVZS1ZP?=
 =?utf-8?B?WDNqMVhqUkpJNzJGcExDa2hmYUhkU0lHWVpJTlAxV3drVnA3WHE2dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640db228-2350-4255-abb7-08deaf8e5c38
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 18:51:50.2025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0/APC6TX+xAS+anpyyMhVlEVqQFYz9ul1TrRIFSbRw2qsUs+Jnc/AC8Fs5PODVSBNt+gyKwpm8gO1LxgaRIGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7792
X-purgate-ID: tlsNG-d62444/1778525514-B695FFF4-D6233A47/0/0
X-purgate-type: clean
X-purgate-size: 3080
X-Rspamd-Queue-Id: 74697514B1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,xenproject.org,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid,citrix.com:dkim,keepachangelog.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

A non-trivial amount of issues related to PVH dom0 are fixed by enabling
the `pf-fixup` command line option, and no issues have been reported as a
result of its usage.  Enable the option by default to make PVH dom0 more
robust in its default configuration.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Slightly reword an expand option help text.
 - Mention the change of defaults in CHANGELOG.
---
 CHANGELOG.md                      | 2 ++
 docs/misc/xen-command-line.pandoc | 8 ++++++--
 xen/arch/x86/hvm/emulate.c        | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ce46020dbdb4..25f5a192ed48 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - On x86:
+   - Enable pf-fixup option by default for PVH dom0.
 
 ### Added
  - Support for per-domain Xenstore quota in C xenstored (includes
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6c77129732bf..2da90548d8fb 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -849,7 +849,7 @@ Controls for how dom0 is constructed on x86 systems.
     If using this option is necessary to fix an issue, please report a bug.
 
 *   The `pf-fixup` boolean is only applicable when using a PVH dom0 and
-    defaults to false.
+    defaults to true.
 
     When running dom0 in PVH mode the dom0 kernel has no way to map MMIO
     regions into its physical memory map, such mode relies on Xen dom0 builder
@@ -857,10 +857,14 @@ Controls for how dom0 is constructed on x86 systems.
     access.  However Xen doesn't have a complete picture of the host memory
     map, due to not being able to process ACPI dynamic tables.
 
-    The `pf-fixup` option allows Xen to attempt to add missing MMIO regions
+    The `pf-fixup` option causes Xen to attempt to add missing MMIO regions
     to the dom0 physical memory map in response to page-faults generated by
     dom0 trying to access unpopulated entries in the memory map.
 
+    Users having to disable the feature to boot in PVH dom0 mode should report
+    it to the xen-devel mailing list, together with Xen and dom0 output with the
+    option enabled.
+
 Enables features on dom0 on Arm systems.
 
 *   The `sve` integer parameter enables Arm SVE usage for Dom0 and sets the
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f3aae158e9f8..bb1bb03ac4e9 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -165,7 +165,7 @@ void hvmemul_cancel(struct vcpu *v)
     hvmemul_cache_disable(v);
 }
 
-bool __ro_after_init opt_dom0_pf_fixup;
+bool __ro_after_init opt_dom0_pf_fixup = true;
 static int hwdom_fixup_p2m(paddr_t addr)
 {
     unsigned long gfn = paddr_to_pfn(addr);
-- 
2.53.0


