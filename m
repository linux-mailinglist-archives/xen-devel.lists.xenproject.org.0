Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987D3F5EB5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 15:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171358.312701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIW9Y-0007ZL-Cf; Tue, 24 Aug 2021 13:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171358.312701; Tue, 24 Aug 2021 13:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIW9Y-0007Wv-9M; Tue, 24 Aug 2021 13:07:44 +0000
Received: by outflank-mailman (input) for mailman id 171358;
 Tue, 24 Aug 2021 13:07:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIW9X-0007Wp-El
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:07:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 436ecc96-04dc-11ec-a8d0-12813bfff9fa;
 Tue, 24 Aug 2021 13:07:42 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-XDBp1SrkNyepsesakLskIA-1; Tue, 24 Aug 2021 15:07:40 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB3970.eurprd04.prod.outlook.com (2603:10a6:208:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 13:07:38 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 13:07:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 13:07:37 +0000
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
X-Inumbo-ID: 436ecc96-04dc-11ec-a8d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629810461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCLrBAJHoTKUwYGmyV6hl09i2N5TYjzrXVJ8LOw8ekQ=;
	b=MAtbfawNiyDgnVXLkWXQdFGJmUQIjC0TqRkOug5bd6l3tzKjpTc/bP8g4AvcqMOL23p9ok
	xwRL5Isaz2t9aj7tqPjJboPrTtts3dgsrecAU0loUuCG45/QncKZslyCnhp5Jvi+0Ow4AV
	K9Jnhs05ZY0kOiiTV7CD6/KkyMYYEeQ=
X-MC-Unique: XDBp1SrkNyepsesakLskIA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FReLfFVTij874BmnkwB3du0Erz9N9h1jHAb8juyjj/erX1omqdXULTjia7HTy+0F1/WT7xgvq1Vp79pwLrr3EELtsVplU37Iis/yK4bbAFQnbKbrF2XCZpGi8FSW/oMnPhjdpwRnpxVR0EgczgtsIbAlKVt4+KaiSd+Vcz1upsLnFUZJd3g1EZuN1Kh8NGLMafWfHCxcJDz0aJ1mAp1kIY3NxJvb/EY1ln9J6kUtR16erMPSS382xVKfY3HL44AZTLY/XBHy5mCd+KRdrkgDedFtd86hcHwEP+p7cdxHEpKbsJTRrihYII0Ozfh3EamnADHSNABXKvn/2ISjdd3UMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCLrBAJHoTKUwYGmyV6hl09i2N5TYjzrXVJ8LOw8ekQ=;
 b=V17TG2mVsb2Wj/5bOgccw5RI6dov5hCnUwst0KK0EPQsrfPsK5w7iKEyPl9VqkCUwoKdkXJ5VIkwvhOagZYIEXsNhcM6eIoF/FnlQz585kvCq7Ue9NQI1Pig2tXkjq6OfTQPyrCowyV8+zIZW+dBwpwc2kR6HuXAPBjImAWTKcYeMAHDmv3ka5txf7rAFalrzBmpbULoPyL0biwkX3TcBpZEGOChgRxZqSirmtLPBMqXDdVMQwdYQ41auORsKLq9S8LQ2gJweZmYYU1LepGmcDx6dz0TyJJcxOrgsJAe9kRdNjf7GDJLl/2Mmn1A3R6MytDvDhUmjyHDMdPRv5KGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 2/6] x86/debugger: separate Xen and guest debugging
 debugger_trap_* functions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org, Bobby Eshleman <bobby.eshleman@gmail.com>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <7925a89cf830e0e3705a8700fce09a408fcfc27c.1629315873.git.bobby.eshleman@gmail.com>
 <cf162154-a988-ffe9-f6a0-40351f654d1b@suse.com>
 <56659479-80b1-4242-5689-f1a0b62df549@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac1f2de1-3d4f-4e0f-18af-6e0ec9d7648b@suse.com>
