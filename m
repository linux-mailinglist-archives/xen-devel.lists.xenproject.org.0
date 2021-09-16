Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6B540E7B7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 19:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188664.337911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQvZ3-0000MH-No; Thu, 16 Sep 2021 17:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188664.337911; Thu, 16 Sep 2021 17:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQvZ3-0000Ir-KW; Thu, 16 Sep 2021 17:52:49 +0000
Received: by outflank-mailman (input) for mailman id 188664;
 Thu, 16 Sep 2021 17:52:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjOx=OG=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mQvZ2-0000Il-55
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 17:52:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fa3ee20-62a6-44e9-b943-8a02da2ab043;
 Thu, 16 Sep 2021 17:52:46 +0000 (UTC)
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
X-Inumbo-ID: 5fa3ee20-62a6-44e9-b943-8a02da2ab043
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631814766;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3GDBpvebfB/L2nkRQc5xS7kV2QZ9dw0uo8UFwVeRI6M=;
  b=D3ArgnPKrICvfUUqnn6jGZC3TFIWVyQAfqGQ+VvCnYpLEV9UvY/G6SSr
   EPVd4xSqJ5hC550tvGLyToh3ZvH6qhu+bZdXjO3bi9sfmmBtVErOLgRF0
   HfApM1AU1U+oJQAG42QS5NywpCZ+ahFqQ+LWNU2LNdMUKHRmchm+VBLdX
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iK7ikIm5m0LJIiMKKLwYYTD+K3Yhx9qmM3h9PfHqkFq3ZYgjKtx8K1mCv7PTzMiHbKQ0fulxCs
 IdX2aHiqbF+REYZoem5FZ2VBkj2CLdwfbjLY/F13tIFmY8hfGvK0TPr1iLHhOCwY8vBxzpeodt
 kZjkxySgiwhC2CA/pi2jGw8eYaEn50sInR0Bh57UW/yCiEKVPU0Gr9zcJuXOKFSbreuqu0PWjv
 16jhgyzoCHd6euZJdm1SL4pU4dHEhXm+ZsdZtxzFOjXoZ64CEIz111NyJbkmZObNulm8Gpn8fd
 ab9noJtJz9LBqdzwlu3EbWmF
X-SBRS: 5.1
X-MesageID: 53329632
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kl9Os6sATwBqdn7FMcr4pR/05OfnVMVZMUV32f8akzHdYApBsoF/q
 tZmKTyOMqyCa2GgKookOYW/phxUuJPXn9FqGVRo/Cg8FXkW+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y52IbhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplpYOCSCgsOLXwv6dGSh9ZKwxdGot55+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DP
 JFDOGQ0NnwsZTVvM3wWJpwChd6axXXGTxl7sw6JuaMotj27IAtZj+G2bYu9lsaxbcRKnG6Iq
 2Te5WP7DxoGctuFxlKt82mlh+zOm2b3XYMODqyQ5/dsjFCDgHYOYDUUX1ampfiyimalRslSb
 UcT/0IGr7U29UGtZsnwWVu/unHslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQCy
 Vuhj97vQzt1v9W9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYWl6ohjOEO0b2H2hOcmjStnrXqaSgK+VCCNo661T+VdLJJdqTxtwOCsKcfc9jAJrWSl
 CNbwJnFtYjiGbnIzXbUEbtXRNlF8t7YaGW0vLJ5I3U2G91BEVaYdIZM6XlVIE5zO67okhe4P
 ReO5Wu9CHJVVUZGjJObgarqUKzGLoC6TLwJs8w4iPIVOvCdkyfdp0lTiba4hTyFraTVufhX1
 W2nnSOQ4ZAyUvwPIN2eHLx17FPW7npmmTO7qW7Tlkz6uVZhWJJlYehcawbfBgzIxIiFvB/U4
 75i2ziikk4EONASlhL/qNZJRXhTdCBTLcmv96R/K77SSiI7STpJI6KAntscl3lNwv09ehHgp
 SrmBCe1CTPX2BX6FOl9Qis/Mei+Ackm9itT0O5FFQ/A5kXPqL2Htc83X5A2YaMm5Kpky/t1R
 OMCYMKOHrJETTGvxtjXRcaVQFVKeEv5iASQETCiZTRjLZdsSxaQoo3vfxf19TlIBS2y7JNsr
 7ql3wLdYJwCWwU9U5qGNKPxlwu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2J9t/7E+Z3EkdAMXPc6LK6aXvT8ma5mNcSW+eUZzHNEmjz/fz6N
 +lSyvj9NtwBnUpL7NUgQ+o6k/pm6oK29bFAzwliEHHaVHiRC+ttciucwM1ClqxR3bsF6wG4b
 V2Cp4tBMrKTNcK7TFNIfFg5bv6O3O0/kyXJ6ahnO13z4SJ68ebVUUhWOBXQ2iVRIKEsbdEgy
 OYl/sUX9xa+mlwhNdPf1nJY8GGFL3ohVaQ7t85FXN+321RzklwSM4bBDiLW4Y2Ub4QeO0YnF
 TaYma7eiukO3UHFaXcySSDA0Oc1aU7iY/yWIIvu/2i0p+c=
