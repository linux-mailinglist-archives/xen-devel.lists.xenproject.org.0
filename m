Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 956vG3dNxWkb9QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:15:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61753375BF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264283.1555910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5mPK-0001dX-T2; Thu, 26 Mar 2026 15:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264283.1555910; Thu, 26 Mar 2026 15:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5mPK-0001bX-QR; Thu, 26 Mar 2026 15:14:02 +0000
Received: by outflank-mailman (input) for mailman id 1264283;
 Thu, 26 Mar 2026 15:14:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5mPJ-0001bR-Dd
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 15:14:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5mPH-00Gvrl-5X
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:14:00 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c54d32-bab6-0a2a0a5309dd-0a2a4505a88a-14
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:14:00 +0100
Received: from [40.107.208.33]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c54d36-5aeb-0a2a45050019-286bd0216bdb-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:14:00 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS2PR03MB8419.namprd03.prod.outlook.com (2603:10b6:8:32d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 15:13:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 15:13:57 +0000
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
 b=JevsTaBfT2I1gZ9dgck8MqFPgXAmHcnOH89t6pnCKOzF1yq9oe+NRNOdAAz5MtCxl0lW400aSNSJD6gQ/VPy2uB2bJC4YrWrMEoFVwTTOSJqtwAC6MjQq9aG8p8lfDO1kKXSQAIRW+VQKvzHg141i1/yW9s9IjwuG38CqJ12sEpFiw8QRIxG6JVmFQhDFkW5qGsw2IkcDkyhwFh6g2GVwPuCQeHGaLaIiBaF3NJKMeIqOwZqZCCB3sn4YU+OApdozCKxvr+WrTGUE0t/7JaN2jdNRf3DEw1P9BdzfRgBkX8U8sFC6J7iENIS6OoSms9Vx2WMS0iqT1A9zDNNAYm2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtfrzVuSR/1QXQWjmv8y3dYGofEGjOG8070bQ1uYjxc=;
 b=j2fbv/Ul6EV0X70ULW14I3FdWMsXb9U8NxEs6UfRTLCc0LnkMf+sAIwcUnVK/BzEr2izWIjUwtM3KeWEZE/AlU9qo0SVrLwb8uXf5IX1ORxbwpEPC6yCgvque/7lt07hXLImFbKCMYJs4PHtj5DPuMAVo/TzkFhfdP43gm5+rMoPjHETOulqtBZsCe0p0+cgd1VH381FQ0W6cC9HvgYGsy6fg4mpuSsgiRcdnaOt/0TbGwEoZ+5PCq7G5wVJzRAUA8I+REKFCsaXdNuzDfdI6egxqxlhpDMfYy8OzznlHNIAQrqOv0QzrJNO2qg8Xlif+XQgyzeYh5vRHrQxArhkFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtfrzVuSR/1QXQWjmv8y3dYGofEGjOG8070bQ1uYjxc=;
 b=qvBCrv9SnBC2xiZowWeyXnCSIE4TC4xcYLa6AT3echFaA11NgukhQx7EpKd2WTjirKi+l6KZ2mnhdfIf5x4Tj7yglY7dR2olF4BdiUE733JXBC77jAHvSEc2QuCsfuf7O1kMVLy8ELZgNNjNYmUbClLcpg+0PLUNVE06zrTMcUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Mar 2026 16:13:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] xen/uart: be more careful with changes to the PCI
 command register
Message-ID: <acVNMQ_HqRpgkP7i@macbook.local>
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-2-roger.pau@citrix.com>
 <2a00a1d2-7017-4c76-8344-018eb3f30f50@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a00a1d2-7017-4c76-8344-018eb3f30f50@suse.com>
