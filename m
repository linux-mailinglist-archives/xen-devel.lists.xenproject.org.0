Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMuhI/38jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:17:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F049912F429
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229436.1535394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZN8-0003CV-1K; Thu, 12 Feb 2026 16:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229436.1535394; Thu, 12 Feb 2026 16:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZN7-0003AM-U1; Thu, 12 Feb 2026 16:16:53 +0000
Received: by outflank-mailman (input) for mailman id 1229436;
 Thu, 12 Feb 2026 16:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hp9h=AQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqZN6-0002rO-Cb
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:16:52 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cc5f240-082e-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 17:16:51 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL4PR03MB8051.namprd03.prod.outlook.com (2603:10b6:208:58d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 16:16:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 16:16:48 +0000
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
X-Inumbo-ID: 3cc5f240-082e-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMdq7FXsLkb3z2t+xvfVTCwmxBrmidoVwZzry81W/3x8AN9Yb+2kHPQ6QHaYOP3RpYk2hR39bWKguW7Zc20aQn0KJF8mJS8hWvQQ8EM6773TRH8pgvWJXTTLB5sJ9NRwn1ipq1p0Wz1eQ2sUPZxQOHzAB8hoJVeVEYSqUDz8Pvu/tRH8ave85MCMoOf0gdoFsVNbRRsmD54AZsIDZKIGHM8P89/eCjS+THobYvHwzhQT58jRm5I47Zdfch0FuKfnQMpcGHt2MVttjv17BmVljmJRzgWhu+mymCGmHCu6Ipjz75eF02RYwo5y92B+e1kA6pyPUdqMe055EkmEWEPQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0jguUPo+nKp4awdLbsHjz2jc9ep9thbAfAS2GeKoK0=;
 b=tJR9gq6LFGi+9qlLgpvwhjA1OoPJprf5tIV251RYxa8tZ9NShReGwNIfDRNIhKQGfVdpb4lcleaLSKSx6yrtHTlf/Bh07Sf2SEtOAB6aza1bgneBzjQS/NXp8Ykn8iVmjLO00dpgZPBXRlUijg2LFqqhgJr/RLEiYvtpaH0uSp/aBjzwiqNSMSzfE9ljCXa8Lkivf9/K8TjJYARJoSumDagRCGEOJxeT+PH1Ac6qRZ7XRz41DNwbzl9qv58ur8WOnkB0VSR6QCyOKYLXSGyZY8xNicj6X9YSKL3PXslILXe8HtxGMCbZJnB3Q/HUjmv5hoth28Y6ZL3OQOucOuSzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0jguUPo+nKp4awdLbsHjz2jc9ep9thbAfAS2GeKoK0=;
 b=G09El7T214hqoADq3+ggURzHd+15T8g9OrVapgQhFIaQWIiGNoNVjsM+tQKn5J9KuglOnvzSBsJbU112wROcD+kIQWOl/4Sfsx2XHj1UmP1LOr+M3wUXNXKlWl7+Lil/MPZ0sFKPM7RCeq35b7zmBYUVq5ZLKQva1nUDhCZx3CY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 12 Feb 2026 17:16:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aY387XuhCEZ0JNTN@Mac.lan>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY3yqOTn9EQfO4rF@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY3yqOTn9EQfO4rF@mail-itl>
X-ClientProxiedBy: MR1P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL4PR03MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: 7826a4e9-7ce3-4ce9-c1ac-08de6a521fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk9kZWloZVc1RnAxQS9mcERrbnk0WGU4ZmZsa0h0c29oenFBRnBuNktXRmJ3?=
 =?utf-8?B?cGJ4QTVENzRhUjBDLy9YVzl0KzJOeVFJRDcrOFdNVFd1d2VjUFJtNUZBZk4y?=
 =?utf-8?B?UHAzdnVJQ01hQnJvWVd2bTdtT050bExLVE9MTzMwNVhjSk5aNmpFZjVBNnIw?=
 =?utf-8?B?QytRTWxTT255V3BlOWpJQ3JpM0tqTStBM2ozNXlMbEJjbENIbnBVTnFGWXBa?=
 =?utf-8?B?dGJBZDRnTmIxbDdCWko5SmNDNTNPekYvaVZ4S3JBWDljcG9GVjRVdlo3Sldp?=
 =?utf-8?B?dWVSYk5NdjcvWkFJK0JkZi90NENybU04enQ1RUUreitsdktuc1VQaGhBT1Fw?=
 =?utf-8?B?TXFVS0VYZEh0dmhSbTBXNE0xMUQxaWhxVkZTOFE1eWpYS0NBbU1pQ0VQR0xH?=
 =?utf-8?B?NXAvSVJIdW80K2VxMVFzVlZZMktXV1dvTVRBLzlYWXZRcE1IL2QwMmlGZWp1?=
 =?utf-8?B?TW4rZ2lFMlhySUFuQVNuZUZpQ01NUzZ2N0J1L3RLVkt2Y0pjRnJnZkZrSWhi?=
 =?utf-8?B?TjlMMWNPa05hT083b2c3RkR3OVhlV3NGcFkrYjV6MjlGNnFiOHMzd1c5bXFY?=
 =?utf-8?B?ODVzTGNZSTZqSE5UejFjbUVSOWpjRjQ4bnZMQUhVQ2g1bXFCOXd1dWZ5Q0RY?=
 =?utf-8?B?dXRNUzh6Q1ZIeGozYW5Hd0pIdXQyVHNrNnJOZUplRGdrcm1DaGtpU3A4WVBH?=
 =?utf-8?B?dVFMUnl6NWVjNUR5Nkh4RmM3bG5HYnl4YXU0eXpmMzF5cHIvRWFHZFVjWXMx?=
 =?utf-8?B?TzI2eHNzeFhZV1lkRzhXL2ZOeGJvUCtBaTdEYUNlMUQ2aXIzeXdRN0JtVXpB?=
 =?utf-8?B?Y3RjaC9OOGU0UkJTQUplYVFOUWdDZzJVeGRsQ0I2N3hxdzJPZXZnRmpvRTN3?=
 =?utf-8?B?UEFEemdiWm5BZ3hOQjNjTk51dHhNSDFqc1JZeTJsQUpNZjArUFFtT2xNeUlN?=
 =?utf-8?B?a3VJS1lWcExJbTN5OG5XZEhMdFJMNm5tWWZPS1hYK3M4S2t5K0I4VjlsUFpF?=
 =?utf-8?B?MzBRUUViRjM3b0ROUlhOUEVqbVBGaDlYOEZ4NWM2YUpVK0xxQVlHajkvZWxu?=
 =?utf-8?B?a1hLVllQYnMwQVlrUkhndDBodXI3Yi9oUHE5ZC8zaFVrbkw5NUJpdWQyNS95?=
 =?utf-8?B?VWNUaU9uS29DY0h6MDE5K2E3QVZocElHRG1YYXRFRU0vOGpXVWJCZHJZQzVL?=
 =?utf-8?B?OXV2YTZnV2o1Wk1ma1ZRelM0YnVPWDBwcDZicHV4RUF3TWhyVlR1dXI3NldS?=
 =?utf-8?B?UjFxeFh0NEZsK2ZaaE85VVRER29uM2FVNmJLZGZZM0N3eXRlOWtFSlZmaGlW?=
 =?utf-8?B?bVExemxqeEVKOU05QjIzalFRbXNnMmVaNDJYeVlFU3N1TGUySFVET2J3MDM0?=
 =?utf-8?B?Rno2Wk03ckkvNlNkem9hNUwyWGpIS0M4SlJnQUFzQ3h3OWhQay80b3dqME4w?=
 =?utf-8?B?WEtBcGlWNUR2NjdxZVR5WVZoRTBlaEE2dkVkSUhPT2lyMFJmdGZCSmQ2eVZr?=
 =?utf-8?B?WEFtdGpyNVg4dFFLd3VMR3p6RUd3MENKekdCaDNUYWRRMGhzZUdTaU1ZRzhx?=
 =?utf-8?B?dkFmNE1kQTlXcjgvUjBvUzl0dmRMc2NjU0taNkJtT3RKdEpvcWZ3Sk5nNkl2?=
 =?utf-8?B?cVl5UnVreDJnQ21GS0JWRVBPWVJYcjhhK2ZTcGE0M3hmNFJ0TzNpcUdlSDlw?=
 =?utf-8?B?UXpFTE05T3FxYzlvTzJBMk4yM0VLaUE5Z0NIR0tQN3lGaVRaaG82SC96SUMx?=
 =?utf-8?B?dHYyWXNZRytwckw0UjhyYWVWL0RqVHJMbTdHTG13QnVGcU1LOS9wVlp0SUpD?=
 =?utf-8?B?Ulk5NmNGa3VNVW1YOG9mY2FGNDdBVkZOQyt4dElxLzRVd21MdTZhSWxnb0tM?=
 =?utf-8?B?d2pRcmZ3aE5hVXUvYzV3eUJFcWl6MzJUVU1uNlgzVkZkdStRVXkza24rcW4y?=
 =?utf-8?B?cDd0SXkvOVhlazIvazl1Wm1sUkJ2T2FDSzVGTGVJZTduY1RRM1JZUHBmUG13?=
 =?utf-8?B?YU9KNFB0QVliZ050OTlzeGhsR21tclRQQzFkTTE0L2YweUdSRVNsSk1OODR6?=
 =?utf-8?B?M0NWaGhLcDZObmRIUVY5TWZCNlRjVWFzbnhGTFEyYTU2R1g3R083aGZza3NC?=
 =?utf-8?Q?ApEE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1djRkZjWnRqZit6MWpzVFRrM2JIQlZCcmJITzVtZHVxWW9ud1laK1gyZ2FQ?=
 =?utf-8?B?UkRmZWxrTk5IdGdReHorNVdaY1lUblcweTUvQWpFaytXOGhpbjNwbU1nZHQ5?=
 =?utf-8?B?cjdIMVdPRWxWUHhjMzhuQVhxVG4wclhNK3UrNXVyRmxMQ0NJdFFNWWJPWTJh?=
 =?utf-8?B?VFZLN1NvVFlIUVNJZTI5Ukt5WXJDdHRzYmpsMEtuek43WExmVEljK0NObmVh?=
 =?utf-8?B?V212YjJqUkM3bFlCaTVILzMrRTk0TE9tWWhmSlFKYlZQWUhIeHlTeGNQaThW?=
 =?utf-8?B?bS9DRzVpdDBqWjMvUzRIMUtVQ3Jmb2t1Q0NmNGFQdzNBdFo4NHVvSGMybndT?=
 =?utf-8?B?UWhEMzQxd2JWa0ZONEFBZjRuclRVODcvd2pnTVJjUFlEL20xR0pEQ2VkYlVR?=
 =?utf-8?B?UWJ4V203M3N5VkNZdURPWE5QMEJiQzVOYUQ2c3hRQVovSXJyZkpXRGZlek5U?=
 =?utf-8?B?SkFNMUhWYmZuYUtBT2xlZzZubG9zcEljOVJjREpPUlF2bU45Q09GUTVsb1NS?=
 =?utf-8?B?N3RrYSt3QXc1WWltZi9SK0tiUGd4Z1ZxbDErKzlKYW1zUit3S29tdFJmU2I3?=
 =?utf-8?B?OStJL0VaRkZvdFBhYUJSSUxDK1dlMXZKSERueUJTY2YvSStLR2oxTlJuSXhS?=
 =?utf-8?B?OGg3emN2a3UyQzE3aDN3bFdyMVFrd3FUb2MzaUx2bzB6NnlyWVpzOWpPR2dM?=
 =?utf-8?B?YUdhVmlORE11NStLY1pVMUZrdXdZeEtaZitkNWE0S2NiT1orS3EzRHEvbmp4?=
 =?utf-8?B?YWZKbVNEREtNMWNBOEtTakRJQVdRcTdZSHpvMEd1UFJFeW16MnZsaUt3TEhp?=
 =?utf-8?B?V21nOFVSZlYrQXNNYTlGZEtSMXdaNWRwck14T3dLOVJrUTNKWEpDa1ZpdmN2?=
 =?utf-8?B?dkRGd2NUOW9jdytpOVRSbUtxekdYOHBRRkNsN25JREd2aUJsWDJYSi9lQ25s?=
 =?utf-8?B?d0lWcjIzelAvTnRyMnJVN1AzdjVzdFFpUWFWQ2pmaTdxdmt6MlZEQjZ2ckM1?=
 =?utf-8?B?UTBpdS9sZVRIUEsxUDlFdGJOUjJvVFNRS1pxZHZ5SGFuRkx5N25jKzVhYWlM?=
 =?utf-8?B?SEVTOFlQUVhBWnR3M2RyOWhnL3FUMXVWVWRjRUQ5OVNGT3haN0t6eHYyVEll?=
 =?utf-8?B?OHd5TmhVN1hPWUc2OWsrVzFKZnAxaFYrdnJ2QUFvaE52OW81dFJpSWlZMGtv?=
 =?utf-8?B?WSttbEFJc0FkeFl0d09xSHV6WXpodWVVUTJkd0lYVUh2WkpqZHdxa3gvRlpV?=
 =?utf-8?B?TEJKdVY4YlFRWjlETk5zS053WEEzYjJwSVFGZWQza2UvaGJ4UzBOVVA0bU5V?=
 =?utf-8?B?MEdNb3lSWHFGL01IRXptV1NUQWJwQkYrcUFHeEJYQXdyZGF3VkFxMzVLSnQx?=
 =?utf-8?B?N2dBUVhSQnFIQmxsUWc0aU5zMkp0WXNhNXRjak1jbllsOHhieHVCNktNTmFH?=
 =?utf-8?B?cXV3cGhnTGpodXhZWW80QXdvdmt3TDdaZ1dvT29EbzZGRkNjK3NvN3JFbzBi?=
 =?utf-8?B?TWYrdzFKVkd3N1NjdUYvN3g0dStka0VWZFVyWmdtUFlqbXVJZ2FmVUZocTRP?=
 =?utf-8?B?NHozcDFtTFlhNGNqZlFIRnNMaHJBWFNwU3ZzWXgrQWFNQnJrcDU2L0F4RVNR?=
 =?utf-8?B?SGNMUHdFV0E0TVpuTGFsK09xYTNaZ2tCUGkyS2FWNmxISW9oQjFFbytCVXV3?=
 =?utf-8?B?MjVhamdhSS9oejZSdTl2dFFtdFgrb05NbVR4ZSttaXEvcVo0NWgyMCtNbU15?=
 =?utf-8?B?Ui9GakZEaDNITUsxWVZlY3JSYlQyb1VHWFJqN2hRdFNldG5yajRSNExYVDJB?=
 =?utf-8?B?UTNmUjR0TlhISXRzMTdzd0Q3bXFNL3JGVHcwb2ZtdmJTQnp0UC9qZFdOZktj?=
 =?utf-8?B?eVUrcldQUk1ZVzBTTE91OEt5QVd1enRLK1RvUmpEUnkvd1FNQVRxNmFNeHh2?=
 =?utf-8?B?dk5CNjJjc3VKa2hBcHJueUZwZGtqbTlMbEhuZHNHN3p6MHhPb2JjQTdMVko5?=
 =?utf-8?B?R0t3bGxEWjlOemJpN2xHZDBaS1U0Mjc0UGxJSnlCWnllYTFwZW42U2d1M3BQ?=
 =?utf-8?B?aFRkUzdBNHVKazZ0OStMK213YmRSaXdqVFREOVUyVm0weWpnbEZSemZaZVU2?=
 =?utf-8?B?dFpEZVFROThFMnZ4Yy9HTmFVOFdRNHEvc1JaNnV4YUNYMUY2bTFsQXMzVmFZ?=
 =?utf-8?B?VGhMVFdhQk43M1Z5M2QvS2U1Zk9KcTE3alFNRm9JWXgybkQxZTd4OHFnM2NM?=
 =?utf-8?B?VEtVRWluRkhUWHdNVmFEbFFYMysyZUV1T0lwb29FdWlyWEhVakFsQko1TFg3?=
 =?utf-8?B?UE9ockFERG9Pb1hndUVFeHg1anN0SmlOZlFhZjUvQUZUeUYvYWhSdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7826a4e9-7ce3-4ce9-c1ac-08de6a521fbd
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:16:48.8815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+67td1amFfgRNCrj6jHYheX6doCSXLhF7mXbRTkJ1bHbb/9jPC235eZyu+wAZ7jXOCyYbhOKs2364EBt8Z8Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCVD_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,Mac.lan:mid];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: F049912F429
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 04:32:56PM +0100, Marek Marczykowski-Górecki wrote:
> On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monné wrote:
> > On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-Górecki wrote:
> > > Hi,
> > > 
> > > Recently I started testing compatibility with Intel Lunar Lake. This is
> > > the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> > > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> > > Linux 6.17.9 in this test.
> > 
> > Not sure it's going to help a lot, but does using a PVH dom0 make any
> > difference?
> 
> Yes, it makes a difference. I end up with black screen as soon as dom0
> starts... And due to unrelated bug (in xhci console code?), I don't have
> kernel messages :/

Hm, that's ... very helpful.  We should fix the xhci stuff so we know
what's going on there.  Is the xhci bug also PVH only, or PV is
equally affected?

Thanks, Roger.