Date: Tue, 24 Aug 2021 15:07:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <56659479-80b1-4242-5689-f1a0b62df549@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1be5c19f-3806-4553-82ba-08d9670025e8
X-MS-TrafficTypeDiagnostic: AM0PR04MB3970:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB3970C12DECCEFAD4809A59EBB3C59@AM0PR04MB3970.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UcLXR682l5BYEp60+9ZR9/We9gezw6BBFBWun3sKl9cnLtgT4285VcvJcQsqI1hgNJzeAXIisclyjo9CTA2yxs0s3PJA5RY/QTwhihYhr1vVvXjs5jkskTjqq2+bprj0Eg/5cXT6SHJZgUlq1QKRBX//413WG6RCnkxPMTUhdyeLHEVIM+PRm9d/WpCJb7KHNrOob8xfW5oH+fugKXlgxMUc2VuHpBaLlaSedQslPof9eZGrVhwpEMgBczN9NjkbExSu/bbszbOEaKN7/jNdzzYqzgrWi54Da0Su8BRwmIVq9+2CBHfLT44LCGVnzZRDcALvSRZObGi4ILJGdsEpWixBQMQWxymmuNXY+M/nV4FkB6h8N9CSGe3pvg+EMBixVyi4Hs/nfwvziIJycyissoCBHI66fdRteqJSyVvyzKcO6A+PN15tyhi+D/9A+tjEmOHxjJJNBxeFMcrPrXgolDDYqGcgUOvk6sKK9yPbjFPcNQXrB3o2lS0KZjDTLce/w3CohLU1RlJjHhC9/rMuQXftsMpb1G2G1TFkiXP7alnaulsJ2piaR04WswWjVXGbufJwUb5NPxQ5gSReHKHxnGPGTomMydP3O+wbkNqUKFID1JlIQ8ybCu1ltVSlPGHSGdTZZzAJmsognFUaWgXsAXm2lKjpElZk1rh9ktk05WBQhviy09AhirMskX9liRy6dpWKvrj0iEHyJOE7jEVuiiZ7Qfa2sv+BUFb4HiYf87U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66946007)(66476007)(186003)(16576012)(316002)(2906002)(6486002)(31686004)(31696002)(6916009)(8936002)(86362001)(26005)(2616005)(53546011)(36756003)(4326008)(54906003)(5660300002)(956004)(8676002)(508600001)(7416002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yi9jWDZpLytLYjVtWGI3NWhUS2pubFFZbFRnT0E4OWZxYjQ4dFRDUWNuVWVS?=
 =?utf-8?B?dC8xelUrQk5DY2ptVTBOeWMyUG9ySDdieHhFYWhKc3pnUXBENFBzYzNxRUgv?=
 =?utf-8?B?SXlpNExpOUsxVk9BcHgxdEtKYVFRaHlCelRTNWxSV3RKWmFPS21QQml0RHdk?=
 =?utf-8?B?K2xadVVzRmNBakZDamxEWmdEZ0tjcVVjWStuL1ZrK0VYbXFubkpFSi8rSmFp?=
 =?utf-8?B?UEQxamMrRHVxUGlkVTdZc0paM3RqaUpiZ3pNYUE1VHZwa3ptQmM5ZmtnSlhk?=
 =?utf-8?B?NFFtSDdBUExUZkV6MEhWa0hkYXhveEJ3d1RLQmJDSy9DR0E1SGlNVlFXbTMw?=
 =?utf-8?B?RjE1S1ZhOVhNcGpMK3kyUHAzcDNIdHVLT3FwYVhJQTNLQ1FLbEZqNlAraWdS?=
 =?utf-8?B?c2JmUFdGZFE4ZUFVR2llUDVyRk5JTkpFdW55QlkzREQzSE42TzhFZTNxWmZW?=
 =?utf-8?B?NW5ZejdjTjNmcWFNTHI2ejFtZDhOMnBGWU0zZVhJVHVjV21FbnZVeUhuSnRq?=
 =?utf-8?B?SjFyS1BOOTNlS20wTEVycm1UVzhWVU1INnRqbXNHdWhtWkw3a0twQWd6ZklZ?=
 =?utf-8?B?TXBIODBJdURFS1VJQXhGTTFCa3FWK0xEd3JKeCtSWGF1SW92VXdubktvcmY5?=
 =?utf-8?B?KzRNeTM5a1ZCaUdxN0tBTnZlbS9mVkxVclg0alIrdkg0bHBjbHpoM01BVnBQ?=
 =?utf-8?B?VncxWmZFTzg1MTZmTE5wZmQ1Y1V0OHNzTlA4bUxyWGtPc3gvRlhpWkViYmM4?=
 =?utf-8?B?d2VrMWMwVDdkYklnL3RReUlWQXdHV2VZd1Vya0RLNDFiTHQwNkt6cExYbWk5?=
 =?utf-8?B?eXdNUWxrR2UxZEFNN09WWkpBWjFVNWtjRnNYazVvRldZQ1lkNld2bXRFaGNy?=
 =?utf-8?B?NVFTRG5BRWdtYjRvbXhUWWFwMGtwQk92d2huNXZ6am55eFdBZDd3a29YRkZM?=
 =?utf-8?B?WEdNV1N1Vmgrb3Y4QXF1UHVKeHFBb2RQclZXM3RNME1OM01lTmlSZTFnMmtp?=
 =?utf-8?B?OEl1UDdtS2plWFpqMjJYR0dLN3NDdmZRL1VOMXR6MWZsSVZQVXpMclErZGlE?=
 =?utf-8?B?ak1sWTI5OTBFam93a2V1eTQwT0t6TEQ4Ny9FTDl4WDUwa1pKRXRiTDc2VjZt?=
 =?utf-8?B?cGJmajV6MnFXNUYzOEptNEE2Q3pJZkFZOG85cDRTWnVZTmxEdklEL2FZMjFK?=
 =?utf-8?B?bkZnU0pIdjFuMGhKalFXOXYyUitPS29iMUQ2ZmRTd1Z2UG9JWDR5Umtkblc4?=
 =?utf-8?B?MlFESFJKNDJXeFZIYUFZaldRVmpwVitEOHBSSUVseXhpMzBFNUsrcy8vWVpD?=
 =?utf-8?B?L01vQ2NCdnczc3VHNC84Y2d2ekU1Ty9kSHZZaDF2ZFVGZzFCN2JZeTdlSzRY?=
 =?utf-8?B?N3pqYkVTcnFlell6UzZ0NHdLUzdqMkQrRFlNVGdwUW9aT1dCS0kwYnI4d2Z3?=
 =?utf-8?B?UjBTSWxJbHN6RXRHVFZwcnJGTnkxVklXMmtIRU5YQXVjUERJeWsvVVBDaUFI?=
 =?utf-8?B?R3VkT29Ca1d6T3UrU0k1MWFrUTBVcDA0aGZ3T0VreGV0NTY2N0pQaGI3RzJF?=
 =?utf-8?B?WkowbmtySDNtN3dURnJ1N3BMaVExVVRuVVE2Q2MvWVNoTXRQNjQrQzRNQzc1?=
 =?utf-8?B?Z1BUNFFJRHFReks5SXlYaHZ2REtINWtwbmdvZU9qb0hFc2VLYkgwTzhBMkNu?=
 =?utf-8?B?MW1zRlBHY0pla09pelBlZmJxS1FNd0RxS2xFbDdCMjh0WjlRcVhPQnV5ckcx?=
 =?utf-8?Q?/dIhxzcZgIykIWHRBMx7Re0KZVPpgLVNUxZpMJx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be5c19f-3806-4553-82ba-08d9670025e8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:07:38.4141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKkM+eSaDVlgeWTM+WVh7cYHIL+0vHPZtSvVsDzySmYhKPYpcfyUdqULWrI5+5Z+mW7z4Xpf4fO7FKEzN4dGJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3970

