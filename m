Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05720356AF8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 13:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106612.203865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU6AL-0006R2-Le; Wed, 07 Apr 2021 11:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106612.203865; Wed, 07 Apr 2021 11:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU6AL-0006Qd-HL; Wed, 07 Apr 2021 11:16:09 +0000
Received: by outflank-mailman (input) for mailman id 106612;
 Wed, 07 Apr 2021 11:16:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFqK=JE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lU6AJ-0006QY-3n
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 11:16:07 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dabf354-4efd-49a4-9bc7-e4239911a7de;
 Wed, 07 Apr 2021 11:16:05 +0000 (UTC)
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
X-Inumbo-ID: 7dabf354-4efd-49a4-9bc7-e4239911a7de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617794165;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3Feb04uJ2mT3yvkWQEWoEMDV9q3cUo0X77tX0WyXk/8=;
  b=LIxmoRu3l2tMzlCunvi7AqpAyTkZihc54iPS1tVS0rNSMO60UGAmsvRY
   0xDbHmKeBalaZpd8HmRVMQ+R6/aWIae6sG4ZcyaEpye7TT1kqWGTCrTtn
   qqbjLicr56xzqyuWAfaIoG6OZByfzarNjgF77xQwGxrHGZjs3zYQNmF0e
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: au6gzlD1/or/7Oex6GTk2CbqexviU8RooZn1LeRxp2XsIfgsjceRC1QjysE8zliHKM5EH/qjdS
 Y/KtwcXSX4K5Tk2Y5Xjwr7XSWXRaJwXzgbJnlfQ3/lHbEixbOa6sHOZLaIOERfkksJkp/e6cU8
 SpTSnLE1ObDOQD36i3XaCj5eFU2414Szm+1dZVVPhNKUt0lM1BjCICSfmRdXEKGBBBioKcqlo5
 cQSP0XMkUZXU7qnUq8Na76Ju1quBu1ry2F1YK7CPVOoOkCIf+apenxMW379Zrbz383HDW5ZymX
 7G0=
X-SBRS: 5.2
X-MesageID: 40910267
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:uLktNK6/dKziCEzZbgPXwGbXdLJzesId70hD6mlaQ3VuEvCwvc
 aogfgdyFvImC8cMUtQ++yoFaGcTRrnmKJdzpIWOd6ZMzXOmGztF4166Jun/juIIVyGysd49Y
 NNN5dzE8fxC18St7eY3CCdH8w7yNeKtICE7N21815XQQtna75t4m5CY26mO3Z7SwVcCZ0yGI
 D03LsgmxOadW0TfoCHABA+MdTrnNHXiIngJScPGh9P0mKzpAm14733GQXw5Hsjeg5IqI1CzU
 H11yHBooCZn97T8G6460bjq7lbgtnZ8f0GL9CNj8V9EESKti+YIKlsQb+6hxZwhO208l4lnO
 LBrH4bTqBO108=
