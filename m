Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164F6467629
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237387.411730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6dg-0006rZ-ME; Fri, 03 Dec 2021 11:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237387.411730; Fri, 03 Dec 2021 11:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6dg-0006oV-IM; Fri, 03 Dec 2021 11:22:04 +0000
Received: by outflank-mailman (input) for mailman id 237387;
 Fri, 03 Dec 2021 11:22:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt6de-0004uM-Rb
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:22:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cb877d8-542b-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 12:22:02 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-HKHCOk5sOmiL2Ao6kdds0w-1; Fri, 03 Dec 2021 12:22:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.28; Fri, 3 Dec
 2021 11:21:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 11:21:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0036.eurprd06.prod.outlook.com (2603:10a6:203:68::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Fri, 3 Dec 2021 11:21:58 +0000
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
X-Inumbo-ID: 3cb877d8-542b-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638530522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=arRBtooexp9YOjjgqZoKeIru/O8fhzNxUbCM5wJ1rzw=;
	b=N7x5oDJr0BbTq2qmFjOT9adogWbl480WUsVcIDNS32aT1KkuTghMeY/WuFYTdqSpDvddNy
	+PlJCMwE7qYPAyNCDYo0AGkT31Y6ghrioe7uqpV2JNlCdhUyaM7cpCmNch+d/3XUt4Glwa
	JSq7xdTwnNg9lNvoc+t7+MvFeqJ5lvQ=
X-MC-Unique: HKHCOk5sOmiL2Ao6kdds0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3u9qxZX1/15FAaZnOpL6ftR3cjZr4impl4oZp0v1Shh6zLhJ0nusdRwWNv8y//7UAluG6IO1PLJAFJG+ZHTsAHDKneyOU0NmAeJO6dgh84M39yBNccMBb8gTxjwXb4N/TfE8+5vYB1I+wUg2zj3vitScKmDFr37wwqIhtCisjKPu6u19m1Vf1NO1TF7Iu3Q6m9RrrCqYwLendwTkAXWq2SfmyAAooP+kip78+VaAhrONlUlpbxxJfBScnC1VZBXoI8HMNhZPaHUAxrs+0mXIVHS6cYJcfJCGWezgc5onGByiiyzcIrGsuj26zsmkw//TB9DdO51GWyOjxF8MyrM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arRBtooexp9YOjjgqZoKeIru/O8fhzNxUbCM5wJ1rzw=;
 b=PJpRwChpTLtbaGVRVhxiOkVfMMYAiPG/xwWEODn5RtHzyltTLgilDUwz/3cKceFT7bkU9Er5B4kXfzM3cSKpo7ziiHfkLDPTp8LIBCMip1jXepKVboAILkJqLCFEwR/lKUraX6x9hi91wgj8fiMgxT7HssNAGl+mu7uN6/tkpRAnfxbIePhi/Gmw79aEZy7iJ07D7a6w2NlOblBvnS24b7wEd4CM3VnskY0Zi3OUu5oEc3QnXU75i7cYaJ+n0Gcezq9NSGc1Zm4pkR/NDOdd0c28Qi1dz+/Is9f2f4Oedh+QscWZoofHtLOjx9BM4Q9EpeB74jhe95zA1Wili/uYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53d783d7-aa53-f2de-6aa3-bd266f176dfb@suse.com>
Date: Fri, 3 Dec 2021 12:21:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 1/3] x86/HVM: permit CLFLUSH{,OPT} on execute-only code
 segments
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
In-Reply-To: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0036.eurprd06.prod.outlook.com
 (2603:10a6:203:68::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eaf728d-1c75-42ac-e841-08d9b64f1edd
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB44458CD6FB9532383F848EEEB36A9@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vOEJQI8gX8RyoTV+1b1tZto/ooLZGlVBaYkpzZOb+HWwX6DqOzDXuC+Mqaoij6K3PP1Dx+P09i/R2tOiLTnT47xpHnwCX6We7kwbQ1hjZV/3Dh504GJC+oZV/OZAmmyvyfklpZUu4aY7XQolpZt5k5zOd1Yych38dAZQ/+hz1GC8R76n0N57hzoVAsHSPaoUKk0i1nw3Q4dz/j0zLkxjx0Eo2hqTRpw/l3Vn7FHv/S0lZMHzJLKjbSAKtOQWwM2VQkIi1PWEsaH1RZ9KIM5hfnsyFveztIbCsbS/czBwNn1nqMNg1ou49RMXAn0VayYIfDjmb5D0xxMiPlVGmPgwW1ZVQYlVsqkjmjaTD25bOrXZAl4PzyyVIKQQaXYw97XZFcf7mGLfXn0I9if+8VsgScGo1Il3UpS2ijdKwYuCr92Ne6uD/+iyPGnRTvPnOM2ta34Sl7cRVW0XywvnScZ85j1VDIUe2crpTlbguAXZaiQzuRfvB1u1PGk4KmDToYQ/mjrMlZQIXgVzJBN+7xEKhOTZI4Pucjqmwt018um6F9o8UQVEzfRcnit64KjMMrAbwGuMviA3HDVlXmyE2CC47EzGoxTJ4NHlr557Yizciykci2ChYw/Ok42CO3GZXFUmOA5unQTjJ5O4KZNVbuYCS1n0TRK6e+hKV9zFEtxdGYFBX/afoBjoyGs+TABt9cJIt5MLzuMFsDM0tBu6TxuHUAgxYEoTt/8wEHYs/pU597o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(36756003)(2616005)(31696002)(31686004)(86362001)(316002)(2906002)(66946007)(26005)(8676002)(6916009)(66476007)(66556008)(83380400001)(956004)(5660300002)(6486002)(16576012)(186003)(8936002)(54906003)(4744005)(4326008)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1R6REVObUVwbUw0RGlKSHVONmE3dWpCbUJaMC8yRk82WllMdFZhbm9OSEQw?=
 =?utf-8?B?SUFJZGRScVRiTlVQdFo3Sk1QUFBBeFFNOGh2dFlpWW8weU5wQVNxTEgvenRs?=
 =?utf-8?B?V1YyNVIyY3Bhc2lvSVQ1UEZIRVZOcnBlTlVFbFBweG5iTldGeHJWc1VGYi85?=
 =?utf-8?B?bXZPaW9qdWlMVXRnOE93Qk9Da3pZL1d0ZDFyTVlkZ25sVVE1NHlUVys5UExs?=
 =?utf-8?B?S0QyRkpqL0pKeXhmajNDL21iaEtTTU1UcXZyUVUvNktaY2ZTU1ZBVndwRm5U?=
 =?utf-8?B?WVlXeXNzVHZsUEt5Wm9NN05DYTR2djl1ZjdSL1FXVUcxcTlIMkJOdjFvL1pl?=
 =?utf-8?B?Q0ZGWXBVaFFwU3NJOGxtdmJKQmJTNmQxeHRGcHZnaUpPL1BoUzRWNEo0THN1?=
 =?utf-8?B?ei9pMjFuNUdJZXJUemhxVWRGdjREdktPYjlhWjFQRCtuMDcvcHBqanN2dEV5?=
 =?utf-8?B?cnZaSEJQOHNVUTdmWlRpOFB5Q21HdTZpYzVqajlMdEtlRDFLdFgycE5oTnAv?=
 =?utf-8?B?UTNsMnQ2cGoxMmhnMlZ0VjFlczZsNjh4aXE4S2VaOE9ubHRnc1RreTlsWkky?=
 =?utf-8?B?Rld5WnZQdTY4S2ZYZFZJVVQ5TmxpSDNTc3NLVGdaa1FXdnNlYnE3clljeG9W?=
 =?utf-8?B?RnJuUGZxbjdFZDVrOUMwa05UZnI0WEJPR0FtSkpnclZ4bGVtT3A2RGtuUjgr?=
 =?utf-8?B?YU92Q2p1WGRvcGI2UDFrd1d1dGJiVzV5UWROUnZrQUpGU1VlbTNaemxuL2lB?=
 =?utf-8?B?QWIwazZFUnJiOEFXLzdacEpQNUFubUhkRmV1OUNqUGFEVmJ1a3ZDcU94WmRT?=
 =?utf-8?B?SllYR0Z4bWhHcVdDUm9hRzEwZXNveFV6NkMxS0d1NEhxRjI1dXczeU1DZGpM?=
 =?utf-8?B?UnVLSndkUXU4OGdoeW11WGJidlIvQVBqbkorRmhudXgvT0dBS245b3J0TmdJ?=
 =?utf-8?B?S1BQN3B4c1pVV3lWcXFYTXNnQjBNOFMrbU04UzArR21MWFVrT3I0L0xIRWVG?=
 =?utf-8?B?K2FEU1RzMUpqTGVvM3pCSmhwU1BSTVRrSC95NmZwQWR1ZXlXU3BWdU1VbXdL?=
 =?utf-8?B?UGlGaDZrS3hPV1p2dThDclcxYUFYN3R3dGFWTFloemxpRHUreFJ0d1JyUU1t?=
 =?utf-8?B?R0lIeXE4T244K0phT25QdHpoNGM2bHVOOVNmaGQ3bFQ5K21ndEphMkF1TFg2?=
 =?utf-8?B?bmE0MTFZU0Nud3pmZjhMVlVlOWhEWm5LdkM5d1Y5c3RicHBPNHpyRzlHa29O?=
 =?utf-8?B?RFlmb0VUcXgyWklVN2ZQYXo3NjdhNVpYNHpEU1NIUllhVDRtWnpnNlUySTZx?=
 =?utf-8?B?emtQN05mLy9YZUwvNEtpNk4yVWtjK2Q3UzhvRGg0cW5Bc2JmS3hwZW11b0hH?=
 =?utf-8?B?cnFVVU9BOExJSVRkSEI5bjF1b3FTei9qcUpEVTF5eGc0eDVUd3ZCaWFJNk5l?=
 =?utf-8?B?Nk82Z0VpWFBjNUgxdmJoMVRucWdHMEZBTVFKMExoT3lRSXJvdEpqc3AyaTd6?=
 =?utf-8?B?T3NUN3gwM0JZRkh5dFJpamhvcFovaFBYNWIybFR0MmpwOC9kVitsdVJrRnFS?=
 =?utf-8?B?QkIzS2JCK0oxb1dSN1NHRytoRVVibmJqbXZyVXhlT08yaXRxVkI4dnovZzY5?=
 =?utf-8?B?UXFPcy9KcW9qUG5neFVJd1poSDNHWDNySUhYRzAxRno1dExPNjN3WlIvMSs3?=
 =?utf-8?B?cExGMGIrb3hkYTMvVU9wWDhBRGpmb2F2Nmh4dUhMUEdIT1krWlZPQ1lSV3pi?=
 =?utf-8?B?cS90RGtva3dzOG1HVUxNZ1hVaENnNmprR3BDdUxFUGxlNGNaN1A0a0V3V2Mx?=
 =?utf-8?B?dHc3NFlIVi95SlRBMmdmQ2JXRGFkTFpkV1ZndlF3Vkc0ci9TVGRLRVpaTGRs?=
 =?utf-8?B?eUFhNmxacUd3V2RhR3VkLzdKRVJ1eWxFbzdUb0VObDM4bEpzRmFjMmNaRnNw?=
 =?utf-8?B?ZGlTeVExWU1YS2VaSlEvQjdscVo0MmdJdk5saW1YSmFhZlN3dEkzYTQ3Zk9K?=
 =?utf-8?B?Sk5ETlU5NkU3Wm8vTW5kbldkSHpBUkJ3MW1MY3lWMnlBblFjSW45V1JJQ0Zl?=
 =?utf-8?B?bjJIWTRYa2tZTVp1K2liN0cxWU5YQ3VKcS9CeGZYM3FWWTZ0N2dkY1dKQ2NR?=
 =?utf-8?B?SGRIM3ZiMHFyVzIvWUQxQTJkQ215WHJQcHFWYjIrQzhyZXlHY1FWeTllNjk0?=
 =?utf-8?Q?7cfFduXUYwLgPt0TZmZ/Q58=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eaf728d-1c75-42ac-e841-08d9b64f1edd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 11:21:58.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoBAdIdZsXYsggmIPA6er2t1pzT18kG0wsqxbNigUhF5IjGLVHHQjkh3/8y4h5nNUty86KdeUd5U3H0botH4Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

The SDM explicitly permits this, and since that's sensible behavior
don't special case AMD (where the PM doesn't explicitly say so).

Fixes: 52dba7bd0b36 ("x86emul: generalize wbinvd() hook")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2310,7 +2310,9 @@ static int hvmemul_cache_op(
         ASSERT(!is_x86_system_segment(seg));
 
         rc = hvmemul_virtual_to_linear(seg, offset, 0, NULL,
-                                       hvm_access_read, hvmemul_ctxt, &addr);
+                                       op != x86emul_clwb ? hvm_access_none
+                                                          : hvm_access_read,
+                                       hvmemul_ctxt, &addr);
         if ( rc != X86EMUL_OKAY )
             break;
 


