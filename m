Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6898D5C35
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 10:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733423.1139673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxGK-0007j8-7u; Fri, 31 May 2024 08:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733423.1139673; Fri, 31 May 2024 08:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxGK-0007g8-3U; Fri, 31 May 2024 08:05:20 +0000
Received: by outflank-mailman (input) for mailman id 733423;
 Fri, 31 May 2024 08:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59kU=NC=epam.com=prvs=2881f902b4=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sCxGI-0007g2-Au
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 08:05:18 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83b65c3a-1f24-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 10:05:17 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V1UdlF013884;
 Fri, 31 May 2024 08:05:06 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2233.outbound.protection.outlook.com [104.47.51.233])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3yev5nt87p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 08:05:06 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Fri, 31 May
 2024 08:05:02 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7611.013; Fri, 31 May 2024
 08:05:02 +0000
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
X-Inumbo-ID: 83b65c3a-1f24-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vp6yV8MsnM3nl3DbwOMEN9f5mS8CZc8AZSDoroDmiMuEMwOfys1ubxU8TlGP9+dkxTa2qUgUMUIpahnq+IHZDDhV+9sAQudOgBfNhsprgCojt5qD72EwJhZzpYiV0p4pe3bHmj16m4H80owEc/NM7b/5OTJJW50kXAkp1y6fmpIc6jFen1TrsDBx56sIsd5v7HJC9vMoCn7NZIqBA0wBhdKHjjpWwYJGJUyfVcWvdpB/G5USQPrbA53sJY1T3cxSSAa413RS7R/2H8nImgkGjBr1O1cMFBSdJYZhGomSZelHSWsnQmgs/reit+aAKTm59vwIN+cz4BkYlfk3GGTKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9tF0rt+SyqLrQlBLDjA2AhwTEJNKlTC9BNsmMaHhNA=;
 b=cH3/eg4OonlmShqQTfG9C0DZldr4NNFyNwAFC5rGTsVza06f+OJnjhOBCB2PT98enTHhadD8Y/XTcUJRrwwNNTIaBjHFMAufuOVy+ERZW6I3JirwZBYpaT+Bxci0AdvsTocTya19aJT84Y0R0Rzw5TbVYjGHH8a7hBMq+eppw5oAUhd8DWWRtfJf1xeTpzRiKcuLoqdYFZ9weBiT5opnoYmQymj65+oUeghcMPEhKmO09n97BBcdMqQ3HofC7cPzw4t/GVDtpo5b7m9RyYG+DVS4Tx9Fl6Gy/7zm+Slc9KSDR8Kc+YutVbkwT5BdW2bkfheajOxOg86QWTn8+v92pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9tF0rt+SyqLrQlBLDjA2AhwTEJNKlTC9BNsmMaHhNA=;
 b=qMxadjsl3Jb+w8aSWG1URX1ROQsiqL9b5518AVK13iHMcm1FvxGsMkwPDhYn+Zk5+n0cRCdnx07zN6Bi4F+JwznfW/19hLtafa8xG0QK9a3JPNh0MUjASSiG/RMUScRMpYaz+vIegR/diK32sXWKLJa/xtY9BDW2Kn6490bhpLWeCPAUNHdHk+IfCmKRKy9gJ8drKcEodOoaEFjgY2t2kHQVuMiQpFmYnBA16AxEvo5bWBmZOpzvUNQYlsqL2swlq8RGCnKv00K/erF54QHYIlX+c3u8o4u4KFKEmFM4hQkQuz1tXkBNsP83QGXDuSD2xGZo56HF8m/jfeavdri9LQ==