IronPort-HdrOrdr: A9a23:SiqXiKOhQoo59cBcT1b155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/OxoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyYygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY9ts2jU0dKT2CA5sQnjuRYTzrdHGeKjM2Z6bRWK
 Dsnfau8FGbCAoqh4mAdzU4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 bxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72zeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlJXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbZrmGuhHjXkV1RUsZiRtixZJGbAfqFCgL3V79FupgE686NCr/Zv2Evp9/oGOtF5Dq
 r/Q/1VfBwndL5gUUtHPpZ1fSKAMB2Fffv9ChPhHb3ZLtByB5vske+83Fxn3pDmRHQ3pKFC7q
 gpFmko7VIPRw==
X-IronPort-AV: E=Sophos;i="5.85,299,1624334400"; 
   d="scan'208";a="53329632"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P86p+9ImKYpdANxLTf+4uQ6lt7UqK1bDiEqPoelIllJo+JjOM864aqe9VRMhBwyPulPEoJKRQWGT9eFNG00ScNCW9MtgFNaDhLyl1TecIiybXakxvKNEu8Z7aBW69T15U/k19fWawyGazY4si6TQwUuxObmUWah2CoBj1PGWAON9vbBKC5X1ZP8+iIxhygBI1hdb7SLT4Tn4MufePxOm08wCaoRySBiE+W+VEWVgc630Kw45tx9/GmE/egptI+XEK0VZItnnDlqs1GJSe0MunuGTLHoqN5ei2cM6Hxk66nuJVoiEWAbGieyvXe3MHWp64+k0dbrLnxhUHPfozSxSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3GDBpvebfB/L2nkRQc5xS7kV2QZ9dw0uo8UFwVeRI6M=;
 b=ZWohzHZng1EwXnLd8UzV220F23b32X4KwDzy6qb4YhY0/S9iNSXkDFD7NuNVnHJS2Psypv1oakqmDu1SBt1zG+1+owzsg8Sbvh928d4yO02EkxnDb3M2fxhnSENHeEqSK6AMA+ToVWrQSww6d9KcNK2hK2vavV51XkiDpQsJQjM8nSYWb+4BCXXZRLxwGIO9C/rh8C2hvAr3PVLz4Bo8KK/D/9UnKAj4imDoT9He4x0HN8/JQ/r4IWqWsLog6ba2Q6kgDa8ciK5tVpnNB2Nx0ssF5NbftFbOzPxu8PTBG5oTvcgirDxIUvIhIhOljr9pJdfYHDINEOXdI3fMOhwhdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GDBpvebfB/L2nkRQc5xS7kV2QZ9dw0uo8UFwVeRI6M=;
 b=T5q8RvWXBtg8/4fzSMYSt/H7WpdJQxj47BgTQ7+7sKseLwbcqAU9Ja34cpzXjT/k81JGpqVKkAF+jTpVETq0SrmVPLa3NIGGx3vYzwHiSD1fCmEGqZcGRJlrry+Y1jznitiW5PTq2qCmunqsMyL4pZJI0mdkFd9VjXnpt/tN6QE=
To: Jan Beulich <jbeulich@suse.com>, Dmitry Isaikin <isaikin-dmitry@yandex.ru>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
 <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
