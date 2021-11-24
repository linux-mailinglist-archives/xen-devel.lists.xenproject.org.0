Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BD545B83D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 11:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230276.398094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mppMi-0004hM-18; Wed, 24 Nov 2021 10:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230276.398094; Wed, 24 Nov 2021 10:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mppMh-0004eU-UO; Wed, 24 Nov 2021 10:18:59 +0000
Received: by outflank-mailman (input) for mailman id 230276;
 Wed, 24 Nov 2021 10:18:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mppMg-0004eG-B9
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 10:18:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef0c8d6a-4d0f-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 11:18:57 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-u3o9kYVEO1Gya8ID9y5Rvw-1; Wed, 24 Nov 2021 11:18:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Wed, 24 Nov
 2021 10:18:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 10:18:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0366.eurprd06.prod.outlook.com (2603:10a6:20b:460::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.19 via Frontend Transport; Wed, 24 Nov 2021 10:18:54 +0000
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
X-Inumbo-ID: ef0c8d6a-4d0f-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637749137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkI99FCwyYlJwOriIFzuI0qwan0cZn1jP7t4c49CV54=;
	b=CvgHP/OYCY9+zGnGfI28VIm0Gh+ADiOWDD6f3qvOw/xIV0uGj4oLwJ430/z6MwCWhzQM53
	TeyTrXnTQx7LWv2d7/ebc99s/ipzcXDc3vc6ikHKAQ+1IlhSn51vhu9RVf1DOM/1Fn7zUO
	ecBzibPbyrlVedE+tl2ewDJmRTb9Qdw=
X-MC-Unique: u3o9kYVEO1Gya8ID9y5Rvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cjtv4AoR6rxl0UrNwMv8w7HWTMKdrOPyKg2HIAkVdYs6rA0Wbkr28T4tNq6lh4RC2PEfr/+uQoMs6VpCRiY+JOnoApSd9irYpGY6o7pxub+vUij8L/cDRCqeUsaVu841DwtSqBH/rjYqeR3T4ZSe0gu9bI97zTTJrsh4SgsYQf6nj7ryaAydPFsfU905W1oWxtbGX4oFHWPuMG+akuQ2deI7MpJg4szYKbaedbxfQ+KF0et9wF2WiQug+to+QXeq1K0cA0t9hlPDkok95vqCFd+VUs59LnA0kR4o+RkDC393HBj6clfLpcxWeTfmwPgrJRAnfMhvOVMt7WNkT84Vag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkI99FCwyYlJwOriIFzuI0qwan0cZn1jP7t4c49CV54=;
 b=QwCClcboVC9nHO8oOxzE2xHB8dm4IIE26SdfULMsYuQEAFz9ibApBfmcQ7nLRI6TuBKJCqZE267wwjih7xOpn0Bslk1ruytHoxXXq5EIjQWEPykyGQvK16B7DdICDckq3Zn+dNMSAsxhPM68v+CrZ0hKjuHgKTAHUWnrBPfBs+u55k/fh9akfW1BI5ZBRq/eBfIqgYCcI4tmEcFRZn5PW4TgcgbCar9gv1858C0Ju6YhjnDVjwBUat7CkR5efG5F4fNWWP5UhsvrZ8JTOMC+nLEOTXFUekmZ9O50ofR+MGJToiN/OAVVyBIfSr6RJD82KEhwAuLfx12iSZQE1d113A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f27b185a-e952-88bb-21fd-f1e0d27e13af@suse.com>
Date: Wed, 24 Nov 2021 11:18:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16] MAINTAINERS: declare REMUS support orphaned
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20211117122647.17872-1-roger.pau@citrix.com>
 <24980.62958.680856.115625@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24980.62958.680856.115625@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0366.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 298d9449-9c4e-40b8-8b56-08d9af33d1b4
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244742579E5093430DBA83E1B3619@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FwwIAruMRU8y7XYcNFZuhldftgVH3GGE4HELqHcdBJy5Ubgghj03P+LQY7E3ZNvK+ez9iZDQ/BZOAUXSz22Y4AVjjphI9Y0l4qVc/Rjtc33Z/U9PF0pteiD+VnMCL/Y4Rz0uCwh+dyRhg3/TvyrZu6LI4tVjyxrFBBM4a9WCOOIRxKLV9RDM/1A634DyJH194Ikb4+npmyEUsSfbsr7A0zdRs6MNWZAgF/EoXkFNS/UmM3OIKAD/a4FgaSR2DrEZdEM4lhjeOHBfj2BE1qVZdEMxJDlWwL2vAzrvP6zPpVhqPcN/wK3+0L3aG/JYip+NJUyMcYAsh2aUo1VSp4FKjiURROWI98d8/f7ae2DzWTYmiy58D35YnaWOXNGizdluAyN1/c6bHS3kywt5zcYRrkI4pLq8yS3IlHSHcw18ygDSc4SRJ8467pluNVQ89t5JaMcz4cGoqq67ThfSujlo016XgAP0fNKcbWGIY7OpOAYxTLYv4t8S5aJbOJ842Iaa6cy8PydBdgvMultW27GzmqFoLJNKsE8e/AO7GkkYFgU1py+5tzeufE/63xwhd3yhKPhAIE83gl3VVbL27zfSdyWNILGDpxP7TPyvoLghdHfgEo62uR1OoO917hMAxZMkSbzBz7HUajq/s7B2PNEP4pknIVoOLhcKwLP86LcaPxkfx6YZb2/0y7v7kx2XaqCm2sPixwf3bHE5//jBynIUFV5kK4HUHCq1ODAov3ZUURQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(110136005)(66556008)(16576012)(66476007)(316002)(31696002)(508600001)(8936002)(2906002)(31686004)(66946007)(186003)(5660300002)(38100700002)(6486002)(4326008)(8676002)(36756003)(956004)(4744005)(2616005)(86362001)(26005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW9BYXVrWHhadGxjakNMeVZadTN2R2E2MzBLNDV1dnVWSEZyR3h6M0ZrcWJL?=
 =?utf-8?B?TExOeS9sMU9SajFwelhNNTFpbEtuZ1VJQy9uTEhXYk1wbU1TU2lrY29mVFZQ?=
 =?utf-8?B?SHB5N3dkSHByMVF2ZDVkbThUbGNHNlcvdmVDdXZ2WkNnb0FmaE10b1VWdzBx?=
 =?utf-8?B?VG5QWWRZeGRGdGxlTkYwSXkwSS8wTmxMS2Z4S3FDdjIzWkNaNTU0cXRUcmJX?=
 =?utf-8?B?WkltbEd3VktWY09Sdk01RktzRXVNUDNNUHhJcWpQRUFlVFpqdVRtOCtiZ1dh?=
 =?utf-8?B?S2tFMzd1cWVxdWV2VVVwL2ZBakZXbFZTRkZab0h3YUg5NzJNbnNDK200K2wx?=
 =?utf-8?B?N3BZTWdJZnRDOC9BT2ppb2tmK2RNenZrRUlhQVdaS1lRN2FzVys2M0h5QTg5?=
 =?utf-8?B?K0sxaVVJMll0bkJnQVBrSXVqL1JkQXkyNjdyL1hmR2xUck4xUVRMckVJYUlO?=
 =?utf-8?B?Nkk2T0hOTXBvL0dYN2Z4Rk9tdlh3QkdrbnkvRzVqNVBxaWM4N0pkWWd6OERE?=
 =?utf-8?B?dkc3STh6d2RvOEtaRVZaNkhZRHZHQzQzZWNmVnJjS3FYMEs4UnhLNGNhdGdn?=
 =?utf-8?B?dHp0ZGYyY3pYd2xiSHgvRm5vV0czY2MxQnBTS1EvS04xaHFDSDR1NU5sNXdJ?=
 =?utf-8?B?N2UwQzYwQnQvb1ZaaTdlakUySk4veUh3RFZUSU00ZUIvY1dFdHFRTnR4TVpt?=
 =?utf-8?B?ZkgzWWdmdnFsN0lTQkNsMUUwQ2p6dUYwa3BUR1ZMVWN2TW1veDdzMUFCSmJS?=
 =?utf-8?B?UTFEZnkvVnlLSFBCM1lIVW9nbENOdlF6L1VPZ3lNWGE3REU2MlA5V01kOTkx?=
 =?utf-8?B?b3ZmY2hIRWhKWStGKzZjTzZrS1pBT1YwclFFVFF4RFFQRVVkM0ZVWFNnb3N3?=
 =?utf-8?B?Q2Z6Q3NNYzNuTEFsM09SMjhjeHJBY0JmVjUxL1VCVGJqRzNKQnJRWDVpS0NR?=
 =?utf-8?B?VVZSSTB3SUZNMnpnOXVlSjhLNWJ5c0g0M0JGb3l4eWUwS0hheGM3MzcrQjdU?=
 =?utf-8?B?Q05xSFlZWTBIejRXWnJVd092Q3lZUFdZc3d1d3U5eHZ0bFp3b3FvT2ZHSXc3?=
 =?utf-8?B?V3VQODk0OG5yUEV5Uy9MUFZyS3JkSmdOUFJZaVJmejlXTFl2cS95b09ZS3Fk?=
 =?utf-8?B?NDB1U0ZkalRVMldmdzBXYW5UU2NIbk5RVUJYODdhS0NiV3B6RXpORkM5YnZa?=
 =?utf-8?B?Q2VRcGF1WC9XSGhpZGxkNjZ5Zkp5ZStCdFlnWVo0VFQ5WlF2MHdmSGU0dllJ?=
 =?utf-8?B?dkdxZ0VYRDJSVmI4Z2d0TWJBSFE1MW5EQlB5Y0xsTEsxSEZoa1NTK2J3aVNx?=
 =?utf-8?B?YWRnS2UydlNvVmpHb0ttU0hVYzk2dnVLSitwdzJRSnl2aUlCSUZSenN5Y0tN?=
 =?utf-8?B?SHhUcFl4TitycXB0R1BHeDZpSlVtaWYrM1A0bFNaUURiYnBkcTkzczAwdXB1?=
 =?utf-8?B?MzRjQ3MvSk15bUhpNmFrSkk0MWRhQUN5cFNka0xxTFY3d0ltMXVlek1WNDFY?=
 =?utf-8?B?dTVWYTdVN1cyYzZ3c3pGWnNLRVhML1FmSUp0ZWU0L3ZlSEdOTERCMTNKbWNw?=
 =?utf-8?B?eW9QMHVDOVpGaitJTTRjQWFmMHprU0N6amM1K1JReFN6Sjd1cVR1QWxuSHBh?=
 =?utf-8?B?cE45cytKYmpRdzRxdkpqaTlvUUszMEdleTkxdHl5V1Q4VElQbUF3Q2I4UjJP?=
 =?utf-8?B?ZUZTcXlBTjVMaVdlRXVSNDdxZHNNSy8zcjVhbUNlTmZJMnQ0akFKMzRiUlZk?=
 =?utf-8?B?NGl1N3dsQ04wdmQ4UHFvWlpqWGc0NEl3L0tmMk5GV1VXdHM3SHpqbzRNOFRH?=
 =?utf-8?B?cTdVZXBzSG92d0ZMNmxnMmRTd3pveHhrdSszOEJEak1GOXY1ZjdrQVVrdjNi?=
 =?utf-8?B?TTRxRUY2Wk9QV0hORUpnT2Uvam5pWlNQU3BPNUttelIza01JQ2ExbGQvY081?=
 =?utf-8?B?dWlXQXhOemNad2wyS2pBQ0dFUlZzbEtqOWZRNkJjYUtnNWRhQUcrQ0tmWjhF?=
 =?utf-8?B?eDk5Q1ZFemZpekdITHVzT3lOMzJ2SVFNUXVDbGRUek5zcGRwQWNhSGxrbSt0?=
 =?utf-8?B?eVM5NWZuYXNMeUZYVkdTSjBrdjVnMElIRU4zUy9YK3VCQnFva3NNVHlZOVgz?=
 =?utf-8?B?MTdscWc4RDMxUjhnL3p6NXVIYXJ4cHhXdDcrSGR2TGVjMk5mNnptaEx0cmY0?=
 =?utf-8?Q?U4IyAa7FMBz6H2p8qr8tSTs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298d9449-9c4e-40b8-8b56-08d9af33d1b4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 10:18:54.8557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X44MYu4zRkl2J/l1MIvnpgvR2q7QLNAvB6aV/ghEzX6jJValnuZM52xt83pgceVyech3I6GKMbVqs++bA6ePxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 17.11.2021 13:30, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH for-4.16] MAINTAINERS: declare REMUS support orphaned"):
>> The designated maintainer email address for the remus entry is
>> bouncing, so remove it and declare the entry as orphaned as there's no
>> other maintainer.
> 
> Hrm, :-(.
> 
> Acked-by: Ian Jackson <iwj@xenproject.org>

I've committed this to staging; I wasn't convinced this is strictly needed
on any stable branch (i.e. including 4.16).

Jan


