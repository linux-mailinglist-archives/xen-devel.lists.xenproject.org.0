Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D834B8E6B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 17:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274329.469768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKNRF-0000rK-5a; Wed, 16 Feb 2022 16:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274329.469768; Wed, 16 Feb 2022 16:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKNRF-0000oK-2O; Wed, 16 Feb 2022 16:45:57 +0000
Received: by outflank-mailman (input) for mailman id 274329;
 Wed, 16 Feb 2022 16:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbM1=S7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nKNRD-0000oE-CZ
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 16:45:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6e8444c-8f47-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 17:45:53 +0100 (CET)
Received: from AS8P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::31)
 by AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Wed, 16 Feb
 2022 16:45:34 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::eb) by AS8P189CA0023.outlook.office365.com
 (2603:10a6:20b:31f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 16:45:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 16:45:32 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Wed, 16 Feb 2022 16:45:32 +0000
Received: from 3561a2de1864.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA7FD459-1079-4EB8-AF8C-43BD02F526EB.1; 
 Wed, 16 Feb 2022 16:45:22 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3561a2de1864.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 16:45:22 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by VI1PR08MB3373.eurprd08.prod.outlook.com
 (2603:10a6:803:7b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 16:45:19 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 16:45:19 +0000
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
X-Inumbo-ID: e6e8444c-8f47-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SDQQpjilmnDI3MclnSGYcerVK7NcRvz1xk60aNxIMY=;
 b=sruA3KvipqqAzVSbrSOF6XcLFQ0QkRPooKP2+OdrWlgeDF8Cw59rVJzlGQdpXvFJ9YuP1VdcRFMrjsgrHssM8jmhPVhCYK2fytQZbojDHkqhIF3JVNdm18VP03C0aRF0Uv11cdhLT+zatZDKteUUNobOAW7V0G9DyhNm5QzIdC8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2595de55582fcc7d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqLGfNg6d9rMdjF5yR/0+i4DfieAEslF9tFtt/L9Wepc5yWga7WhGpTa92r3LNN+ODq8E/QaJ4imQNleqLokbLZ1uvrYTA7EDCfkN7VK0IHOuG8e2ZY+3NgwsRiVpoiYOOd48OPshwUPHl915UGnQxWLv0kQ2a5PX8Dg9Mp/+/zUHdtic76OtVGMxE7JEW0BWx35baIQRXNk0y5OyxnsoNsfT5W93OE02jZt8MJmbxenxAj3v6lZeOqq2KWLUpmK6Sjyb5q1R9Lgfzc38lZG6sEPieadpAi+pB+xTjk5x5R/wsd2vGB+WwkPLFRF9R8Mw1ak1kHDppANhGUGXMzKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SDQQpjilmnDI3MclnSGYcerVK7NcRvz1xk60aNxIMY=;
 b=FjX1mItQZv4b7YB9DB/+0CbzjddTG4c5pbmLJWwCFaHHdx7s7rEIw9oZP9uq3Xq67Pc9csDTxTtKUzPOxtdnN7n9fOp9ZPEcuPK/nD2G18NorwFWZqUsZneKg97DlULKMti6CNGlKhdM2+frV0cp1G5oW/L509OUOTX7PCqTF12ZsUMql+uGaBlxNdfkalI3xnSTrT/6r6rwBzma+xQypzkCi7jX0Fg0v4617IBZ9WvwKXDz4MLpD3vraDLiZcfV99U6qoXR2HsAJnEMwEgBz/w8b6SVXi8Hvk8BZznaOQfPDjtz73DMxmt6Oofe+zZ9HpYcvs9KXbRZy/9uECu+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SDQQpjilmnDI3MclnSGYcerVK7NcRvz1xk60aNxIMY=;
 b=sruA3KvipqqAzVSbrSOF6XcLFQ0QkRPooKP2+OdrWlgeDF8Cw59rVJzlGQdpXvFJ9YuP1VdcRFMrjsgrHssM8jmhPVhCYK2fytQZbojDHkqhIF3JVNdm18VP03C0aRF0Uv11cdhLT+zatZDKteUUNobOAW7V0G9DyhNm5QzIdC8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <7b30027945ef9c545fa607f957d8f4cbbe871a52.camel@suse.com>
Date: Wed, 16 Feb 2022 16:45:16 +0000
Cc: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Chen <wei.chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: 7bit
Message-Id: <304383E7-FE8D-4B60-BC7C-5E7A1739471A@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <d6f36774-ecb5-15f4-b0c0-6114724060e6@suse.com>
 <AC1B6659-FDCF-49A0-AB6E-EF2196C46D8C@arm.com>
 <779968b4-5985-06bc-be35-ce5b0b719930@suse.com>
 <E99BEEA5-863A-4780-95D0-C22A12263737@arm.com>
 <7b30027945ef9c545fa607f957d8f4cbbe871a52.camel@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO2P265CA0183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::27) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: b8edbc96-c1d7-4ae7-6f36-08d9f16bbfba
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3373:EE_|AM5EUR03FT064:EE_|AM0PR08MB3409:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3409B5A1C9972FD10AA18A03E4359@AM0PR08MB3409.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 35K4n0xzI4CgbhqDd2T5UFf2ksvod5fbdZyVbhu0SwPZgmkOVXi/JdSZicPdI6gTZAk81cvXJ3ugeBBBSv6KAO4nmcRItD9CLnAec/Fsc794qwLPS0ZykZnFZbpRFu/UT1nQ3d57luYA+ebjRFjn2IAMeI99VwrqvLBiwod/Z/ou63a5bt7SesZHJW3Zq66okZQtmZ/J4k42aDKy4uqATPupbwl0ufik611aL+5h+dgjaIyZacR4Bug3FsI6KWaSbGUzbnB02WsJJS2esH2CN4BpATCoVs5hgBhhCVF9otxX+IfM0n7762NfswuUF7rW8xsF1txAp3bLY0VC31MMvuPOumA/2gOLpMOJaC/o4PIXgcBiXipwe2m3x6fO32M8yfx/FA+uXz58uRdX1jjPIvMW9n6PyxW8i49ifkPBvvGNtInCmtrKL5gKdnQ5iGLmwXappeAiGHQA3suXIoSflObGhd88cuZzSK1A24DcYmnMo/5ORxsHyzzAA4/JfQZdF1UnV6bf1rzMeLUeVQ8jao3M10XdxLYZp0XGQzOBNnl9aLKP6DcV0B3k6sfFbGb5IDOm8dgyqb0IQnrua7ftwQxLUeJnl7BqOVEaHfFCmV+UH3sz72s0IyVb/RC0FZ14yKw/C47OxQqOdTlOC82zYn0TLQYi4xNcrpjWUt4ALTyhSznsslHzV62SOvWQQXDZdE/3kyH28UAAR4wWY4Kww1J3jcmdZcSNtyPRP/fDmBVJEXnW5FSEvXmKC4JIFA6/y21+P4RrYlKLKTNfQaOw6sM5MVQhlnDJ6RpTld1k7AZ4kY5M4IfAWvNYKmlt1nBr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(316002)(86362001)(508600001)(6916009)(4326008)(54906003)(53546011)(6486002)(6666004)(6512007)(6506007)(966005)(66946007)(66556008)(66476007)(33656002)(52116002)(5660300002)(8936002)(44832011)(7416002)(36756003)(2616005)(26005)(38350700002)(2906002)(38100700002)(186003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3373
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce8dd249-a656-4487-24b0-08d9f16bb75b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gyjUEho5JHV1WCS3bJgbLXPQk+RfgxeKTUKo3TxDFSPIS33PUUgn3bmaWxw5+ZEPQopMpr4ffXhwtGalMju0oMZxy8uFr0CyUKw+XooVB7IecDusbseSJNPaj9QbYvR0MFSu2kEChhuSGFHFMrLE9aGLc0S2QYKPkcfwQz4nb9QQfAG3tKo9LfxAtAUBLggW7vlCFI6BpWZvDt+0ZE47/TWOJb0zsV+rjqu2Kwq8/oy5GssLKRDqn3smjymmeKQCGGDTqk9K2cQVPSwOl2Gpzr4PCC9P+fX7efpXq8/CPM6awVodoCdrUz+SqNvRtI9WuX+SP0wdqpkDtpuQf97LFoc2bSZAVTX5Umy1kYsUAjc4MiSTBQnSPJb24/veaZtsxnsIK3RQW3TGltMU+jnpttg3IY9J1ToGd12cSJB5y9mhCGk4RneWlV3hwWqjMxdDqONkGk5mBvjbzIf97U/ZBrGC5BYxbKFf2PyhToPRK3NtFfTN6uPkumwSZWx8Gzy7IShkQLGNC4aNFzcbychuFCvdVcQycqeDhVsISK99C3HJi62DMBOeBqz7GXyjlISn01O+nfQLBx045+m6L1/vjPXL/9HrlLXlEXjX+rYAiLhdSFixCkeNi+W1is+SJeWZ+EMYdbjlOaW+GHva3dDSp5KcnjNZ6j3lcRLYQiUAq+C9nIfjo4HsFEFSie2RjfE/HPR8lc/rvWmoCATZNTzc2gh3nxoMrZsXGMeiEAJCRSBxwu8H6hx3XXP37poFevvV3/NinrAM/MwMCCaYTluOuwBQkRS7g0N7547PAnBIKDU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(5660300002)(8676002)(6666004)(70206006)(336012)(33656002)(186003)(316002)(4326008)(2906002)(70586007)(26005)(8936002)(86362001)(36756003)(44832011)(6862004)(82310400004)(36860700001)(6512007)(53546011)(40460700003)(966005)(6486002)(356005)(2616005)(54906003)(6506007)(47076005)(508600001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 16:45:32.9522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8edbc96-c1d7-4ae7-6f36-08d9f16bbfba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3409



> On 16 Feb 2022, at 16:32, Dario Faggioli <dfaggioli@suse.com> wrote:
> 
> On Wed, 2022-02-16 at 12:37 +0000, Luca Fancellu wrote:
>>> On 16 Feb 2022, at 06:18, Juergen Gross <jgross@suse.com> wrote:
>>> On 15.02.22 18:56, Luca Fancellu wrote:
>>>>> 
>>>> Yes, however I think the parser to handle everything by command
>>>> line would
>>>> be huge due to input sanitisation and not easy enough as the DT,
>>>> however
>>>> I see Hyperlaunch has plans to use DT on x86 so I guess it would
>>>> be ok to make
>>>> this feature common once the DT is available also on x86.
>>> 
>>> Everything not being explicitly specific to Arm should be in common
>>> code. Think of the work in progress for Risc-V.
>> 
>> Ok I will put it in common and I will make the feature depend on
>> HAS_DEVICE_TREE.
>> 
> Can't we split the DT parsing logic & code, which is fine to be either
> ARM or HAS_DEVICE_TREE specific, and the actual core logic, which can
> be common and not gated by any particular condition?
> 
> This way, if one wants to add boot-time cpupool to x86 via command
> line, he/she would have to implement "only" the command line parsing.
> 
> I've looked at the code, and I appreciate that it's not trivial and
> that it's probably impossible to achieve 100% decoupling (at least not
> without adding a lot more complexity)... But any step we can make in
> that direction would be, IMO, a good investment.
> 

Hi Dario,

Sure I will try to do my best to point in that direction.

Cheers,
Luca

> Regards
> -- 
> Dario Faggioli, Ph.D
> http://about.me/dario.faggioli
> Virtualization Software Engineer
> SUSE Labs, SUSE https://www.suse.com/
> -------------------------------------------------------------------
> <<This happens because _I_ choose it to happen!>> (Raistlin Majere)