X-ClientProxiedBy: MA3P292CA0008.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS2PR03MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef14708-f5e9-479a-fef3-08de8b4a4d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	P5lSpv3e7PX0PpXfBlqUfqzCddFHHhhltSTmB66YoZtw6/VRZ9w1jZkm6zGlH4cQy3aP5XtEkGsoGyTxO62BusajwxoonjG6TbJYz2Yoi+fREam12jd2BAnMc5zW3/MfJfXAhjjpKud/7ujTNwNdjkrPiN+cOfiExKOm9f67JhTcJAQTsde9FnsXx3MSd3OUjavbIMbldf7oggbXYroVTomt+4m9qgM79IlV867OSqieslNdCyc+rNAgqn1jo+Coouim4PRopYKscdOZFOV20DGS6Awy6OHhfG8v8Pv/30oxmg5nuAc0h5vXJiYiIOYjE7JuoaAbb6vWzaH1J98n9ANJ3Ac2NaEz3FwrV742tXsbHgHohYWvr7iRjsO3ktzapo30K9mIJUhWbyJf3/vpX0YPLcb94owixtNruLaIW+gQ8TEjC78r7s/V8G2dlA13IXUGG41YNPSo+2qzrP/QMCtzsmKqO2GIlONKuNiiv0sAwaDu9A0R2j38oTcgJVRDA5zalZe1kc1KjD+ALEDZ1G89vMxwlNPCfrUNtzfYPZr49OSqelJJ69EQP2WZr93nhLHcDL0mhuJSfNCiwkgjQpwxY8xv/Vwa9OdhhBRxrwt6G8WZ42z4qxEI7XNSIvG0S1Vahvy8jYHQrUPKd3dPWwagoHuhN60VXpTP56lZMXp3KePhjO3RDjhQZxYcBf2LNRC2tEd0PPwubcjNuORYovxs26S/KrQMPwKzG1ivJEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVhybklyczlHc3QzWUJETFhVT0lCQTdGRlVYWFFhSWdaR2ZGd2w4REo5OWlh?=
 =?utf-8?B?VktPY0JmWENYTTk4dmJld28vMmkyQ2ZadFRPaTcrWitKWDZBK2xOQWIzTUM3?=
 =?utf-8?B?YjFmcXNmUUREM2NCekl1d21CVkprWWxEeUpuYitUc2dteVVYWDI2QUwyc1Rk?=
 =?utf-8?B?TW1ldWZmTVNxQTM4N2hWTFhCRTJGZC9RcnlSakl1d0I3OG0xU2xoYWkvOHdu?=
 =?utf-8?B?L2ZicXdMemp1bUFFYjNaS0taNm1MSjNQcHdpR0I3eWgvUGErMzgwcjllWVdQ?=
 =?utf-8?B?bFhwaCtPTzk3UkIvKzh0MEF6L1A4NkN3bm9UZXZWbDFkM0VzalVrL0luZVVn?=
 =?utf-8?B?U1graEFNbmxiaDM2dzFDcGZZNjNWR2ZuRnZSVGZXcHhkSTZYQU96WnRqb0Na?=
 =?utf-8?B?dmMzODVmVXZDYjJFcnBkajlZWWo0akMzM0tqdEFka2M1a1d4OFA1NmlqTTlQ?=
 =?utf-8?B?cGRsekVMQ2hhMURBaG5mUlFTdTV2QlBHa3RSS011WTZoMThMVWJYSzU2dG9l?=
 =?utf-8?B?MFhCU0ZSUlgwMkFTVHQrUTRrYnY0N2Jza0lMTFdka3RxbjJuYXdjU09CMEp6?=
 =?utf-8?B?R3RDMFZ2dTQzbklNOFVOTG5vMm9Oc0ltN3dZeElGQndjZG04RzVMaTB6d3V1?=
 =?utf-8?B?a0ZzRXlTRzJKRGVldEpHc3M2WCsxaGdHSVRrb051N0JoV2RnUldxV3J0TGRq?=
 =?utf-8?B?T2JWUlFiQVd2MFhST1VBa05ubjY4WVlGZ3RST3BvcWZQL1Naa290aElxc3E4?=
 =?utf-8?B?RGU2M0R2ZTBSaFJLYjVqNUVKbUZ6aFhhSHNHQ01NOGpZOUVzM3VreWNBSHYv?=
 =?utf-8?B?cUFOSG5JNjdFNTdFTEduaHBsYjMzbmtYSGxzVXVCRnJGODRYd3dLdWxOMHFK?=
 =?utf-8?B?RTBaa2xRaUdhSnA3Ni91NVB4VmR6dlBpMVNERlBYeUN0WkVHRDZQYTZLazls?=
 =?utf-8?B?L1BCSWNEWmNzRmJPVnNzd01jaWpaZnQxOVhtZTcyUW9Dd3Q4aDBkZGE5Y2g1?=
 =?utf-8?B?bzM4RUlLN2ZnNnY4emhjYjJ1UHVkd3A0UklrQmpnaXBsNkJXTEI5UXBxZm9P?=
 =?utf-8?B?Rm9qeTZKbTVVMit6QWU4M1NERStUK29jUGk5SmZWMWxQbldma3h4MlRhdFYy?=
 =?utf-8?B?UjFLQUhuWGYzbzRYOCsraTBWcnM1cVh1RzAyTElQbXFjSUlreVlHdnU3K2dp?=
 =?utf-8?B?Qyt1YUF1ODZlU2dJeC9yN0xTRXp0MzJRS1lNamtveDFvTk9ia1RTeWRweDkr?=
 =?utf-8?B?UzFsWWJ2Q3hkT1FJd0JFdzJiYUNYa2VOejNzYTV6bmlvelpmVmxtdmlFcVk0?=
 =?utf-8?B?dVFDR2FXbVdvQ294NzdNb3M0RVZNSWN0NkwwRCtwL2hDTW84VzlCWFBNblIw?=
 =?utf-8?B?UDdRWDFza0E1NE5KQ3VWNjNVUlpEL3hQSm9IVUtSNjdNT3pHVXhuRDVlaEJF?=
 =?utf-8?B?aDFFeTg2OUl6T1BEb2pVSnhSR2dvbnVsWFBiUnMvQjgzTHZZa3JoaFUyL2FS?=
 =?utf-8?B?MjlnQks3bm93YTE4czUyMUlmTXpHcGtGT0k1TGtJVnlBYjcxQjdNS2tabEVN?=
 =?utf-8?B?NndpY0ZQbHZ6VTdTWWVIV1k1K2FpTXZQRzg0TnhTZ3l1T2duemxJMitXeXZN?=
 =?utf-8?B?T2xhWjZwbjlLRTVKcWNtNW9TTmhzVDg3ZUV3OFFaYjdYQlVlTmNZMEs4Q1o2?=
 =?utf-8?B?YXBCeDNYamV0UE5Wd2R0RVBsMWdZajcvVjBOb0o4bXRYSDlBamgydElraVha?=
 =?utf-8?B?ZGtqRWRjVm1GdFVCTHBGcW5BdndCSXFGa2twdFB3NnNXYlZtZUdqSWFlbVM5?=
 =?utf-8?B?eVpWOUZvUGtuNWV2a2FhbzVJRjZRQ0hWUUZib3NDRTBUc2RNcHpXTjQ1NDYr?=
 =?utf-8?B?TmczK0RnZVkxQXhJQ1N6VnpxUVFWbTZiV2Uza2hjM2poSHJJcDUzdTQ0UnA1?=
 =?utf-8?B?dU1aVzZONzlrT0NlazdQZkU0Y21HSDZPQ09YRkplbmZTSEZ2YStpMkhCZGl0?=
 =?utf-8?B?RWxFM0xrTldubndRL1oxeXVUT1ZUbUJPL0xWSndVSlNMQVhhRHZXb3d5cFdi?=
 =?utf-8?B?RXBHMTFMaCtGMjlxblhVekx3dTZ2TWtaTWNwc0NSOVdJRit2bmpoL2U2ZDU5?=
 =?utf-8?B?TFhaMy92MHcyQmQ5ajQ1S1R6VmgzN0QzcHFLc0tXV2dmM1NMYzBRcjF4Yzdz?=
 =?utf-8?B?K2ozd3BsUnhQbGNBZlYxVzcyWGZwdzB2Y0xidm81NnpObWVTZDRjVXF2S2hB?=
 =?utf-8?B?RTgyVFozOEd2Q05iTlhDenNtdUlMRzhsRDJveTQxSzhqK2ozckNNTWJ5OEZ3?=
 =?utf-8?B?bXRXTVFGMUs2dzRvOTNOanVmTDRVdmJZbkZaYy9IZ3BXbTA5ZXJGQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef14708-f5e9-479a-fef3-08de8b4a4d02
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:13:57.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBQT/i7H9/h2bVFSf6xq1juh6etkEBjuSnxuxyR1dqCM0I9v75cXMEPMI1273kVhDTe1CAOhcEtQaMM++RGA8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8419
X-purgate-ID: tlsNG-c201ff/1774538040-21A9F488-74B928E1/0/0
X-purgate-type: clean
X-purgate-size: 2977
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B61753375BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 01:02:22PM +0100, Jan Beulich wrote:
> On 25.03.2026 15:58, Roger Pau Monne wrote:
> > Read the existing PCI command register and only add the required bits to
> > it, as to avoid clearing bits that might be possibly set by the firmware
> > already.
> > 
> > This fixes serial output when booting with `com1=device=amt` on a system
> > using an "Alder Lake AMT SOL Redirection" PCI device (Vendor ID 0x8086 and
> > Device ID 0x51e3).  That device has both IO and memory decoding enabled by
> > the firmware, and disabling memory decoding causes the serial to stop
> > working (even when the serial register BAR is in the IO space).
> > 
> > Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'm not convinced Fixes: is appropriate here. There's nothing wrong with that
> commit, aiui. What's bogus is the device behavior.