Message-ID: <a38ac7e4-cf47-40a4-b76c-6752237b1ccc@epam.com>
Date: Fri, 31 May 2024 11:05:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 13/15] x86/ioreq: guard VIO_realmode_completion
 with CONFIG_VMX
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <9e64fa33b298f789d8340cf1046a9fbf683dd2b7.1715761386.git.Sergiy_Kibrik@epam.com>
 <376d2e89-da6d-49c2-90aa-aab4af6eb0d1@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <376d2e89-da6d-49c2-90aa-aab4af6eb0d1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM9PR03MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: d48f7cc0-35ef-4097-b925-08dc81485fb2
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RTNtMFFndnlPcW0zREhEWUkvMXlJN0tFdTlQaGlhRE9pdVo4U0tOWG4rTUJJ?=
 =?utf-8?B?SzhaSFFkR29NSlFoK0Z1T0hIbWFkaElSVTVSWElrY2hJMlVBYWFyaXcrTHM4?=
 =?utf-8?B?WHc3YXJtQkEwOURiNnBWYW9uVUJjN2FFZFZsZmNkYkpvMUtkeEtUR1liZGxl?=
 =?utf-8?B?NmYwd1I3YW9QdmI4eXF4dm9pdVdDTTVrSkpLaUlPcVQ4MkdvSjlhbjM1N00v?=
 =?utf-8?B?SlR4eUVXb200VGYvQlNlUHV2OFZhTkNlTlVBc2pPOXNaMVhNYjJTK0ppQ2gx?=
 =?utf-8?B?S3FJZGRNLzdrTVZsTWJuTjdDZ1RJUktzdzJSUndMdVdTMElEbkZNVmhJcmlE?=
 =?utf-8?B?WnNHWS9vc1VrOGN3NWFsZitGcE1kcmlmTHg2YjY5eERDTFZiOHlxY2ZwbU13?=
 =?utf-8?B?UHhVTXU1eTRyQlMvWmRGMDRJMFFJTENFU25lOFdGOXFqU0ZsSmZybkdGZTdN?=
 =?utf-8?B?UmcvekJjcVE4d0RLMTBZNmxCUWREc1owWm1DSTlnc0R0eTdtZTJkNDJsZ0t6?=
 =?utf-8?B?RUZEek1WMWorYWhGNnV4dmtmZi9NU2ZoVXBPdGY4QVJGcUdQYnNZeFpRZGZZ?=
 =?utf-8?B?dDJHMWx2RWViS0oySTYxbjExcG9vNUYwUUJ0MHdzWHFYS3M1bW8zdHdMN2Nx?=
 =?utf-8?B?YnFtMlpJWXpPTGhoOE1kUmhYSVhjK29aSWhVN1pWUTJ6YXl5cEFFU0w5ZXdr?=
 =?utf-8?B?ckNEVWlTZ0hXMUtFakk0dGpOUXVtL3NwVVppNXN3YWppVWtmcksrRHk3cnE3?=
 =?utf-8?B?b0xucnJOV0kxcEZVS0JJL2kvNTg2NkVGcFpaVFN5WDlkTWVOdm1vV0kxU0Fi?=
 =?utf-8?B?bGMyVDVKajdSS3B3d1FNUkRkYnNjWEVPeUVLMDNIWXVwTzhhVVJxWm5ic2VB?=
 =?utf-8?B?VlNPYjN4NEpLSDFJVnJmTnoyemUzYldRejVrZ3BNMDVmRGpvd01YOUQ5ckQv?=
 =?utf-8?B?Ziszb1AyUnJYRHZUdjdDWCtrcmVpYUZqRDZaYXFIU1dDaU5LRFRSdGV6blha?=
 =?utf-8?B?am8yQ2RYdU1pazZTWWZUTEFPSjZvZHZ5TnJNc05OcUw0NTlsSjNLNTZURG1h?=
 =?utf-8?B?WmdUaDd3S1JaVmNodDFmTG9mRktKNTFmaVo2NUpUNHR0bGQxTVFva3FIaytX?=
 =?utf-8?B?clJ4dmRTamhZWmthR1NVcXh4TExCVE01anZIU2RlOG1hR3MyV2xOOHN1aVRj?=
 =?utf-8?B?dGdtdUQrNmFsZXpGYXA3UGFnaDBQaGErY2dnSVg2NUhJZ21wRE0ycVVLYmRa?=
 =?utf-8?B?ZzY3QTZFOWNaYytlU2JnR0NIL0VrZ0NMb2tNOHl1RStRTm9qL3VNRzlnbzVQ?=
 =?utf-8?B?cmNEUkRqOUlkMjFSMGlEcDUrcmg3VEF3RVZUakxQZHlKYkNGVWhsT0FBRU84?=
 =?utf-8?B?WFM3bHhBVzVQL2lzcUFReDVkdDhPYlFoRFg4aGtTYVpNc0lxQWp4czBuVmt5?=
 =?utf-8?B?bmgrNVM3NkhOUkxOaktsbUU1dFB3VGRjUWdGZ3NSRTI2djlKQ3hoUmdHZFp3?=
 =?utf-8?B?SnRWRmJiUTZmQlRycEkrRTZHSEF1SDhwalNFMnhVNDhVdDA2eXJHVHl2Y3ZC?=
 =?utf-8?B?bks3RXlJdXZqUEpESm40OWhDTDlYS3RpWk1MSWtOaG1xS0ZucDM1V2M0UnZx?=
 =?utf-8?B?NnZoa25DWUx0RG4wZXpCdzRnVFM1TExQRzh3S3M0a2JaSzN2UlJ5a2ZzZHJx?=
 =?utf-8?B?dzNvdDJxOXVOWXdLRTNsM3ZoN2JTNTBOTlNGNGtGV3NxcnFFZEpQeGdnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXlmZjQzZ0FUbVBCRnVlR3dkRy96SHgyTTJaSjlHUHZUOHFtdXZqeXZnTlN0?=
 =?utf-8?B?ZzlMai9aY0JjRXA5aHo5VjhiYUxCMGFwcXEvZFdXV0U1U1JrUE05YVBudVN5?=
 =?utf-8?B?MXAzZjhyNU1vbmhWS3MxWUNSSXhoQmJPMktDZnBveC9FaDk0ZEpCQ01DYktv?=
 =?utf-8?B?b2Z4VGFjUVBnNnVsYzJibkFNcTdKV3Nmd2VoSVBTaXh4b05PZnZ3cW9lUkZj?=
 =?utf-8?B?SmRCYnI3ekY0djdJa2VMQ2VZZ1NLa0dmUTI5emRVT3lORVpMempOZW82RDc0?=
 =?utf-8?B?eXZ4eHVjVnUrcnpWYVRVaHJOaHNta2UrekZBYS80VXpFdDEwcUxHOGFoOXVG?=
 =?utf-8?B?aUJ5TVdMZjhCMjRKekhyV1RXeUZFZ1dnV2poVFRySmxPdFhUOUFFa1d4d1ZT?=
 =?utf-8?B?RUpRWkg3dTgyaTkvK1BiWDQyN28vUTdnblNaeGJRTmtsajYzdEpaSWxwRjc1?=
 =?utf-8?B?MU44S1pISlkzdGN0RFlYOHphaW1vZXViQkhxV0ZuMHVLMDVscHZxSFNnRTRM?=
 =?utf-8?B?MlJrVDNacjhFYnlxVHdFWlIyWDFxQ1BIUHVxOS9iOXFhVjVXdTRCeEQ1ZUxt?=
 =?utf-8?B?OEdzOE9lSUwzNlJ4c1ZNeU9FMjRlSzdSYXYxbUcvOU93MmNFUXdxZm5DMEkv?=
 =?utf-8?B?SmdwaVk1RnVtVnRMckNVTWQvUWlMVjY2STh5WmZnZjdyVHNnMEU2TVMydVFF?=
 =?utf-8?B?OWZIR3hiYVFERks0Q2ZnYmR0UFRCRnIyTk10cnRMQURvUzIvL29SMnZZVEJ6?=
 =?utf-8?B?WG45c2pEc2J6eVplMWhZekdwdi8yaGZKYURGVGUrUDlSN0RuQWY3cHZ1Z2dO?=
 =?utf-8?B?NkVjSmFaUUUyaVBLQy9IN25keE5sdGVsa0ErYnBVSk5hbDBhRVFraU1OSGYr?=
 =?utf-8?B?YVkreFR6UzN6TVZpc2tHd1loRXkwQlhaRVBFY2hvd3poWlFyK3VyVmp4M0pF?=
 =?utf-8?B?ZGxhV01YNjYvczdFczFzMGR2RnpidFJmYUxpUlVZSCtJK0EyY2Y0SEI3RENF?=
 =?utf-8?B?L0RJS0pvRFpaRWdiZHRXOGVjSURBUFA4M2lDMFJvTTRxNHRtL2xnRFBOS1B2?=
 =?utf-8?B?Umc0bXRhait2YnkrUW1qNEZJN0plZnhDMXpUV0RqOTkzWnRiNHVwNWduZ2lx?=
 =?utf-8?B?d0FhclVOcHJ5NzdDWG5VVTlCcVk4Sys1QklTSkdPUlowRmEyZDQvWHRiVHh4?=
 =?utf-8?B?Uk1lRHlSbXhFbWRFY1c0cDlhN2NOZ1VpL0lZMExlRC9MTXFFU0RoT1dmd3M2?=
 =?utf-8?B?WUpMbXpjNGpVWmkrOHBFUEI2SUEzUCtrYk5BVU9tTVRCU0Q5bTBSRTIrVUds?=
 =?utf-8?B?dkE1bHRKUmRDcVBTbE9JcXBLWEdVT1JBTjQ0dmp6RkpIMUtJQWtpVEE3NVM0?=
 =?utf-8?B?VzFRbC9wM2JJWlc3d2JKeXoxcFljeWlIYXAzcDFoMFdiejBxS1dra2ZoOXhv?=
 =?utf-8?B?eVF6bDRtQTUyTmovdXIyYkxYMXJDOFdYM29xREovSXorUkNtWkRtSFRLT0JN?=
 =?utf-8?B?SlNwU0hlbitQc2JSWlRvOTRicVpBWHZ4MXp0eE1HL00xdmxwRXJmNmUrQzRM?=
 =?utf-8?B?eldRNFdhQnU0VlVKc3IvclpqVVJWS3ltb083R1pvNzZCT1RrSHpuVG14M0ln?=
 =?utf-8?B?bTdON2JneG92dUFGL2hhME9RRDI0TlJLMEtLQnl6VUQzRzNRTnZIdi82a0xy?=
 =?utf-8?B?SENYb2JYUjhyY2VuNFAxdU8zOFJYSkpSQ2h6cjEydVF3dDFwVEFQeEIxdTFa?=
 =?utf-8?B?bG9qbjFiZGNReGV3bXp6SzNDckxFMVVRc1l5cDVmMlhXR2M4NzJOemt4bUhs?=
 =?utf-8?B?UE5TcmZadCttaEx5SEM0K0JBRXF0Zkg2UG82OWg5dEV2cS9lQWpIV1VvcSsr?=
 =?utf-8?B?aW5OVUhRV2VHMStoMlpFYTZPS0NTQ2NGSkJJa0V1TVlWUWJ5Qk9ZNjI1SXNK?=
 =?utf-8?B?a0d2Smt5alI3WlpnSVZab2lIYm90YXJVVTgxRHU5eWRUTDJJcWpEajBGbW5H?=
 =?utf-8?B?SGV0SzZWM1VIVEEwbG5yekhaM2hNdFdmejk4dk1CZlhCUUNWSElJUkpGajZX?=
 =?utf-8?B?bkdSWVd2RDFkTnhtc0t2d1dNMVFLRWV4UjBmL2UzUTZicGVtalhWVVNaM1h5?=
 =?utf-8?Q?l9hsjQQMrZ/IvuRc7/X0D75xP?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48f7cc0-35ef-4097-b925-08dc81485fb2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 08:05:02.4293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4g7h997xKovxXBB9leyQgBOSEZ/FQhhvrL+EIUc/jWmme68Yk+JlEMKCdu3wQUpy8wuWfVQ8fiktzJwn8nEVgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-Proofpoint-GUID: OFwW0wZ9w_2CmkTD_SutCZ4ELe3zU_oC