On 24.08.2021 14:41, Andrew Cooper wrote:
> On 24/08/2021 13:16, Jan Beulich wrote:
>> On 18.08.2021 22:29, Bobby Eshleman wrote:
>>> Unlike debugger_trap_fatal() and debugger_trap_immediate(),
>>> debugger_trap_entry() is specific to guest debugging and *NOT* the
>>> debugging of Xen itself. That is, it is part of gdbsx functionality and
>>> not the Xen gdstub. This is evidenced by debugger_trap_fatal()'s usage
>>> of domain_pause_for_debugger(). Because of this, debugger_trap_entry()
>>> does not belong alongside the generic Xen debugger functionality.
>> I'm not convinced this is what the original intentions were. Instead I
>> think this was meant to be a generic hook function which initially
>> only cared to deal with the gdbsx needs.
> 
> It doesn't exactly matter what the original intentions where - what we
> currently have is unused and and a clear source of confusion between two
> unrelated subsystems.
> 
> It is unclear that the gdbstub is even usable, given at least a decade
> of bitrot.
> 
> Keeping an empty static inline in the enabled case is nonsense, because
> at the point you need to edit Xen to insert some real debugging, there
> are better ways to do it in something which isn't even a catch-all
> despite appearing to be one.

Perhaps I should have said explicitly that my remark isn't an objection
to the code change, but a suggestion to weaken the claims made in the
description.

Jan