X-IronPort-AV: E=Sophos;i="5.82,203,1613451600"; 
   d="scan'208";a="40910267"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeKNrlPepNDZ/MP2SYnIRNNkd8654Xf6c3GYAZDUbjMV6+5qzc9l68vn//Fk2tGwyRWhWOf0ZMAxXXx6qXXtj0GTIGNr66+83Mk1+4o4QVuJLVeB9kLIgk/JOIewcW6sOKZiGFtOkVr5Rdn5KbEFast/ksBbMxjEM2fW/WiwWlT6ET7s6z8hZSReJjWRJ6mQw5eTXKfVwRDwSbA98UOvFEjooxR0BVgCyrgfxvo18lY7iDNyWXF5r0eLxziIsYGWHMX14FdOAhzavgbyz9jRYicJc/MYnBMQyEve/CShi2wQclF/ISJ8XPDyUEjCHxmq6sTkGWEf/muxXmY9y/6RIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Feb04uJ2mT3yvkWQEWoEMDV9q3cUo0X77tX0WyXk/8=;
 b=SrMlxJkdVv1S+CHkh4pKS1N5UKzbnasvZeUjfanQdXRwoDId2aFuvhOqY2rWBFY7VIBo+UOOZBjq2F0Am0d7bycNo9pnYY984KU4rA44r9GW1rihmuw03PuB3W6kXqRdIIAiVgePTdBSyTZb2doXJNiWZoBM4rsnmp5KUgI7WNpmte8E26C2mrYo7N6Q0cRMMqV+QvqVf8hX0vywFRE47/xRsQ07eCuiZK878UZmN07GntY2cMKO5td+tspvlMPyfAVIPv1NIhfw45nRz7xmuAttUvsXn0hHShJ4Ru1rvLYGO9yq9mFcgPvLuiKQN463sVeITm4Oc4yUWU7IwKcuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Feb04uJ2mT3yvkWQEWoEMDV9q3cUo0X77tX0WyXk/8=;
 b=NX1RaljHJoHlPyB1IVnb8B6xjC+9NlbmKV6f9vaKi0CE5iff3UJFFQsYGaKpKKbTGyM78SFJuWrM+2J7g3+CmQX6vWi9Su9Yht4vZEFZ226YJJq9vwvMiyY0EFOmfL3/IneAbsJmW6taLHDrCp1jaL7Lu7/jqW4VPpIEnfAwAto=
Subject: Re: [PATCH 0/3] Use Doxygen and sphinx for html documentation
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>,
	<bertrand.marquis@arm.com>, <wei.chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <225d7e0a-c5c6-a954-9141-ba1d859f400a@citrix.com>
 <alpine.DEB.2.21.2104061418360.31460@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <51bce878-89a3-d940-f40d-bfde794a0f4f@citrix.com>
