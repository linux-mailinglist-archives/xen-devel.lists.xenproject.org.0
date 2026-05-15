Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLg2JPjaBmoxogIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:36:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46E554B6D0
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309728.1580780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNo16-0004kw-Ol; Fri, 15 May 2026 08:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309728.1580780; Fri, 15 May 2026 08:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNo16-0004jS-Ly; Fri, 15 May 2026 08:35:32 +0000
Received: by outflank-mailman (input) for mailman id 1309728;
 Fri, 15 May 2026 08:35:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNo15-0004jM-Fl
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:35:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNo14-000nPw-Rr
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 10:35:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a06dacc-2eae-0a2a0a5409dd-0a2a4501db64-20
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 10:35:30 +0200
Received: from [40.93.195.35]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a06dad1-c1f2-0a2a45010019-285dc323c50f-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 10:35:30 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7584.namprd03.prod.outlook.com (2603:10b6:8:204::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 08:35:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.012; Fri, 15 May 2026
 08:35:26 +0000
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
 b=qXWm5ckAYbBiIkI6GiKE0AiZNwOpZ9ZwtjgetLClONBe5j6ibEFoZgsytBEE0hs4OCBXt0Pli8NNeNkIGeEzOT8mrcdVOb0S+H3L9ZrWFFT3Bv2i6dwrTtc3JwbMtQ778OAOb3DRlvzo0g5IN1Pkl8z6yyzmFIJJKhqDX+Cxxs6as5Ou4a2D9ALI+DCZFaUa9C4C7LYUebtkKkpbdOpzxcQyX8PSlnsJ9eJl2nNrh371E7dwKB1fFOhJFtpat9G9LP8VBSB4A7yu6q5v3R42vTAD0dlz6PR6MElLIMCI0CD/XmsW3VFKkeN/72Md5EufblRhgyyqGSTb4sJfZ+/z7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eqpE36iuh13gBEKePFXJTT5jQwRd892xbr/oB6eQnk=;
 b=pJfhkTydmyP/d0fQ1nNvmeTB4ycBuIL3c6dFKy/pu9fom1CVG4r6MgUGBgwgiJW28GAyS0VUD4ml4tCF/fb2OBuBzyuWHdKnpiUHDBm2/j5nyVXf1MjS7N/QbHHwoNRr0wamsxHq5fJLPz4TpLUW903mu6cCaiK8AWK1KEOIMZzPs58i8Jl8VXPM06hv6MXHfpRR0B/b8vm/RBYTNhqzl5QEnHy/QJpnWFb3200YH/9nKdmUx3sDrJjnCxwSq11ghAqKpPJf3Ijw3r/jnS64Ha21QH5YKirqhtNUJvlbID8YZhaYniYiBMZ6bxYuHQAHgdrFw/VWq93fbmdUFsl2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eqpE36iuh13gBEKePFXJTT5jQwRd892xbr/oB6eQnk=;
 b=SUx1//L4KLwgmJoeeIeG7m5gXy4snt572FZGaCIpOLNmmq75VRI3inJ2aiDLaN07dHq6748CCixOdK68pistuNM2Mu+m5WSaAS47biSdOKtliZ8SMXs5HIQ/6kwfRvd5KHaaNkv+NsnyACuyqSnLGTpRoIjLKrPUylz21QKSgf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 15 May 2026 10:35:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: map_domain_pirq(): pirq already mapped?
Message-ID: <agbaykfrTKx3Ae3C@macbook.local>
References: <700f3bd5-2887-4f30-95b2-5dd19fb91abe@amd.com>
 <agWHLHzvhKCLQMI1@macbook.local>
 <591387c7-e78a-4bd2-ae52-c98d66554cbd@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <591387c7-e78a-4bd2-ae52-c98d66554cbd@amd.com>
X-ClientProxiedBy: MR1P264CA0174.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: e7bb3c1c-dd22-42aa-752e-08deb25ce9d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	OciSRAvFyxY2Tzm8/gNXSXASIHtOrcTkAHYpxIDJ+0OrpcTlaCfWwXKTRJWlg9tRWV2fCZkAtjaIhBid7Ex1XDA9BPkJ8P7xclufgna87V9nLGB5HgHJG/Uzen6ChvbBzYtqDjJK7Z3DI1NLIPcqPBma4K43NmlMjab8XXpySX7EmAcyFrv7rSAWXNtmgwHo3Tk09wZfkeX5OpyvahwFlVWWNcqO5vvcmj60u0VZsnrUiussKYArFE3cZsAzdFJf/PIXIeNsHvlfartB9g76f63/RpQjd/m8YmfNof7i8m3TRtLzBtH+tdFf5K2gvp0s6HvZbXZIjDU6yCC4FNtx1QpABBVZmnbQ/3tBPD5CY0ag2VCTCJt3puGS6IyVaofl/VKgqRPuNyNxrAcl1+mtaFEHsypsPep3IcHp1b6FLLItqKt7SXU5x2fTJig1GD+FbJoac/8XEiRUrwx9eDIyjrvE60LvsSe5cySPQXNmA0VfRPqhsQTFuexAQ54cqRbbM43RXXF+NaZ/rOE21+9VVY/O15VwMZOF2I3EVk7/ED8YITxcWples3ZlW1rpLvCEkwtjBCuGvHpU0ecrYfX6tqfBnjZJ56Wg1ElFbge3h507ztnBlKt0YZP4y/iJgmU766YiRuIyUDjxt4AiGam5ARceMjNCguNULl0QkNWY7LuW/5iP4JWr80dI4oT05Ial
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bi8vU29TRVZvYThzQ0grOXQwRHhlajVFUGZXM1ViKzFaZDYzQ0h1S05zNWhG?=
 =?utf-8?B?Y0NyY1hXSzZVNFBBbXoyajQrUlNjcE5mZkVsSHVxTkUySTVVZk1rR1QxYVZD?=
 =?utf-8?B?c2w5NE1aWnNmYmZTMzRtcWVUVFFZWTJ4VHF3dmFhTmt4eFMyaGhmOW16aVhU?=
 =?utf-8?B?RmhnZlUxL1VidGVTTnEzclhoRU41Ym16clpoeDZCaVN6bFdzdHBnVUdDcHZW?=
 =?utf-8?B?VkRLM2FzUC9BRVRPTVpGdmhIdmdPV2hrTUhaRXZnbmZMRHhaV0hSOVlZMjJV?=
 =?utf-8?B?WjY3d2tZcnpDZEpHZ3dwdkJldVdlRFdzUDdGMjFDdVFiL3RiUGNxRzdCa1Yw?=
 =?utf-8?B?d0U5YnpmczVtTWlxUzJxczZ2K0k1WWM4YUdNT3Z5K3lpVzR3TXE1VzE5Q3Np?=
 =?utf-8?B?Rzd6bk13RmQ5ZGUxTEdpK010OVdKZ1JvdWk0eUNyU1ZjOEh5MWlpeUowZjA0?=
 =?utf-8?B?R3JsTVNpWFUvR0p3aTBhb1EySWxDdzhyV2hQa1BsMCtGd0R3cUNNOFF2M0d0?=
 =?utf-8?B?S1V5SFVRakp5UjdlRUVINHplY3hNdm04Q0RjZW4xRzZPZ29nOHpJY1p0cG0x?=
 =?utf-8?B?UnRnekdQNjlwTFJXb2VaTm9KRVZ5YzBicThYOUpJeTBKSExXSVcwZjc3bjJY?=
 =?utf-8?B?SlpkNjd6b2hEcVlWU0c5TjNmenJ6cGlxckxHb3NqeGxTMXRCSERWanBzY1dN?=
 =?utf-8?B?R3M0Z3RPZ2tsMFByQVdGNkVsVVk3T2N2TFRUVk15NmtTbzFyZzRhTUViVzdQ?=
 =?utf-8?B?N2JQc3VORkFML0MzRWk5K0FUNzQvZkFDM3NiS0Q3Nm1CcnRvTUdaZDh2K3lR?=
 =?utf-8?B?MllJbG5jWDdMYWZIbDc1ZGRJaEk3cDZTdWVtWjJxdUUrR1VvbkVEVDJTbDlI?=
 =?utf-8?B?eXhPSm91WFZjaXpHK1pmS3RzNU1VaHlQajQvTURHcEJrcDVHbU45YXcrenh0?=
 =?utf-8?B?VTZreVBla3ExUkN3UnhMRTVYd05RZDEzWkVzeUZBZzZwdnUwNmg5Q2NPRk5k?=
 =?utf-8?B?ZDkySEJFQ2U5NTRkQU9CRXFCUkR0VTNCVUFZc3FXdHY4MHRHcnB5S1FpRFQ4?=
 =?utf-8?B?UldNRzhxSG5ualVvQjhXYzdpM001VkJNRWM4STRGVnY1TkxyR0cyVHc3cFQ1?=
 =?utf-8?B?cDRRNEpwNjJ6eG9HTGRSQ3B6WDdBWHZXQjZTMS9yU0p0QWhCaUxxSG9IdzJp?=
 =?utf-8?B?V29FOU54UUVhK1FBeUYzUDEzZkwxY1kxcTgwMGtLSElxaXVWYzFpZnJvWHpj?=
 =?utf-8?B?NDRTVUZpVUJiN3JIMDFWc2ZVNngvY2NnbEtRclEyb2Z3emw5K2RhUThtVkhk?=
 =?utf-8?B?Q2lxSHpyUDdRQWYzZzJhUm1KQ2s5K2NzYUwzUWVlaEk1aE9aVXFuS29JTmpl?=
 =?utf-8?B?bGJ2M3lUN3JxYUlUcVBMdFdwNklsZGtMRGx2WGplOENZUzZlMHBaWWpMM09F?=
 =?utf-8?B?dkp0cmttVHNqWFd4SVRZNERiaFRSVnJDcE1TYjFOTlJSSGljNmswbEx5TVdL?=
 =?utf-8?B?OStCTjhSeDNCblRVN2tTUGxLT1VNRmI4bW1FZEZVakg2dm4wN1ZnYWpGOVFK?=
 =?utf-8?B?VDZSRURxR3c5SGhuS0FxbFFUTUxXSEVSSFhiVUdVRkR1U1RMMVhBTkFrTjdO?=
 =?utf-8?B?Q1oyblpNTjdTR2dFNDFaZ3JPeVBReThRbTNtVjdYT01ha1dvdGVybE40Z3dq?=
 =?utf-8?B?WU9YNTRmSWhkWWtRdTh0MlZvTnRXcnloWXVlT2pkSGFXYkZ0QlB6aFg3dFE5?=
 =?utf-8?B?eGpBMHQxWkdZQUpTZUFEeUdEOE0rcDdTWUJuWERFWmg3OWJPTlBKUlN1T2Z4?=
 =?utf-8?B?bnMrTWxKRi81YmxqOFlRbFZvUExtSHRBNjVwQy91MnBpdll5b0ppaXVIaVBL?=
 =?utf-8?B?UHV1Mm5NSlFESUJmUHROU3ExRW85ZGhETG5uNnpmMlhDbzJLWlB6VHovbTEv?=
 =?utf-8?B?REVSN1VIS2Y4aGlyYUsva2FUa1VBdWM2Wkk1TnlaWFhHc3oxMXpndE9VVXkr?=
 =?utf-8?B?S0dwUjF2M2t2UGdmZllkNzlhSXUyejFIUWJpU0lmL0YxbXpST2hHNlhQZnA3?=
 =?utf-8?B?ejNoT1NvWlZFYm1yUmRBTHNyRmF2ZENaZ2NjWjdLRVhzdkhzVThTWE5uZVlT?=
 =?utf-8?B?QXpIK2trN0I1dWl2UUZIVUZlYWw4MHJTbDFIS1Z3Smt0a0NEajNmdWtCM1R0?=
 =?utf-8?B?SERCVWdZS1dDR2g3N1JBT2NOdjZKQzVXNE9tN3J6S2dCODRKY0JJakFUWldM?=
 =?utf-8?B?c1M0VHpIWU1jb0tRdWRjUjRqdjNrM2ExNU43Y0lZRFNVVHlVQ20wVHFUQ2ls?=
 =?utf-8?B?SXhuV0FtNFREdHhodkJDdWptWXE1TVJFNE92UHlmbTZmWUljMWE1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bb3c1c-dd22-42aa-752e-08deb25ce9d6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:35:26.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d97PYQ/khwppuTgNhTOxmsEr8B0BmFvsIAXERrWW+xPHav1av2TNEw179RhjAsnnsGyOa3iKq+PFBGMMQLhmiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7584
X-purgate-ID: tlsNG-d62444/1778834130-B715BFF4-E233B278/0/0
X-purgate-type: clean
X-purgate-size: 4589
X-Rspamd-Queue-Id: E46E554B6D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.63 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:01:28PM -0400, Jason Andryuk wrote:
> Hi Roger,
> 
> Thanks for taking a look.
> 
> On 2026-05-14 04:26, Roger Pau Monné wrote:
> > On Wed, May 13, 2026 at 09:18:46PM -0400, Jason Andryuk wrote:
> > > Hi,
> > > 
> > > Early in map_domain_pirq(), we have this block:
> > > 
> > >      old_irq = domain_pirq_to_irq(d, pirq);
> > >      old_pirq = domain_irq_to_pirq(d, irq);
> > > 
> > >      if ( (old_irq > 0 && (old_irq != irq) ) ||
> > >           (old_pirq && (old_pirq != pirq)) )
> > >      {
> > >          dprintk(XENLOG_G_WARNING,
> > >                  "dom%d: pirq %d or irq %d already mapped (%d,%d)\n",
> > >                  d->domain_id, pirq, irq, old_pirq, old_irq);
> > >          return 0;
> > >      }
> > > 
> > > Why do we return 0 instead of -EEXIST?  Since the pirq is not updated, the
> > > caller doesn't know that pirq won't fire - only old_pirq.  For
> > > allocate_and_map_gsi_pirq(), the new pirq is still returned to the caller.
> > > I would expect old_pirq to be returned so the caller knows what to use.  Am
> > > I missing something?
> > 
> > Looking at bfc341a65cfb2 it seems like this might have been an attempt
> > to keep the previous logic in ioapic_guest_write() that didn't return
> > an error when attempting to add/move an in use IRQ, while switching
> > ioapic_guest_write() to use map_domain_pirq()?
> > 
> > The commit description is not very helpful sadly.  I think the mention
> > of "And this patch also makes broken NetBSD dom0 work again." is
> > relevant. AFAICT NetBSD will do PHYSDEVOP_apic_read -> modify RTE (ie:
> > set mask bit for example) -> PHYSDEVOP_apic_write.  However the
> > semantics of those hypercalls is not symmetric.  PHYSDEVOP_apic_read
> > will return the vector used by Xen in the RTE, while
> > PHYSDEVOP_apic_write expects the vector field of the RTE to contain
> > the pIRQ.  I think this is why map_domain_pirq() was adjusted in such
> > a weird way, to ignore requests with bogus pIRQs and still succeed, so
> > that PHYSDEVOP_apic_write would also succeed.  Ideally the interface
> > should have been adjusted so that read/modify/write cycles using
> > PHYSDEVOP_apic_{read,write} would work as expected (iow:
> > PHYSDEVOP_apic_read should have returned the pIRQ in the vector
> > field).
> > 
> > In the context of GSIs, I think we aim for Xen to always identity map
> > them (so IRQ == pIRQ), but there might be (or might have been)
> > hypercalls that could allow you to create non-identity mappings
> > between GSIs and pIRQs.
> 
> To support non-PCI passthrough with Hyperlaunch, we added code to map a GSI
> to a vIOAPIC.  It does not require identity mapping, and that works.  It was
> while testing conditions that I expected to fail that I found the behavior.
> 
> First map:
> machine A -> guest B
> Then map:
> machine A -> guest C "success" from the return 0
> 
> > Explicitly looking at allocate_and_map_gsi_pirq() do you know what
> > causes the domain_irq_to_pirq() in allocate_pirq() to not return the
> > already allocated pIRQ that matches the passed IRQ?
> 
> Well, it's PVH and I'm making up a "PIRQ" for the vIOAPIC.

Yeah, the vIO-APIC auto-map interface in vioapic_hwdom_map_gsi() for
PVH hwdom does use identity mappings between GSIs and pIRQs, but if
you use the side-band physdev interface you can certainly create
non-identity mappings between GSIs and pIRQs.  That was introduced as
part of the PCI-passthrough work for PVH dom0 IIRC.

In fact what we do in vioapic_hwdom_map_gsi() might be dangerous now
that we allow a PVH dom0 to allocate and map GSIs using hypercalls
also.  Using the hypercall interface a domain could introduce
non-identity GSI relations, which would then cause
vioapic_hwdom_map_gsi() to fail.  It might be best to adjust the pirq
hint to be -1 in vioapic_hwdom_map_gsi() instead of gsi, and give up
on identity mappings GSIs to pIRQs on PVH hwdom from the vIO-APIC.

> > Overall we should likely adjust map_domain_pirq() to return -EEIXST,
> > and then fix ioapic_guest_write() to shallow such error so we can keep
> > the current behavior for that specific interface.
> Having been focused on PVH, I didn't look much at the PV behavior.  But it
> was still surprising to see the "no-op" success.

Indeed, I think we want to contain that behavior to
ioapic_guest_write() exclusively.  AFAICT the success is an unintended
effect of bfc341a65cfb2, which should have been limited to
ioapic_guest_write() exclusively.

Regards, Roger.