X-Proofpoint-ORIG-GUID: OFwW0wZ9w_2CmkTD_SutCZ4ELe3zU_oC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_04,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310060

16.05.24 15:11, Jan Beulich:
> On 15.05.2024 11:24, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -2667,7 +2667,9 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
>>           break;
>>   
>>       case VIO_mmio_completion:
>> +#ifdef CONFIG_VMX
>>       case VIO_realmode_completion:
>> +#endif
>>           BUILD_BUG_ON(sizeof(hvio->mmio_insn) < sizeof(hvmemul_ctxt->insn_buf));
>>           hvio->mmio_insn_bytes = hvmemul_ctxt->insn_buf_bytes;
>>           memcpy(hvio->mmio_insn, hvmemul_ctxt->insn_buf, hvio->mmio_insn_bytes);
> 
> This change doesn't buy us anything, does it?

why not? Code won't compile w/o it.
Or do you mean hiding the whole VIO_realmode_completion enum under 
CONFIG_VMX wasn't really useful?

>> --- a/xen/arch/x86/hvm/ioreq.c
>> +++ b/xen/arch/x86/hvm/ioreq.c
>> @@ -33,6 +33,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>>   {
>>       switch ( completion )
>>       {
>> +#ifdef CONFIG_VMX
>>       case VIO_realmode_completion:
>>       {
>>           struct hvm_emulate_ctxt ctxt;
>> @@ -43,6 +44,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>>   
>>           break;
>>       }
>> +#endif
>>   
>>       default:
>>           ASSERT_UNREACHABLE();
> 
> And while this change is needed for the goal of the series, I wonder whether
> it wouldn't better be arch_vcpu_ioreq_completion() as whole that then gets
> stubbed out.
> 

I'll post a patch to this thread to confirm whether I got your point 
correctly.

  -Sergiy

