Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D723EEDEC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 15:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167873.306482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFzcO-0006y5-8n; Tue, 17 Aug 2021 13:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167873.306482; Tue, 17 Aug 2021 13:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFzcO-0006vW-4y; Tue, 17 Aug 2021 13:59:04 +0000
Received: by outflank-mailman (input) for mailman id 167873;
 Tue, 17 Aug 2021 13:59:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFzcN-0006vO-9e
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 13:59:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d048993a-2757-475d-9dcd-36f8754f4c1d;
 Tue, 17 Aug 2021 13:59:02 +0000 (UTC)
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
X-Inumbo-ID: d048993a-2757-475d-9dcd-36f8754f4c1d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629208742;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wtn5WP+KjTNUlImYOvr3sspHcuBLG0Gp9FTlPLQGhwc=;
  b=FBF8hmAtXfGrQpg/3vJ1Vmbv5BAXA/W315RfQxZxpEHbFszBGttiKsua
   PF+pfJVfj9mywHLYHzuKD0FFJ8kxQgtleKgZMbDBP2fr8REXZiMcfcq+U
   FbSUyoWJTZ4U1WVzH8e0YbFQ1O/69O56Yj6ZiVdemuha7F09k3TGWrLvg
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QjLeqKqgAxZWPVy54x3+HU+JVwmQE4wQxrbHoi3u0XXL2Vfo7xMEI/lt6zuuGX5k15LGLUBZkI
 iN/gJQxsG0azbpMxi/0mtt6sw1NVLAzDZ09YWiAvrxLm74eJgeU+usM6Z4LQ4+ICxj+ztYWgtz
 myovgGP6oTxQyup2aRQfeKGe0QdZ5n5reYK8k0+RqpNUJLljZFvBwJCoU7eIxCqJhbCKngmowP
 i1dqxTqJUHxsNJqLpCAJbN9BZ4mYHO2/s0GG5ot2Nqq2rC3NOlkw+kaVL2AQO/pxxWzkU8M/Ei
 YLfR0c9qBQpZ0hb/tlNdqJ/J
X-SBRS: 5.1
X-MesageID: 50638493
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ofl3gqgONcV9xSn0V59bARSLHHBQXiwji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPk3I/OrrBEDuexzhHPJOj7X5eI3SPjUO21HYS72Kj7GSoAEIcheWnoJgPO
 VbAs1D4bXLZmSS5vyKhDVQfexA/DGGmprY+ts3zR1WPH9Xg3cL1XYJNu6ZeHcGNDWvHfACZe
 OhDlIsnUvcRZwQBP7LfkUtbqz4iPDgsonpWhICDw5P0njzsdv5gISKaCRxx30lIkly/Ys=
X-IronPort-AV: E=Sophos;i="5.84,329,1620705600"; 
   d="scan'208";a="50638493"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cekLOSgiDaCOhmqR2z2+CNHK2oA1FEYIb7hO+mKV8+q+jT/P8sL3/CiEdMigL87nl1UdExaa4GN/M/jqKT5gBqdfrcjE4es5+GVVZuiLKO0d5z+ys7qNK7Efa2bx0nFqh/iUEb0Ys9kd0D20OWaa/4okKz4ajdLXzpJzn4jVohHl8/c9mt5TpTZtjCrUvacI8ezNM90HwgZF8za0c+UISCU0gOFYlbL3LA4KDC3+ZK6TD1GPxG2Hcd2KNADe2QQHsLEOitRZ1IPoEujMohNtw1IQVui1cWQCCHShqL8FqmH5WX8sGxABUdIkgG9e7ebY6d8G4QK0gt/PITNlvy4X7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtn5WP+KjTNUlImYOvr3sspHcuBLG0Gp9FTlPLQGhwc=;
 b=dIYew2uVRR69MmXO9ccTxAdOjdcY1bPO162LkjzJ4VaTgqVSm6FKYckBoBf0vQ2tsGD6a943UBXValjZqI3nepzKNPTtBmQ8gMdw9/cpes3YnPdSEn2ePHRdbLv0MyWcOqOKgVqTwyrYrjUA6ythQzexBIzsJDMRIlE90Zmt0rsPdqAVDQfgGEqIs61V1miPQ73KdqSJxV0Rror0xsOoC8dqZhrSC0C6RUEnRUkg2YD7PAQ6dVQsFcLE8HFPJJrGYrzn2EcoZ9KK2ZauhfHpMMQDpStjBvmW9RPDWpz+gA1rnpBTyhBJNhegH/VtTzFrWqzdf9kFDefSyqvTK/vNzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtn5WP+KjTNUlImYOvr3sspHcuBLG0Gp9FTlPLQGhwc=;
 b=EVyQqTyMEdc4z6lXgx5jA2HfTWLoUv846JkFuqzX0QV6KHn7IkG6Ue5obmTKuMAMX9gkxFE87+fav9LuH5Bv6Ya2UfLSbJqVtU4wf5Q09ouq+mkCmBU9Qlho9NTB+EW8sa+52gp7bh8KATyCzB2OHkcvLRxnaJbkiu+4/zLoxTo=
