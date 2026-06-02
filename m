Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gImQGty8HmrZJgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:22:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A9562D5E3
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324766.1590268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNBv-0001SU-Fs; Tue, 02 Jun 2026 11:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324766.1590268; Tue, 02 Jun 2026 11:21:51 +0000
Received: from [127.0.0.1] (helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNBv-0001Pa-Aw; Tue, 02 Jun 2026 11:21:51 +0000
Received: by outflank-mailman (input) for mailman id 1324766;
 Tue, 02 Jun 2026 11:21:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUNBu-0001NV-1V
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:21:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNBt-00Bq7E-73
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:21:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ebccb-e002-0a2a0a5209dd-0a2a450b82b8-10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:21:49 +0200
Received: from [40.93.195.17]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ebccb-212f-0a2a450b0019-285dc31109c4-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:21:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8155.namprd03.prod.outlook.com (2603:10b6:8:280::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 2 Jun 2026
 11:21:45 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 11:21:45 +0000
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
 b=jyitzpdQ01DMLj7S0AmYRSH8NkFFm4yq+5IChvInpdH4gQxlSWObw530pCJDVwbXmIYNJ6JBN6ino/XRrhF+jkmIB20ws9TM2G861kCmrB4IL3n+K4nvR4FpKZc6CZ+12BKfTMbaijeLlbpkmVD6e16exyOxRBL44+ybdEY4MjmyHLM02U8piEkQCdQy5Qoc+moWhHPmC1bnCsz97BHX1B0+HmE4CHefMhojp+VYzUCfykbFrjGVN8DzTVO3PY4Cxp9xGgiBn96LcVtBOpm/OXZY+Kjk9yWR7vNhVj5EC9uOIwAWQhqbyxzkuz/ViMoEOs2pRWCsb6FflaUQChlwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTICzdfWXlpJBWxLWgpAnjJVgiFPdK6VyaIaMNmAdYo=;
 b=DWNfOSSBhsZ6OHXb70TgZ0tY3W3zhO9oD1GuK9Z0U2gKBxs939Glw29633YIa1WYDnJJm7W/qMREhf0am94fJNpYw9ptXePYPxrGwmMFOQE7WHkvlxYmOZqX05KlH804AHmAvuuvtIGja0epCcOvMcUyAUWgvhsemWYeXHsOxr13sYdieqP0/UsZ5fuCNJBh/svmZDRNURN80T1lN7WO3G7+hzqgZsk5IFnGDggbT/PohPNGFgaOij/WERV6TJ2xn3a7aX9do0HG8muxF3HJoWesPDplKyjvgnqjJgwyYjixOhheof0ykdTef4nZfp+FI7Io+iO1PZOwO20dOJ9zEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTICzdfWXlpJBWxLWgpAnjJVgiFPdK6VyaIaMNmAdYo=;
 b=rwVQlI3HmANFpGEZnAM3uDom0fc0G0VhPq0t7ykrK6nRLz9KWj5BYNnnlvjUQFOmLR+afGV3euyPN3Xbgey28fRnTDIGXPxKjwj4N2u8icnp5UEz1UXvlY4eC0ApPm2TMeP0zvrce7XZK01VJ0BGnLVJ59a1IGIYfeYWVK9J+u4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9ada8585-9c93-4212-9184-9babc566eebd@citrix.com>
Date: Tue, 2 Jun 2026 12:21:40 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: Re: [PATCH v2 1/3] xen/riscv: fix switch_stack_and_jump() for range
 beyond 1M
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <21bc40d4a09bb4cfe0999430ea7e65b369fd4033.1779712171.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <21bc40d4a09bb4cfe0999430ea7e65b369fd4033.1779712171.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: c9415b76-5007-4acf-75fa-08dec09920f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|6133799003|3023799007|4143699003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	NM83+v8dmHzDS6Px9DambBmlDIFFMNuHFQ0JvKX0PbGN+jX6gz2mA78ZD31EOti5tQlSw1pXipdmfbHHIiW5f5zQ1jv+Fyl4d+qqCQtn8a7RNhyPplQwBsmFoxC5mloGgz7jhmiZ8ftUwtEwVR2dyaqhsirQWHjn7+Cs2+XFSYPsvFWrEwLBdLSYiBsWPjfJw7HYMdpZSh9vCava1WH2uZDQ7bFg6qSCWkScnTAFuQR/0w5pdvrjeOUs5Cn3CtXeJuBOcD05aKcJL9ePOPJtgrfwGfgGiaiNcy7NVSmJtWS0k4+mpSFUqO2o8o6DaPCYeH1J1u3YLNxji06n5dyNYr52MbZPBFvA2kGZjy/SUcpnu3HEfx8A9egr9J0hQdqdxbIR+P+fnZKcjSTDuow/DolzSmxxoE72n/JZk+6uwFAM+U6avP4u13oKCpAXjKzu1allAkM92IklwJCb/U3fAFZrrPTgNaPSgA4XtQNQhzyoikGtvi5hsYQ2RIOHkp/SYqLUYFseN9WWGgTTsP118PGLlXLrACF/luU6KWS/CkEe2sP46e8dry5U8j6aBtXpzXJu3jcTDF0ytjCK7QqAuGqVvpSMzAL8Lk1phOFLqIqINgIoQCOvdo0nV856YpZ3muXwI1VxJZniPAoAt96E7WFTqErIl4E3qWd9Tvj4hPa87JW/nm55VdKdybgDjCaK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(6133799003)(3023799007)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkhYdURSTVVHSm9pTUsxb01OSEhZWlFGejZ5Zk9qRm9KNksxcXprT3dtYXVv?=
 =?utf-8?B?OXBCRXI4Umc1dXpNRUVBUk0wbTZPVXZxc00xSUxCRHlGSlN2anZDamd5UXVB?=
 =?utf-8?B?Q05iVzRjTjNsT250MThrN2NwN09aeWRrdXZxWTVZclZBOTVmT2dmTk5jVWdj?=
 =?utf-8?B?aTJaazUrZ2VhTndsazUvRmJkUUhmTElaWmVBU09UZjRINUVGV3Y0UU1raVk3?=
 =?utf-8?B?VlVHUkhlQ2JsWXZDSTRPZTE3VUdiLzBRWU1LQnc4dWZHZjNHWklYaEdTaDdQ?=
 =?utf-8?B?cytzZGNZN1cwajRGaGFKVFE0blNBR0I0Z1RZSUtwT3FMeEZZTWt6T0w2Uk01?=
 =?utf-8?B?UFVFNTE5VHpPVnBoUjgxMXN6c3Zka3ZnU3F1SHl0T0FOY1BNN3lxNGJJUlVu?=
 =?utf-8?B?U3hEdDUyZFJWR1JtdHMrMDFJNURQbFBNMUU2bDNYSi9ZaGFma1pGanJoaHgy?=
 =?utf-8?B?ZXdkeDg3djB1bUc3N1dNNk1ybTFMMnFRYkI2bjZ6QVpTTVhha3lQczc1eDcz?=
 =?utf-8?B?NUtxSGJJUStlSFJRMmxNOStDQ3BLSks3cUNlbTkyR2VMek9jRXJjT3V6cVU4?=
 =?utf-8?B?MnJyVElkMHJUQTc0ZEJPV2NmNHJPV2JwOHVYWjhPM2lwcjRic0M1dVVBeFRN?=
 =?utf-8?B?ajhVcFQyekJlRTAyUHVjQ2RuQUlxanY2bWo0SFhkM1lUVU1ETjdCcnh2OFpQ?=
 =?utf-8?B?ZG42WFZKcGxEVy9UNzF3Uk1sUE02V0hyeURhMHUwcm0wVXZOQTFzc0V1ZzZP?=
 =?utf-8?B?bnlrbWpRMjY5UDRiNGhxcXJzY0hFejl0RHVOa2RjTk8wdy8vYlBiV2tTMlJ3?=
 =?utf-8?B?U1RUKy9ldmNpUmIwcVh5anBhWXk0S0ovbS9qYVkwYUtabnZrSGdOVlVISVlO?=
 =?utf-8?B?WjZhOGRzOFoxL1VJeXVLZ0tzaStpdmlOcVBHYXp3Sk9ZaEIzMzg3U2RmRkcx?=
 =?utf-8?B?amFlckhWb1lqMWVhVllGbVNkZUxQN1l1d2U1L25Ha1NaM1pXWWRYeXhxM2xS?=
 =?utf-8?B?ZGV1SmRYdHFwbXVwUXVrN2s5dEZVb1ZMUWExV0tsQXlBK3BSOGZweWxQc0I4?=
 =?utf-8?B?RHQrZGVtclVrSDVFdHpLVy84L2hLcWtTSTExT3FIOVlIenhDM3ZacVBVVHZ6?=
 =?utf-8?B?OUFCWklUZEkyMUhzVGJYekFJcFFVSnRaakR0L0FvWXA2ZnIwSk5Nb2UxaVFD?=
 =?utf-8?B?dmhZUGtIN0Q0WGp2cTJSVmNsV1RkUzYwZXZseTBkZG5KbDg5M1kwTlBESXov?=
 =?utf-8?B?aXBJM01ZSUVqd0JhTkdOMGNLbUZlSW82cDlSaW1kOFNxOTdyd29aWWtrNWM2?=
 =?utf-8?B?QVV0b3kxckZFNVlCWWlFb2JGVWt6KzZwQUF4ZE91SitPTEtvYjBUY1hqTmZS?=
 =?utf-8?B?d1c3VkVuRFV1N3IwSXZtK1pjV2Vxd2ZGU0U2aW1pUEZSODNORVFhd1U4ekFq?=
 =?utf-8?B?ZEZVbEtkQUczdnNUbW9vNnNBZThseHRjSlZmeVl5MTk0cmxBdUROUTQxVzRs?=
 =?utf-8?B?RTJDd3liNERWQ0tudWRUa0FDVU9YUCtUbWtvYjNxckNhTjJCN0RCTlJ0dExY?=
 =?utf-8?B?YXEzYndkbVE2bGgwaDRRdHJHdDBzdmNlYlllU00ycVRxa2FKOEtJNXo5MCtw?=
 =?utf-8?B?d0JwZ2ZFWVhTR2Y1b05oRFhyTXVtS1ZEQWl1TFA4NHlac0JrK1ZpZGZZamds?=
 =?utf-8?B?STk3TTk3Q0NtOHVZOUxLWkszUFBhYU9DRGpUN2JPKzhUTGR3aWw3cUhqR2s5?=
 =?utf-8?B?bFFXUU1sSWp0dXp1d0JuYWs4MGZ6MVRLdnR3VFRISXNraXVES2dONCtoVnR2?=
 =?utf-8?B?alp1Zy9hb2R2TkRDT1dKYXR6KzVCL2RESGhWYUwwaldjS3RNTGZsY3pYTm90?=
 =?utf-8?B?UjVaYzBvNDFoU1hUWmRrRFZUYmEra0pRenZidzlEUGZrcHhRbHVjbHhqS2J4?=
 =?utf-8?B?TGwzVG5iSlhJSlA4NHhlOCtpOW5NNWNGVWRMeVJub1dyVFdxMXRCYjIrdHox?=
 =?utf-8?B?ZVowcWxrcDErTlpwYnZSSCtWNnJpZXRtaHVpM1NlY09BK0ppbjZpejcvTUl1?=
 =?utf-8?B?S3lGRkQ5K3B1ZE9MSU1wbDhVaS9zQUVXV1ltbEkra2dSSGhZcURkVnBPRzYx?=
 =?utf-8?B?SGEyRUZrOGJzQWVCbmJqVGxGN0Z0bnVVSXVCcTFzN2cvNVd3eUVaOW1NV0pD?=
 =?utf-8?B?Mzl5V2xvbjBwTFhZVnRiT2RpQVFrWWsyRGlTNTExMnlaRHdPNE9HWExlYnQz?=
 =?utf-8?B?eHRhcnljVTk3MnZ3emdIcjJia0Q2QlE0c1ZCaDNuQUNNWUNJMnFMR0ErNUNn?=
 =?utf-8?B?VUtNU1E1Qmd1QjJsUDVXZ3pKRXd5L2hBRVpYU0lwQ2htNXJZZTRDNEl5cm1H?=
 =?utf-8?Q?5y8JjKwS2iBPB31w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9415b76-5007-4acf-75fa-08dec09920f8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:21:44.9745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMH5EZ09RNzqPT3OmMIcM+T1Gd4+Bu9sUVmxt4yDhxjVE6I8yi+Vj87ZeKZUtMjKWTifBwxPGLMmOXIxEb+RfnuddZPQNW8eLEw1+dyvRjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8155
X-purgate-ID: tlsNG-42698a/1780399308-1976AF3B-684EA8A8/10/73395122804
X-purgate-type: spam
X-purgate-size: 2407
X-Rspamd-Queue-Id: B3A9562D5E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:email,citrix.com:dkim,citrix.com:mid];
	DKIM_TRACE(0.00)[citrix.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,wdc.com,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 25/05/2026 2:20 pm, Oleksii Kurochko wrote:
> The `j` instruction (JAL x0) used in switch_stack_and_jump() is a
> J-type instruction with only a ±1MB range, and that this can
> be exceeded in some configurations, causing a linker error:
>
>   relocation truncated to fit: R_RISCV_JAL against `<symbol>'
>
> Replace `j` with `jr` (JALR x0) via an explicit register, which has
> unlimited range.
>
> Found in a downstream branch when UBSAN instrumentation was enabled.
>
> Note that the `tail` instruction looks more natural here, but `jr` is
> chosen instead to avoid depending on how the assembler expands `tail`
> and which scratch register it uses (`t1` in GAS), which would need to
> be listed in the clobber section of `asm volatile`.
>
> Fixes: e66003e7be199 ("xen/riscv: introduce setup_initial_pages")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes in v2:
>  - Update the commit message and subject
> ---
>  xen/arch/riscv/include/asm/current.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
> index 5fbee8182caa..cc004670d18c 100644
> --- a/xen/arch/riscv/include/asm/current.h
> +++ b/xen/arch/riscv/include/asm/current.h
> @@ -51,11 +51,11 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
>  #define vcpu_guest_cpu_user_regs(vcpu) \
>      (&(vcpu)->arch.cpu_info->guest_cpu_user_regs)
>  
> -#define switch_stack_and_jump(stack, fn) do {               \
> -    asm volatile (                                          \
> -            "mv sp, %0\n"                                   \
> -            "j " #fn :: "r" (stack), "X" (fn) : "memory" ); \
> -    unreachable();                                          \
> +#define switch_stack_and_jump(stack, fn) do {                    \
> +    asm volatile (                                               \
> +            "mv sp, %0\n"                                        \
> +            "jr %1" :: "r" (stack), "r" (fn) : "memory" );       \
> +    unreachable();                                               \
>  } while ( false )

Just as a note, with this simplified again, the \'s can avoid moving, at
which point the diff becomes a single line.

Can be fixed on commit.

~Andrew