Hm, I would argue that disabling command register bits for devices
that have those enabled is in general dangerous.  What about device
RMRR or similar residing in BARs, and Xen disabling memory decoding
unintentionally while attempting to enable IO decoding?

> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -283,11 +283,17 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
> >  static void pci_serial_early_init(struct ns16550 *uart)
> >  {
> >  #ifdef NS16550_PCI
> > +    uint16_t cmd = 0;
> > +
> > +    if ( uart->ps_bdf_enable )
> > +        cmd = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> > +                                       uart->ps_bdf[2]), PCI_COMMAND);
> 
> Why is this conditional? While fine for the use at the bottom, ...

The comment next to the field states:

    bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */

So it didn't seem like further checking was needed and that was the
sole filed to decide whether ps_bdf is populated or not.

However, I also found that when using device=amt|pci ps_bdf_enable
doesn't get set, and hence I'm not sure if that's intended or not.
Shouldn't ps_bdf_enable get set unconditionally when the serial device
is a PCI one?

> >      if ( uart->bar && uart->io_base >= 0x10000 )
> >      {
> >          pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> >                                    uart->ps_bdf[2]),
> > -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> > +                         PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
> >          return;
> >      }
> 
> ... it looks wrong(ish) for this path. Actually, in ns16550_init_postirq()
> we use
>     if ( uart->bar || uart->ps_bdf_enable )
> 
> for example. With the new conditional updated accordingly:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks for the review, I don't mind adjusting, but I have a further
question above.

Roger.