Subject: Re: S3 resume issue in xstate_init
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>
CC: Jan Beulich <jbeulich@suse.com>, xen-devel
	<xen-devel@lists.xenproject.org>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com> <YRuhFWLrplRRV6t+@mail-itl>
 <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
 <78eb61ad-45ba-51f0-a5ba-624408d60cc8@citrix.com>
 <a704d6c5-c818-e47b-32b6-f57b2d9670f5@citrix.com>
 <96fe5a22-d1d2-1e74-313a-c5377e9899d1@suse.com>
 <b631b56d-6048-c900-a47c-f87df9dc1a5a@citrix.com> <YRu+SuX1N09pbCRp@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <beac5f44-1dd6-7ab0-9a7d-0619676bce8f@citrix.com>
Date: Tue, 17 Aug 2021 14:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YRu+SuX1N09pbCRp@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0150.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a504163-a438-4858-e0b2-08d961870502
X-MS-TrafficTypeDiagnostic: BY5PR03MB5348:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5348A58835D41B6A828254F7BAFE9@BY5PR03MB5348.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SRJLPBt5NuuPnarTZAAiXlUxDNjWjXWWgHItabxBEH9MNDZ87TAsDPJKDJugR6FKcEoMynzPeyU8pM+AIGDSEa4ocE7FUNM4gtJEx06O1qPGAJyA32QNjJDWsMtpmFn2wIxCj+u5giu3XePcYKnGLxZOanJXOCtoNeW2ozIt1xxHoas675rqcWXku0NIKkD8OguKC5jwogBqBOhlIhUq994WPMSqcA3v2dEXdExx8civai7DgirJ2MDrXkk+M4ouF2227aoUbTqvKL9lDjNEyc6QHsAZxOwnfYA8jJOIXEf1OZzsGFRNDASKE6MhOnZgheap+Vq67v2Dt1+tslGF3bZ/JP+TZuzEki5ur7TjhJcYgZcf6PmtoFpeQ6wBN8pecsYrWHjuv0tm78vvmNHIXdkUZa808VWCCgmouX/BxrtH2NQyp7B+d5yVD24q2yl/tiioqUWT0+vIlBG+OdOh7ANedRR7sMP8F9oAZIzlcXvJgfvC0yb5XwGBp0jILk1zlSGQXz4Zsk/wQ5tzKc8XvdPVhIwYB9rYAsDyfiQXu73sfmCR3wvxXvN84Q+iwBUOWaIRXDjQuux2I6W6wlBDjLb6JEjiEhO1UP2r+wrE+0bZ/bW37LKMyC3rlrmNDj89sMFu9olGVFKYbCVIFGDurLZ/+qvWDRNdt4fLN6LjbowQ1Fv34m0XGNyufIoDJTlLqsrhCrjm4FiV6yGa8wo8x0ccjq4ILPtf461VMBnmlkI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(26005)(956004)(6916009)(2616005)(4744005)(38100700002)(5660300002)(66574015)(8936002)(86362001)(8676002)(186003)(6666004)(2906002)(31696002)(66946007)(66476007)(66556008)(54906003)(31686004)(6486002)(4326008)(16576012)(53546011)(36756003)(478600001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U09kVHNxV21hQzFGT3UzTWl6VjA2NDhLT0gya1VjY29mMmIvTTZldVAyQVNV?=
 =?utf-8?B?Smt3NWlyTlFEYi85bkYwSFp5eGdjN1JDR0tJU042UUxsVmM2TG9pNTRoR0xC?=
 =?utf-8?B?djJ1T01XeFc5S1JqYWhtZUJNTGZURGFBSGJ5eU5vK3pBbEd6REQzVUhvZG1I?=
 =?utf-8?B?OENGTUE4NUg2ZEg5d3ZTTUVOZm9KeVhhdjl2amNnTDQ0VGVFaTlKODhDbVhI?=
 =?utf-8?B?ZEZyRGVjZnNpUXYySlhrZGVBVUJrdkFTTDZEbjdZalQ1RFdZOFhGelB3bnpV?=
 =?utf-8?B?NlRaaDFDUVdQQnZXZXA5OEtJYksvNUJXTUErdVhIeTM3eFZLTmdlSnNST0Fl?=
 =?utf-8?B?TjRHL1h5Q0YvdllDbSswNFJwa3JCZGFLa3IxMzFWMmlSakIvb01kTkNMZEUz?=
 =?utf-8?B?U0ZSWVMrSUE5SkFvUUhQMCtEVTg4cFZBQVcxNU1LWm81b2srYklVQWpqOE5L?=
 =?utf-8?B?RFRyOWZhaVJSeTNBV085WlM3czRFdnd5Z0pWOUJicXExZTAxQjNtOU1IWGNl?=
 =?utf-8?B?VmNTYlBsN1lGaFZnTGJtYnN4b3d6OEQ3ZFdydEswc1YzdzFVOWJCWDl6bzU5?=
 =?utf-8?B?Y2pua1RiWlVHb2tjSiswN1I5a0tUUmpxWVlCWHVubnR6NFM5M3B6Qy9ySXFI?=
 =?utf-8?B?Zlh4N09HdnE1VFBDRmZEQTQ0Z2JaUGE5Sk0yM05jWWlPa2x4VWtuWDZUQjlO?=
 =?utf-8?B?Tkw5QjBTRHN6UVJiSmJZUno5VjdwdmliVTl4U1hWRTBoOXVnRURUcEtTSnN1?=
 =?utf-8?B?SFVaS1JMMTZuc2NsZ092Sy84MHY4ai9SM09hRDE4d2N2VWRMa3loK01KNVpY?=
 =?utf-8?B?NGFPMm40VzVWYkM2dEpNc1JCVjh1ajJMR25STFlkU0M3UGdPM3ozbmtsZU5t?=
 =?utf-8?B?RGp1SDlvQ25DZDJzSGVYZTg0UVZsM3N2L0VQNUFGQWd3bFhabjVBaGZ4ckVT?=
 =?utf-8?B?VFg5Wms0NTZHbDFPbXV0VEVEWVBsQ01EYk1yRlVCc3VjTzBDTGhicDY3Qllp?=
 =?utf-8?B?Q21tWXJ1ckp4S1hvakVkR25PSWtkMC9JTTNuVVIvTlczVlBFN3huakRGOGM4?=
 =?utf-8?B?SzBLNVF6MDB1NXB3bUNVL3kvTG1jVXcrcVQxMnByaWtXbEVKdWVvWnlGQVEw?=
 =?utf-8?B?L2JtUjkzbGVHVElGaUR2NGM3cHBiUzFhUUFLdlB4T0ZvREgzaVBiK0NZUjVQ?=
 =?utf-8?B?R1poL3BsbU45WmJTSWFnMXBhU29hOFRHcUxGcFZ5ZEo2L3ovMzQ4QnBNWmlo?=
 =?utf-8?B?QWc0enM0N3I3bUtTRFZId0RQdnlZZXlJdXRLWTViaE5HdEttNHRCYVh1R1ZM?=
 =?utf-8?B?U0dDeGZ5Ymt3Qld6VUJjbFF2a3M0YmVDdlg5RU42Qm5yaHAxZ2NjUjd4azhi?=
 =?utf-8?B?SHJ4eDltNlRuQllWQ0ZhWTRaWU1sdVRrWXpoQVJHU3NMU3hDSW81VjloUlZl?=
 =?utf-8?B?R2s1YUVYMW5lM3dhK21BWGF0cWQyZzRvTzVrSElRekdxL01iUmhTWlZJRzBD?=
 =?utf-8?B?cXlPdTAwVEVDRDA4TGFzeW9aZWowNVo4Zi9pVHpSYU5mSW03NE5uVFBSNlJ5?=
 =?utf-8?B?d0RaaklUU2I2TkhTeVlSSTh2VStBci9UZGFRR0JZMWNMNWtySFl3b2JFTEJn?=
 =?utf-8?B?Z1BJc3VCSEh2YnZ4azdnWmRpaHpEbzFUcnhYSzBjMVNIS1ExMmNBaE9xTE9p?=
 =?utf-8?B?MUF5cDNqanB0T0xZdTRqUkpoSXlkWlA2SWNCYlNya0RidjhRUUxqS1ZxRVVE?=
 =?utf-8?Q?/yaAhWSJAduSS1fii1TnnUZVTwwziDya/lBhtyz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a504163-a438-4858-e0b2-08d961870502
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 13:57:58.3439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/jbe9W7uQGnxy+xjmb/c9esbtrNXpgx5CUFax8Q/pnxgPRez1cQObFeewGIAzEGMfMuohG7g8P9v6vLfaBRN5YOtAatESrDZytDvyVuezg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5348
X-OriginatorOrg: citrix.com

On 17/08/2021 14:48, Marek Marczykowski-Górecki wrote:
> I've added similar cache init for XSS - and this one should be safe-ish
> - get_msr_xss() is not used anywhere.

XSS, and compressed xsave state handing in general, is in a dire state. 
What exists in the tree currently is a lot of dead code.

I started working to fix it, as it is a hard prerequisite to supporting
CET for guests, but as usual has been pre-empted by more important things.

~Andrew