Date: Wed, 7 Apr 2021 12:15:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <alpine.DEB.2.21.2104061418360.31460@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0144.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::23) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5727a4fe-fa28-4951-c190-08d8f9b686b7
X-MS-TrafficTypeDiagnostic: BN3PR03MB2132:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB2132CB2319F7934F0253335BBA759@BN3PR03MB2132.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NkoLj3xs0OjCf4PqYz7nX8SlL03BzkuKWJ1pIJGN+1QM2I5QKdUz3k8sP1/7e0zB3zf+fbhWM1DRwrxwFQAEQyuE4X/WnPx42Fjo2SeguXN+4VRIaSrVS0+9UN2bIZaAg8fQmDKIIwhCIyQ++6n6A51asX/CJxk+VUNmzAJfh1zaq0f9Z/H8acBiDajm2LBmu2moSxRQQyD02s8849lQQ90rHK271Bl+st1+qGT5cY0lRkaXDJqAveiTV9naGr5FVqKwXkPiU/P7bDoF4ZjKd7uO6JfZto53+WhfRNjPXdsaTyF7IBJwrgU4F+iJOJQP/3akRNGEU9ua+rUp/Yow6Mar2vu3SKzWFITRraeD3RXo0O03NSc4WDZqdC2IyoXDsnc4d4+HecZMYOk2KIK8gD0KsfFUyBwKNKOkmcz4Dnruk31f4H8pirFhuqjTaaNtRWn0/BFLa4hy3D8Ye8SP9thif5j7e5X2jXTQZAa8g4Zet8SHOSJWreJQddfH4WuqcKKEyyZH4jUe7A3qxiSIa8bHkgU9f9LNo7gXPB37cS8qLdw+zGohE4+olN23PY8WgBIwMrd60aPjEW4zFrz7avNar+AmySoOloVpVkpesF3eCToBjkDvCHlde8MI6sBM9qlC6Y3iSZ/ZrJoD14rFOiXgCsbVr7mF9rRgyeW3JdIhup3Dn9mR73OQaifqbqsEMCdlY/Au2efPt9VoUti/Dl/gIs1LLmWBYGJmgXo5KNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39850400004)(956004)(478600001)(2906002)(83380400001)(5660300002)(2616005)(6486002)(53546011)(26005)(66556008)(66476007)(66946007)(16576012)(31696002)(36756003)(31686004)(4326008)(6916009)(38100700001)(8676002)(6666004)(8936002)(316002)(54906003)(16526019)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzgxTFBkSWtCdnBvOGVma0tGKzFKZkw1TVlUSmtmSjF3dFJDRGhCVEYvSTZy?=
 =?utf-8?B?WVR0LzMyY2syL0wrS25aLzZzQ2V4Yk5OWHNNTksyNHZnOFZIR0ppTG9Mc1h3?=
 =?utf-8?B?aEg4dnVXVGNORXpGSktVMkFmQXJUaVdwVnBMOWdhSUlURXh3K2dZbm1DSkNl?=
 =?utf-8?B?WFVRQjh4RkIzWFJjaEkrbDRwZHh4MlJLaVR4czlieE9IUm9Fazl2MlFndUJq?=
 =?utf-8?B?OUhRV2s5RHM5WndaVUhITmtzdzhURUYwMGtrbGYvOFFCNWVsbnB6dHl2K0pF?=
 =?utf-8?B?QWdBNXdSRFFaVzMrR1krKzV5Q3JzMmk0ZEpLZTI0Yy9BMEVhNUwvaE4wZkZN?=
 =?utf-8?B?UjNrcENHMGJReDM0ek5hQTJ2TFhKREtSUmtUQ1pGMWg2V2dJa1FoY1ZEdXgx?=
 =?utf-8?B?S0hwdTBXM2xZdWhyODV1Y3l6YjVEb0p6NGJicE1pcU1BU1NJZ04wN0FQWWVO?=
 =?utf-8?B?aEZKUm9HdkRIRHpMMnBJYXdGZDhtUzJLNk4vcEpQV2p5MUhTd1hyQlJTWGsr?=
 =?utf-8?B?cy9FZ0p4TW5ObFc4eCtiYnpLNFgwZGF3cEw5L1cwRmlZU3cvaEFTNDVyYkFs?=
 =?utf-8?B?REJ0dGxHb1gyRXhudWhGR1NON2VqN0kzQk1UYk52VzlzNXJkVzUvY2dhWnJE?=
 =?utf-8?B?b1RMcmE2SVVuZVdQUFh3dGxpVXV2VlZYSS9rRm44ZE45S3RhNlVITEZrM3hs?=
 =?utf-8?B?Q09PZDVFNW1tVjNXb252QmVSRjJramZyMjBaMjRMMm9XYlg0YzFEMlhIODJJ?=
 =?utf-8?B?bksrOU9TRUNEcTlReWdRUGFKSFN1TkVZWWJBT3BLUHlaSUhRd2hJZnBnc1hm?=
 =?utf-8?B?aXV1TTlVTmFzTUNJa1JYWkFWOXByN3dmY1FZcmUwUjZmaWRKc3NuWkJaeHZV?=
 =?utf-8?B?NDBuaElZOGJaazRKMzN1WDZxelJocTF6d3dJVUdBN2dITHI1VDhOemdGbGt6?=
 =?utf-8?B?MVdiM25tMU83MGNzOVJBRkJzWFlzVjlKdXZWMHZ5bXBSSlFSNVJBTzhGVUNS?=
 =?utf-8?B?eXBxM1dPQkdTUVBFaU1NdzJDSFl3eG1OTFMxNnJ0QkVKa2RZM0hMekd2Y3dM?=
 =?utf-8?B?eFRxQzBQRTJUMVFLeUNWVDA1TXM0VFZ3REhVSTNQSTgycFplVXl4OHFjR3gr?=
 =?utf-8?B?eFZucWVJakJKVzFZTGRHcytpRFpmQTZyU1ByVDhPWE1uUldUbVNmMkIyN1BP?=
 =?utf-8?B?Ti9hL0lEaCtWbDl4NnZLeGc1Y3dJVStWZUhiV1VFWjNKSE90T1gwaGlOTmRx?=
 =?utf-8?B?SFZsQVYxaCt3anBERzF1bFhKMDdHUzVmVmZTQ2YrSWhGUjQ1dVlYZVFVSUhS?=
 =?utf-8?B?ZlJCY3p4UzFjdWVyb2QzdnFWZkRKRVdFcjNPdUpnREZwM1dCSlVkZ1hJK1po?=
 =?utf-8?B?TiswYTl2YzdWbnBCdzJTa1oyN1VXSFNLd1diOThoWjN4UlJzVEVOQUtPdi9n?=
 =?utf-8?B?aXVVTFJNcU16Syt4MXRuN3BKMTBzV1ZIeXB0MjVFc2VaNXF2Ny9FMnp1c1dx?=
 =?utf-8?B?RW5EeVJXV2JvWDAyTXd1dEN6WUdxdi9ubyt6cjQzRUcvU0I3YjJwZUZHZ1pO?=
 =?utf-8?B?aUZieTFDK0RzVDh6Z014eTl1a3phUWVIOVNhYmZERUFjcXdiR1I0VFlSd3pE?=
 =?utf-8?B?VFVpeC9yRUhIdnRSUy9MRCtrNlh1RUowODlsRVVoUzVmQlZ1TjhxSEpaOTJX?=
 =?utf-8?B?bDRaZmJqb2h1ZHZLYWNYQWxrTXBmRUF3aUtocEx0cFBSOGU2L0cydDg5L1pB?=
 =?utf-8?Q?PvSEnZJ2iT+6OOXA3MUIw+V08+/FSZGgnK9fpnR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5727a4fe-fa28-4951-c190-08d8f9b686b7
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 11:16:01.5896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtulnwS2xg0GjhjHD1N9tbCNZMviPiRGJbQs52jdppZ12cIjR5IvD+tTHdhGh2nHgkOm5mZQBWalqmQJyrmiuSK69TnDQlV+KqKQEYhj6G0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2132
X-OriginatorOrg: citrix.com