Message-ID: <16d43ba8-d45f-021c-0e19-e233cb967938@citrix.com>
Date: Thu, 16 Sep 2021 18:52:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4d28485-575a-4849-5f43-08d9793abe68
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5775C531557EBF75F153FE50BADC9@SJ0PR03MB5775.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUGLJttSgHomJyVqAKoz3ja+t04piXVpafC0SZqFM/5soQ0j0/dIGqD3jdZeFLweyEkDbpLUqMumNAeCTaIrO4hBgJRhwnRm+9cX4NqNoS6jxDlxbCvlLNzjHQ3hyzpWn1SMkG9FVHXXGCqQVDOQAPWr/DIuO55j0tkx/PVNkIh2C0t+YMHEiwQJ80IYQpoJyo2DVMQ0zaZTCaHy0vCyPQ4jJB9iDQMAQ3ol19mwOgfVFfr+xEyWOe/ofA+reRnvvfy0/ETPXhauJhyqD0klGBNPd1Qq0fUmHvNwH0/WeklX+UUrHQRHLGgd1oC/TTUwrwpP7f0E82mhUQvCdgleqQveWwWXpOPorY21VcM0v/9Zm1DoPLGjJ4pyuiJrgRwQcHTzXapvkxyXiVmzVY4N+bWHgeyJ+tke4nrggkEezGEdi5BF89xbsU/Zrjpvqw+RDNfqORIBp/kVbm1DPj0sIjqShaTHQHXfEiZw0ambdohlBs4e6IiZcZ4CyoX1YQoD3N/SH1TjmTMZ+bTRlNIk3qmKFtCcJvZxHD7KuPYwBG55mAJTwOv8vVz9mvO2s0yHtiY95Gw7uDcTRlx2IXmtY0qkObQyGPQwYKXwWFWDW3/wyThecsN8yNwtN2ntZEHN0TphUlXt68Fv3lC4qde7fxYGAURgB2fwMCRIqY7qrYQEw2ElWQPf0P5i80TMKXMaLC1bFcPczBlF7yzFZRjX6pMElvQe++ckg0E8JCtIUjlGozhVPU0+Ymxi0hoS7aAhqm81KEDg3RtIr25Jpx0XwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(2906002)(186003)(316002)(36756003)(110136005)(54906003)(66946007)(66476007)(66556008)(16576012)(31686004)(2616005)(956004)(4744005)(8676002)(38100700002)(8936002)(83380400001)(55236004)(6486002)(6666004)(86362001)(53546011)(5660300002)(31696002)(508600001)(26005)(23180200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXdHY1ZtcXF5bjlQdllmQUorRnBxaDlpM3hKS0JmMmlBZFR1MGM5RGVjeHY3?=
 =?utf-8?B?VVdTUGllNndNcVBqeFRTS0k1czMvMWF3ZUx0cTRWN0R5WlZTQVZtdFB5WS9u?=
 =?utf-8?B?VG92MzZZclk2bFVJd3E1ZERURXpOWVArSEI3OEVQaXAyWVNNSTRJaGc1L2ll?=
 =?utf-8?B?V3IvNDhSK0VVVU5DcmtZcW90MnFnMWxxQWYxcVJVYWxrU0h3bTl5YzN6bmFJ?=
 =?utf-8?B?TytsSmJJa3J6NjlyMHRHK3VjRHo0dUhINWRjNmt6bXczR2RJWTVQM3JwaEEx?=
 =?utf-8?B?NHVIeGZ4SjhYN2VFQ3IwNEtsMlVKZE1yMm9leFhNVVl3RjMzSHBDdUdtaEN2?=
 =?utf-8?B?UUZnL0ZUVlBSaG9laHRIWGNEbWlqb1FsamcvM1g3SE1HdnhjSmNreW5vRnBq?=
 =?utf-8?B?QjVwZjJLQ3VaYzNUZmc1SlVlR2NCUFBHSVhQVi9rODVtZVBIK205R3IvaE5O?=
 =?utf-8?B?aTdlN3dUeWsvUUtaVWRlMmY0cXpVMXlTaFZFSlJIZkZ3MlBuUzMrNmZUQXlB?=
 =?utf-8?B?YVQ3cUF2MEhBd0QvUFM2RGdmVEh5TTkxYWpxZ0ZPSzRkWG9IQ2JTWVRTcm5V?=
 =?utf-8?B?TnBPWmtpd1NocDFxQ2J6UmVCaThxeWhIRWdVUEV1eWFOK2tRSWJyeXNnaWZ5?=
 =?utf-8?B?VkJqYThEUTg5cHE4MVc1MHhiczR6NjB5RFdycklBQXd5MStuS0NEWXlXL00v?=
 =?utf-8?B?cHAydXRxZ2VFUXFBRVpQYnEybis4ZzkvY2RTSW56UmZJWEFqdUNUdFNzTkFy?=
 =?utf-8?B?R1luc1BzQWRrYzZCTi9FVWp6OWI2Tmdwa3dESy9UdXk3Q2F3ZkVzLyttOVB1?=
 =?utf-8?B?OURySHpRTm5PcDI3Z3VWcnZ5eld2TVhPeWRuYmN6dldsZ0tLQ1JudFoyRTJU?=
 =?utf-8?B?aFpqU0ZYQnVnanNVYWdmbGYzU080VmkxaEdrWUx5MkJxRWRVclFJTGkxQ2M0?=
 =?utf-8?B?WXVBdnd0MVhzbEg1dFhOQUtpVVJBWE9JdGhqZGhSbjM4L0YybGd5cWp3WnJL?=
 =?utf-8?B?L3gzb0hqeExZVENBb2ZnRUJGZWtOV2FWencrcmNITFczYWJSNy81OXJ4ZnpF?=
 =?utf-8?B?WFQ1RzZNYzhUSW5OV1pxckNxMUhKMUZUcmhRcjY0eGZEWmo4NWI3UzlzWlM3?=
 =?utf-8?B?SkYrV1dQRlNsdU85ZGd0dU13K00rZ0lmY1pmdlY4a0tZZ0JHN0x5R2RQOGNr?=
 =?utf-8?B?c3JQQTlwZDdLNUJsTVE0bzJOemlLcGZUZ2NqeE1adDdvWmhYclh5cWlBL0d2?=
 =?utf-8?B?SVZIUlRMMytPZGJhZjNqWVI0aVpBZTFQOUFPQ2RJdDQ2dVIyZDJFY2ZxelB1?=
 =?utf-8?B?ZGovQ0p3aG9nd1JMWllHYndldHdyd0MveFozalo5dXFyckVCdkdOV2hMSlA1?=
 =?utf-8?B?SVdZTzFUejE1eGZtaVY3Y3gxaVdadG5EeGQ0TzgwdFV3UWlZL0E0ZEdvQUlP?=
 =?utf-8?B?OVNkM202Uno5dHJ3bzZvdnl5SVRSVXRYOHJZRHhTdzQvOWo1Q0FnSGFBancw?=
 =?utf-8?B?VHFtK1pVTXJCSUVRbmRTSkJnN0QxVmwxNlNXMTVyS1hWaUM5cGxrTkhjMEpT?=
 =?utf-8?B?RmJSMDhYZ3JKa2YvWis2R0l3cldGVHVBeUludExEQURMOTF6SU9LQ2YxVkYv?=
 =?utf-8?B?RUdDaVFDREdtaXlSd2lhQURQaTlyUEJzbWRIOEdpNXd6dFFFZHZpQXM2RFMz?=
 =?utf-8?B?dVFyRHBQY0FlZUpqL0xJNXduNENDL1V2MDBiMGJ2b0g4Y1FweVlyckltc1g3?=
 =?utf-8?Q?ErffMO3Ignp3HX85tZnVJTrc0Lskx4IfgYisYZe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d28485-575a-4849-5f43-08d9793abe68
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 17:52:26.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emXLVIiZ6jpxpTWMzXtYopWEqSuk71poXRctJFdDVIZJKKu2PB9GSqI4rL3wIrgeO9Me9aYjhkEhsRn5J3B92MnZ2/wS3rab2B8OeNQwOqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5775
X-OriginatorOrg: citrix.com

On 16/09/2021 13:30, Jan Beulich wrote:
> On 16.09.2021 13:10, Dmitry Isaikin wrote:
>> From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
>>
>> This significantly speeds up concurrent destruction of multiple domains =
on x86.
> This effectively is a simplistic revert of 228ab9992ffb ("domctl:
> improve locking during domain destruction"). There it was found to
> actually improve things;

Was it?=C2=A0 I recall that it was simply an expectation that performance
would be better...

Amazon previously identified 228ab9992ffb as a massive perf hit, too.

Clearly some of the reasoning behind 228ab9992ffb was flawed and/or
incomplete, and it appears as if it wasn't necessarily a wise move in
hindsight.

~Andrew


