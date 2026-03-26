Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM2kGs2fxWn2AAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 22:06:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD133BA5F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 22:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264851.1556157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5rtO-0005eY-PH; Thu, 26 Mar 2026 21:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264851.1556157; Thu, 26 Mar 2026 21:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5rtO-0005cA-Ma; Thu, 26 Mar 2026 21:05:26 +0000
Received: by outflank-mailman (input) for mailman id 1264851;
 Thu, 26 Mar 2026 21:05:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w5rtM-0005c4-Lb
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 21:05:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5rtM-00F3QR-1g
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 22:05:24 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c59f88-e002-0a2a0a5209dd-0a2a450880aa-12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 22:05:23 +0100
Received: from [40.107.209.45]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c59f92-1950-0a2a45080019-286bd12db129-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 22:05:23 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5110.namprd03.prod.outlook.com (2603:10b6:a03:1f0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 21:05:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 21:05:19 +0000
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
 b=iPpDi3b69Lj476m+Na6ZxiM1VPiRPmV7M8XytDhIgaKv/lg4lImnnSE4ZrTGg2GMVZt9jhFZoDTVLW/yMGr3BAFOG/+f2Yp2afArTFFOGnhTyZrr/skpMkzTV8w6hYt5SmNQaPnCE92ALcvAnE4IwrvbKRfXyRfI3QkLCIJCryZI3gQ/QPkhOuqgjbBgbbx1R4ZVFabQXg9Bk0QN/iP7nfCTaalKDihGoHwTu2j+B3BzIC9T02nTEdJv+vDoJh6tAt7GZwgOnXr53PMskrOYQMaa7xLucp7LaGyQszLYeDLzS79KIf03v7FPbPv2MCICkzxCdzbxfTem5+BPVsPXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyXi2mDw2yn5bYl8URswAtqjBe1qdET2GRNQUUqZMLo=;
 b=CtMDHXNV2HcT1IGiFJm2y3vYfVCXkhguDDNI8Deynwn1+YPwiYxgIloO9mIqCyH+pah2TUtUBjqKAjcjjMUwUCv9NYEnteEa9hbheOFHxZzuFLZmsICzWck1bt+Hv5puFKVM1rYZL5Frk47+jVsr99IU1vyHNV6IUyd0N0JFqqCRCfi8XUwLQrnkcUqrzVTcnwVK/eWSoXDrEt+AoWAcqdm5GeZy8HfCWi+li08VdyklC6LTRXQ4m93I5iUEvj1Md9kddtmrZE8WZKITToOSAU3ddTeXvAhlqAqULTjzWBDASEunog+3MsZ/YnOWFMv/YLz+qBHz1T/bArV3JCmn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyXi2mDw2yn5bYl8URswAtqjBe1qdET2GRNQUUqZMLo=;
 b=ThTU1I9xdcf4x7GuFfkpr40ZQa0jJdusGjiBKeV6L81DcUeZAxL4pR9WylSTMBTT5m8m8SJq+n7C1tXCT46lTjChi4XCZn+7HKdyd2v1VIMISYbevgeDoCcMXNnH8IhBWTAQt42/zd3eoib0c3ExY+RMBaV2i1eAReWBnq3l+YI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <08a02b65-92f5-4e78-8c34-38a22ae4d906@citrix.com>
Date: Thu, 26 Mar 2026 21:05:15 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/pv: Provide better SYSCALL backwards
 compatibility in FRED mode
To: Jan Beulich <jbeulich@suse.com>
References: <20260325170208.1115832-1-andrew.cooper3@citrix.com>
 <20260325170208.1115832-3-andrew.cooper3@citrix.com>
 <059588cd-d73e-40a1-98b4-65be01957d41@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <059588cd-d73e-40a1-98b4-65be01957d41@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5110:EE_
X-MS-Office365-Filtering-Correlation-Id: 2477e2bf-f3fa-4d2c-692d-08de8b7b6322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	m5+rC1Z+xTVE1mou5SDlODBD2/gLeJbd6kIbL7vy88weooFJsR5KCQtDFRXeebFgzSCqrrfAnKp43ubYc4TwCB52rv9nwrTuuVlszEu0HijRkNV0IxzIGCkW1dGJiqwe/ITYL38wv/63bvjdZwn7fIBx+6lTPd066NslAu6jWexhfoTFVxSTpEJITMzNrnJc7qTxZ61QtTlV5k7CbiGF/5a8Db74VzV0L3Rdv97VmLfjSY6nbceAK2QOLZA/izeN1gFTUHTiezax6x9vZJl0hRruXXINSHCVDrPIbb9Jr3wyTBOh4fKJB0T74IMcuCC9rqPTWQzqUK+vRpb15UOXeSqvl5QkG0s0JLU7ZCa4JVIfTuN4ESF9Ox9ALfzpTjLklayK4WYO2QoG4MkUbLZ249vJtUuOpYtr1wp0iti5IJOFbn5ReiQTGeip5sCEbGEbPkEuRb1uonYKpgFgZw2dr3QBoWiPTL5qpaHrDN7juZHRYHEaElrlClah3YOkCrBw/DrhoGvkIuN6ykzh7tqgiil6kc0lxksCuUj70/OAEVtR2X7kYNsIdEpbZCBpLlSTfV4/QETwNdzT9WLhFiXJH/k8ji3f+qZj8a8bDyyi9WUdVoolkF5qlf1+VBAX6R4+Yvg3MYPr6/8UuYHwZkDfHogNwh4Qq3Uk9Gy5OGfeCSzYnN+MoKa9qkUuRYX4wIQYXwp3Vac9dNRBqq/afwdd8jejxZgQf6e8wxmuxTBInK4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzNhS20rQVZVSzIzVzdrSWIzS0pEeklURXR5Ymw2OGpIY2hkUVNPM0pSbmFJ?=
 =?utf-8?B?Y0plTUdOa2xzNVR1UjM1TFI1bDI2THB1eUl6TnY3UXdUbDhYbGErdmYyN0J6?=
 =?utf-8?B?L0RQcC9sZ2tOYVRobEhGU0ZFWHoyZXM1c3g3MGx6Y0RrV1ZndXlIQ3VoYW1V?=
 =?utf-8?B?ZlVENWVmQ1BaZ0lKMm1BZXk0WXRGMFVNdWJVWjcwTEZVdnA3NzhBMjBQV254?=
 =?utf-8?B?TVRmQzlhZ0lZcnpYS1NRNWo0WGw1VlBRRnhlZDJyMTV5clBNbldWWUdqWktT?=
 =?utf-8?B?bU4ySWVrZmp0M2RTdi9UbkhIYWVBRERueGdmREJPZlQ1M20xdXF4dzdkbkpO?=
 =?utf-8?B?R0I0cEFMR3dMY054dmc1VlRiaHhmZEtsOWpLaUVqM2VNS0lrSjJDaUhoczFl?=
 =?utf-8?B?aFRybmxLNWYyZ3dvUGtrMno0NjQyRlphS1g4VE9KZ2RlZEJmSEhCN1NIaXRI?=
 =?utf-8?B?MkFsSDBjQ1RtQnZydHJQekFxNE5waVVVSW1MaG5veTlLUCtiQlFWblhJTUNu?=
 =?utf-8?B?eVB4c0FuWlU3TGwrUlR2c2dDZkxpMkJoREVYY05aVFFoOFExOXBlM3lWd09B?=
 =?utf-8?B?U2UyKzl2SkQvbllab3lvRDM2YXozV2JJOGJmMzNxVlZGUlBOODA5cndZTDh1?=
 =?utf-8?B?c2tjeVVGaklBYzRqZTlPbU40WkZoVEFGOXlxWDdIYTJjb1hlUlFsTjBmalBE?=
 =?utf-8?B?d2VmTm52cjFJamVla1A3NlZpSTl0YzNHVEV2QURCNVZVT2plZEk1SU5YMDFx?=
 =?utf-8?B?MEMvdWZGZkpNZHNEczJOT0gxZlFxNExVdFlGODI5RTlJMlQra2FmTnlETkx2?=
 =?utf-8?B?VTdySFVzSG5yZjVYak1ER3hEZmtMSStacTk3a29QWVpNdTVnNWMzU3JKMDBo?=
 =?utf-8?B?dGg4RVUrWGxsUitlVkhIK3VEL0JaNXVZZVZYYzdwbmd3N01NeHpvZkZhYmVp?=
 =?utf-8?B?WnVONGpMUUtYOHUvaVV2blQrR3IvSU9PemRQSitVQjUvOW91TVlyOVlkOEh1?=
 =?utf-8?B?d1hBVUthT3pUeEplWHlkb1oxUlhqaEpPZFVIQ3JXaU41TTBOQldvTUdyTlFQ?=
 =?utf-8?B?WEdRMDdBT3FlVU1rRFdWc2xsNGNWczkxeS9aWVR2MC8rS1ZCcURMazU0RHUv?=
 =?utf-8?B?RmpPQUxWVlJJbGNKSXdpZTE1aUNqTkk1VDhVK2l5cktrcFppaFlpWENWcmVT?=
 =?utf-8?B?RFh4dFVLR2JWR0NzelVvQjhWNThNbG9BemZDbnJubVJUTzVwbVZZVnVOaHNR?=
 =?utf-8?B?K0NrUXUwZlFxeE10b2dxb2pScmFvMWZSQ0FLY3h1ZURJakx1VmhsN3dNcG5v?=
 =?utf-8?B?YlQ2aGVFbzdsR1J4QUtkSXRQOVFrNnRKL2tRL1ZzaDdWb0VobkRaTzAwR25K?=
 =?utf-8?B?VktwOXZQSy9nRzFGSzdRUGR1K3h3UnlST3VJS1VsS3A4NEdHNEhYMStBSDl1?=
 =?utf-8?B?T2F2eUlhZkY1S0tjaFhzMmxXSnVPVm5yRzIzM1oxenZkT2g3Z29nSnI3TmZZ?=
 =?utf-8?B?VUhHVTlxNDJPSFBVSzU1T21ZV0llWjBQZnM5NFlMcVRaUmFqcUJsQmN6bzdz?=
 =?utf-8?B?M1EyN2daV2Y3THp3VmUrSS9PUHlqenNiSnRxRy9EcTJIcm9QcmFNMGlEOWw3?=
 =?utf-8?B?U0RtakZUUVJ6cTN0aXovOEpEOEJTWGo1QzVTR3l5RVF5b3N5ZzEzTjdtY3Ro?=
 =?utf-8?B?ZEVwdnIxL0JhVXRvMHZ2OGEyeWFsU1NyRlptQWFJS0dvazkydjFjeXlXRnYz?=
 =?utf-8?B?ZjVmV0pTQ2RTbEwzdTgyZ3I0NXBOVHI0TWpJb1Q0bVdUbUpGWnk1WE1BcG91?=
 =?utf-8?B?YWZrbDd6TzJ6TWVvenpabzdyTmZQbzMwUGZaSG1PcWM2bWdEbk1mNDBGU1Uy?=
 =?utf-8?B?VlRaQXBEWUt3OG5TQUJFcmt5cnZ3TnF1VUVqSnRxemwzOTd4Qzd5UUtGaDd6?=
 =?utf-8?B?N2NvUjJxNEJmaEl5b21aNys4Yi81QkcyOVJaT2hmTmg3d1dEanE1MzgyZ25T?=
 =?utf-8?B?b3FIV2FqblhRWUVsWERNYzRVQ2tJSmIxRDR3YkNaMVFSVnR1M29JZzUzVlg5?=
 =?utf-8?B?TFdNbm1NaFJ2a05YdE5BbzF6VHJDck9DOTFmNUhnV29ZUE5wcXMxN0FhZjJr?=
 =?utf-8?B?TlFvTnhUaXB3OURHSzFaV0llSmNCbVN6RzY3RlFGc1hUTjhZcjZraFMzMkl5?=
 =?utf-8?B?Z1ZjTTIvYUNNaWlIUmZtdDV5WC9kRm1oa2Rzdy9jblZneUZBZXA2ZStMR3Vp?=
 =?utf-8?B?TnAvbHdFZkxKcmRLTW9uTVNnU3hiRi9IWHpwVThvT1QzTlJRV2ZTV0JVaXNj?=
 =?utf-8?B?TDU1RjN5N2tDRjZPclVNeWVnUzdLVE5CdEgxQlhqa2hhQlYzVlhqZ09xSXNk?=
 =?utf-8?Q?wmFaHgmEddN6cOMA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2477e2bf-f3fa-4d2c-692d-08de8b7b6322
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 21:05:19.4568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ar0YFoqixvX8TQy2ODCkQxzA5LucLoRY+e3HOuQ+5wRl16chgQssaNs+Q4Iafu5skGUS9FfQA9/0+PtuY2UXeDwMWHf0aXmPTT6z5Ejwu1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5110
X-purgate-ID: tlsNG-c1860d/1774559123-F0A19726-7E58D241/0/0
X-purgate-type: clean
X-purgate-size: 3975
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C0BD133BA5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/2026 9:14 am, Jan Beulich wrote:
> On 25.03.2026 18:02, Andrew Cooper wrote:
>> In FRED mode, the SYSCALL instruction does not modify %rcx/%r11.  Software
>> using SYSCALL spills %rcx/%r11 around the invocation, which is why FRED not
>> doing this goes largely unnoticed.
>>
>> However, consider the following migration scenario:
>>
>>  * VM suspends.  Hypercall, so SYSCALL, %rcx/%r11 left unmodified
>>  * VM moves to a non-FRED system
>>  * Xen resumes the VM with a real SYSRET instruction
>>
>> Instead of resuming at the instruction following the SYSCALL instruction, the
>> VM is resumed at whatever dead value was in %rcx.
> Would it? In restore_all_guest we load %r11 and %rcx from the stack
> frame's EFLAGS and RIP fields. If we didn't, various other things wouldn't
> work either.

Hmm.  I suppose so.  regs->rip/eflags is always going to be
reconstructed properly for the records in the transmitted stream.

What will be wrong is the %rcx/%r11 put onto the guest stack.

>
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -2405,6 +2405,8 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
>>  
>>              regs->ssx = l ? FLAT_KERNEL_SS   : FLAT_USER_SS32;
>>              regs->csx = l ? FLAT_KERNEL_CS64 : FLAT_USER_CS32;
>> +            regs->rcx = regs->rip;
>> +            regs->r11 = regs->rflags;
> Don't you also need to set TRAP_syscall here, for the new code in
> eretu_exit_to_guest to actually make a difference?

It is create_bounce_frame() which sets up TRAP_syscall.

>  (There actually is
> a paragraph about this in the comment out of context above, which then
> may also want adjusting.)
>
> Further a question as to limiting overhead: Doing this on every SYSCALL
> entry ...
>
>> @@ -26,7 +27,16 @@ FUNC(entry_FRED_R3, 4096)
>>  END(entry_FRED_R3)
>>  
>>  FUNC(eretu_exit_to_guest)
>> -        POP_GPRS
>> +        /*
>> +         * PV guests aren't aware of FRED.  If Xen in IDT mode would have used
>> +         * a SYSRET instruction, preserve the legacy behaviour for %rcx/%r11
>> +         */
>> +        testb   $TRAP_syscall >> 8, UREGS_entry_vector + 1(%rsp)
>> +
>> +        POP_GPRS /* Preserves flags */
>> +
>> +        cmovnz  EFRAME_rip(%rsp), %rcx
>> +        cmovnz  EFRAME_eflags(%rsp), %r11
> ... and every exit-to-guest isn't very nice when concern is about just the
> specific case of migrating FRED -> non-FRED. Couldn't we instead make the
> adjustment when generating the save record for the register state of the
> vCPU?

Ignoring migration for a moment, there are two further cases where
things go wrong.  Consider a VM which logically does this:

    // user mode
    SYSCALL
    mov %rcx, dbg_syscall_was_here

    // kernel mode
entry_SYSCALL:
    ... setup stack
    mov %rcx, UREGS_rip(%rsp)


Both of these positions under FRED have unexpected content in %rcx/%r11.

In userspace it is common to spill %rcx/%r11 and restore them around
SYSCALL, but that's not an ABI.  This is addressed by the hunk in
entry_from_pv().


For kernel, the only reason CALLBACKTYPE_syscall functions in the
slightest in staging right now is because Xen gives the guest an IRET
frame and Linux doesn't need to reconstruct UREGS_rip/eflags manually.

In this case, it's baked into the PV64 ABI that "you will be entered by
SYSRET, so you must pick up the interrupted %rcx/%r11 off the stack",
and it strictly only applies to kernel code, and more than that, the Xen
specific parts.

If this were the only problem case, we could make an argument to say
that it would be a compatible change in the PV64 ABI, except we still
get into problems when the guest kernel is using HYPERCALL_iret in
SYSRET mode.

Linux is dealing with this problem by adjusting their unit test which
spots it to skip this test when FRED is active.  I'm not convinced this
is the best move.

~Andrew