On 06/04/2021 22:24, Stefano Stabellini wrote:
> On Tue, 6 Apr 2021, Andrew Cooper wrote:
>> On 06/04/2021 11:36, Luca Fancellu wrote:
>>> This serie introduce doxygen in the sphinx html docs generation.
>>> One benefit is to keep most of the documentation in the source
>>> files of xen so that it's more maintainable, on the other hand
>>> there are some limitation of doxygen that must be addressed
>>> modifying the current codebase (for example doxygen can't parse
>>> anonymous structure/union).
>>>
>>> To reproduce the documentation xen must be compiled because
>>> most of the headers are generated on compilation time from
>>> the makefiles.
>>>
>>> Here follows the steps to generate the sphinx html docs, some
>>> package may be required on your machine, everything is suggested
>>> by the autoconf script.
>>> Here I'm building the arm64 docs (the only introduced for now by
>>> this serie):
>>>
>>> ./configure
>>> make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-" menuconfig
>>> make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-"
>>> make -C docs XEN_TARGET_ARCH="arm64" sphinx-html
>>>
>>> now in docs/sphinx/html/ we have the generated docs starting
>>> from the index.html page.
>> Do you have a sample rendered output?
>>
>> The plan was to try and use Linux's kernel-doc plugin for Sphinx, which
>> is very doxygen-like.  Did you experiment with this option?
> As you probably know the end goal for Luca (and the Xen FuSa SIG as a
> whole) is to generate all FuSa documents, including requirements docs,
> interface docs, etc.
>
> FuSa requires us to follow the famous V model, where the high level
> requirements are linked to the lower level requirements, which are
> linked to the interface docs, which are linked all the way down to the
> code.
>
> Maintaining the linking is difficult and typically done with expensive
> proprietary FuSa tools.
>
> Fortunately, an engineer working with the Zephyr project developed a set
> of scripts for Doxygen that are able to generate the required FuSa docs
> and also links from in-code comments and markdown/rst docs in the tree.
>
> This is great work, and in the FuSa SIG we thought it would be best to
> align ourselves with Zephyr to be able to pull our efforts together on
> the tooling side instead of doing the same thing again on our own.
>
> This is the reason why we ended up with Doxygen.

So are we're saying that Doxygen is a hard dependency because there is
an extension for Doxygen to generate other safety docs?

~Andrew

