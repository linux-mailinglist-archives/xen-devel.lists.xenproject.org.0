Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5EB58F1B2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 19:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383767.618953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLpiQ-0006Fd-VZ; Wed, 10 Aug 2022 17:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383767.618953; Wed, 10 Aug 2022 17:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLpiQ-0006DM-S2; Wed, 10 Aug 2022 17:41:58 +0000
Received: by outflank-mailman (input) for mailman id 383767;
 Wed, 10 Aug 2022 17:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLpiP-0006DG-Tk
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 17:41:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b963d164-18d3-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 19:41:56 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 13:41:49 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6949.namprd03.prod.outlook.com (2603:10b6:a03:43f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Wed, 10 Aug
 2022 17:41:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 17:41:44 +0000
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
X-Inumbo-ID: b963d164-18d3-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660153316;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tVQp/cl4Oj1QGx72NSGy52vyBEUR+YFbhytQDT4u7/Q=;
  b=e8pBFe0/HbHCp46gNimFLe/LclUCcBGgGoIfrp7T4S3ZkFug15sz0uUO
   8G5SBJEPU2PEyLgrWoa2TxLQCt8QrUI9iE/FMNre69/HELRDwAiIPd47I
   J3VUoJoPTk33ghcjbnBGWa4rizUTu/gl79fodlxRVuC52UGysbbQFaR4B
   c=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 77049299
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AHA9g6CJdBqYIBVW/zDiw5YqxClBgxIJ4kV8jS/XYbTApD9xgTQDm
 zEXCjyOO/qKa2P1Lt1/aITjphsEsZbWzN5nQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEsvrb83uDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW3rp0/JIJmAQB8ojpvtpB3xR7
 vcbAglYO3hvh8ruqF66Ys9Fo516aePNbMYYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14wbfu3yevG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFa4TDmGDUoxpAgMfJtyT+CJwqKYa5ycA3ph7Ny1wTDxcZAA7TTf6RzxTWt8hkA
 04e9zcqrKMy3Fe2VdS7VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebSMu/
 k+EmZXuHzMHjVGOYXeU97PRpzXiPyEQdDYGfXVdE1tD5MT/qoYuiB6JVsxkDKO+ktzyH3f33
 iyOqy89wb4UiKbnypmGwLwOuBr0zrChc+L/zl+/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:fS6BbKt5I9jcFbpQTXMPxFT47skC1YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqfnSWwfkNHNyMGv/MWTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIYO5gLZvi3+9Kq1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77049299"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHPD2SVlKT9Ns1LmEfY9ZM1CPg5aLvJgo5L7iAyDGm14+EoexA1/Ks52mEcBQ6Ea1fAhE4w1mOI2mTdOy3m5SSRlgtoZyMiXaXgGRIA+75VnxCkacewQzu46GIfx3UtEN3AzQ2JfckwKRMZ28dnXIrVMo0q/xN06M6/g+oPb4i6OBpEqtuys+tsKunJFAioAo9YG/PCeJvX7uXb4bC5ACpUUPUVPBKZvKigpynGdQAsrbhFzOwK3C8FHQ0OoSMuJ8hJ4VqeKDBcX4hjGjtLoYiGG8dgvcZVn0efnSI75cuByj9k56BPhGl9nRUahXRlXpe7YlxCSLc76YO2L8ZxSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVQp/cl4Oj1QGx72NSGy52vyBEUR+YFbhytQDT4u7/Q=;
 b=PGHtm3xeHys5FgoB6M80iqWEP/XQzGXa8dO+M+8/IREU/Y6bv0vn9BE6j+m4+X30phgIv4j2fbUMDwPCPfeu9ypLW0VGmosOfLVRLDWtjexIWG3KrSuneptS+ZYYqWg/BrwzFvbXwwge8j8f0jFJmjl26NUa57ub8d2on8LPGHKni/gLb5czuhj5h9pKvVKPC2kMGMMZuZ7slv6VOY3Jom9wPy8UQp6oYKK/SW2Zq9934UA38z6sJ3rAbNBQm1ixIYLhl4nHII2ckQBkTbBCPfK2MiONw0mFtObfo1E1QWpSdvY0yf3AFis9n4kVrKgCPAhXwd9fjH3i37HYtfSbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVQp/cl4Oj1QGx72NSGy52vyBEUR+YFbhytQDT4u7/Q=;
 b=MLi22eexxharAGisn20tZTKOunbLnYLFem62Zrk1S/ODyP9ANmrW/MEepL7q1aLdv3Dtx0OK4gEtSMzMwmdX9KlO38W2L1mNf4/1PT1VzR38eJcqwLf+bjCqzsw1MRH6/Ia4NvZoP/0TfwAtJ4SsnpkHJKD6dgGgiSveshaRsZw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 03/11] x86emul: handle AVX512-FP16 Map5 arithmetic insns
Thread-Topic: [PATCH 03/11] x86emul: handle AVX512-FP16 Map5 arithmetic insns
Thread-Index: AQHYgKKuUAaNhV3kckqqLTowVcQ2H62ov6QA
Date: Wed, 10 Aug 2022 17:41:44 +0000
Message-ID: <bf655eed-288e-dfa2-34a8-e2d560304272@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <6721f404-e2f9-b686-009c-4c465a5a1e3f@suse.com>
In-Reply-To: <6721f404-e2f9-b686-009c-4c465a5a1e3f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fafdedf8-2834-4c61-2e1b-08da7af797b2
x-ms-traffictypediagnostic: SJ0PR03MB6949:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 K2F/fzT/QQcQ+/t+7UMxxoFdcTEm9N4QgPq4GhiV/z6NN4zXjN/I9rIfteNzprEA+jJpPwFtPnIkJFTVpnc4oVxWYAEIY4WyLeJ0SragMxX8ksLzzV2KRKhvRpUjzhacZYYRDMoH0Lfu1U8a84NFaRQBfXQIZm1b8/8DTpt0bdVZFzckMudCnxDeQ781hXJBekLvwI6BBfkG7YEBVuCEHKwj/XqEM9PSHgSw5IZf6Sid0iZV2BQU0x7rQDra5XdcFnGgCk4vz7dTTdmxOCfEIWrYuNipye+B1cRurXMhKsnbesz7UWZiLh9pTzSExyaIzfXnoPo/0Z28FLP0PmBBjmvAqnrC0VXauI/gm/nO2bGbSOJYZ8F4eLYZwSsqvZjCc9GVkKdNwGd9/yg+X/WwG0T9Str8gb5mnp39x3Sa0vFgbXIRh6ociZJlOUvTRdgcuycDJCHIv+43T9UPUktysTEC/OuK0TuzqFr6Frkblx3YPMgvq3vDkuli0CrS/nR8g3l7VIGRN/q21OGAo9Z/pK57NXwj+YmMrSTl+Fci93lvMflIx3jIKuia1USjaHXbPdOWT1Z2ac8lutD9/aZdY47emSGyDI9dEB3qR6RPndL8d7lTcQPTt4guFycg+2EQ/+GA4gwTYxUf/gxz3Hk6ixJTKPGlMp1UUUBQcFLFzrqU3tpPd49x9PPl4lWKItZQOG6/YxTpO0bmgc4Ur2v1Dt9Dkte3p9F/QdK5GHizFRAandWsXPtNf5XbZLbWwr4XYZTHFFVRtn2WJH10hZIUTmJy8lll2KfN7TxYqqkvvLfFNTK3grIEle78DaGi40VMPHmTr36MladXiWgA9TPY3ffZaEaVNoUvEt1tiL1XY1vCjxp2W57dQdgjDBWW4/qN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(31686004)(82960400001)(2616005)(26005)(107886003)(91956017)(186003)(110136005)(36756003)(86362001)(76116006)(8676002)(316002)(6512007)(38070700005)(4326008)(2906002)(41300700001)(53546011)(6506007)(66946007)(478600001)(64756008)(31696002)(66556008)(6486002)(66476007)(122000001)(38100700002)(71200400001)(66446008)(54906003)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVJQOXlVT2ZJYXozRUhxYk5uSUJodC9nb2F1bTJXdndKVWxtR2ljbVhoREJS?=
 =?utf-8?B?eVhwamRLR2ZWNkxiOG9idzBZd1N0TnpSanFRUVJqQ0lYc1JTcFpNaGN5RkxV?=
 =?utf-8?B?Z0M0b1BGaEZyT1cxNUwzOUgwNzMvTER4eTg2MWpxVWRSVXExbVd0aDkrUDB4?=
 =?utf-8?B?QTQ5b09MZ25sNjdpU2VVWnJKRjJGZmtLZXJ3bUlmMUxLSkc2VWl0bDRoNXFH?=
 =?utf-8?B?VlhaTXZNNzlkSExOVDdSM1ArRjV1OVlZMUNXeExWaE5hbHd2dW45SmwvTlAx?=
 =?utf-8?B?Vzk0OVhiNHR6RjQ1KzFHTEdOaUh5Z0hDcCtucnFXWnBIY29NdUM2R2llVjd4?=
 =?utf-8?B?aE90OTRJSXo5OU9xdXJXRjJ5akFkMm1DUmhDeXppRGJKTW5jcm02SVdYRExI?=
 =?utf-8?B?N1RWbTkzUzJuRXhXdXNGOWRLMmMzNWJ3a2ZvVTBSRzRrZ21QS0dzODBBVHQ4?=
 =?utf-8?B?eUs1d0NqOFNCaG1GUU8zaExGMVBENmZWZlBScFpRK0tBdU5uRFVYU0hIbE1N?=
 =?utf-8?B?N0d3bXV1UjVBaXBCekJJMytnWjhmdmJxRzE5UFJub0V0dHAxU21nSFZ4M1RL?=
 =?utf-8?B?THArNlNPbVlOeVI2WkNZMEg4a01oVXh0d0Yzc3ZhTFVNYjNmSUIwTDJTaXlm?=
 =?utf-8?B?VWZuTitZZk9sTTd2c1E4aloyUExCcmtBcWtqUWgvRzJSc3pHNHdOelZNemlK?=
 =?utf-8?B?cG1WQ1NURnI5WElEN3ZvQXlZNlBwUDZ5eENtdEhnZDFHMGw4eGFMcVMvcXg2?=
 =?utf-8?B?MEw0V2FQYlQyKzUvR2RNcXhpQ1JURHFSMm5oWTEyVVVQRCs1b3E4SHdrK3gy?=
 =?utf-8?B?TjFkM2JZVTBnN2ozVkhKYnlveklFL2JlUCtFNDFxbmlTbytaZDdwM3g1MXJS?=
 =?utf-8?B?OFRzZUhxaUxTRjNlQXVFK2tzOGRqVnI3TDZGTTdTTlkxNEJNR1diSlk0YnlO?=
 =?utf-8?B?dGF3MFZWcjB0MmthS0NlRzZpbzFUQ1Rjbkw3bm0vQWlYRUJ3clVCWXArcXF4?=
 =?utf-8?B?am1qdEpWeCtOQmlYNk9ROWMyNjIwU2hWbk9peURqbzJCS2NOcjdSbUVuZERH?=
 =?utf-8?B?c2JmZ2JYdFQvUmIwamhDSzVlS3k1Y2d3ajVxbU5jYklLd3Q2Yk5CYURPSkZk?=
 =?utf-8?B?dlBTYUp2a3NGQnVyNFQrRnJndXk0UXNxNFRWQU9majlBQzBUbmNLeE0rVUpZ?=
 =?utf-8?B?VDdISllqMHFXemJJRnlpUklFeTlEYnBTOVd0Y1BlQlFnQkozNXY0eHlUVVBU?=
 =?utf-8?B?aXNyU1BNNWdpSEVEekQ0Sk5ibGlhWmRWUnpQQ0MzSnRWbXRicDVwRUw3SHo5?=
 =?utf-8?B?TkViOUxINE1ySUxRWXoyZkFpOHhDUk1yNXZ3eVVDenFtRVJlSkpnM0tTd3NE?=
 =?utf-8?B?RWRWSmY2Z2F0NTJBTUZXUUhkZ1c0d2YvbFVqMWhnUElnclFXR2RBa0Q4SHpz?=
 =?utf-8?B?ZzZNUUJZRm45WE5ZdVRHOWtLc1VaODNxNWU3bUVaNlNXTGlVQ1lxYmtKemZI?=
 =?utf-8?B?MHhDbFJlWFJhTDRpN21QazdRd1JWSmdVQ0ZtM2tuL053RHZnZXpBSHN3cWdQ?=
 =?utf-8?B?WSsxWUdCRGkvTjdTbDdXbk00VlBYRWpkSGFLRlI5eUdEV01FWVZqRmxZWUhE?=
 =?utf-8?B?QTQrYXVxdUFPeFZZeHJjL1RPQ0lSLy85d2llTUpzbVNpdUZ4U3NjZWcyOG1B?=
 =?utf-8?B?dEFCaWM0QVk0QmNNclNLL1M5WWxOS2RxSlcvMnhya290R0pIS3ZocEIvTk5B?=
 =?utf-8?B?eTZRNmwwYUZ3a3h0RHVWTzYyOElJSDllNUdxenIwQnpxcm5CZnlXb28zYWhn?=
 =?utf-8?B?bmZiQWdrVUVsOWJtZUwvZVJZQW4vT1BLUnlubGtHS09JZlJ4a1A2dytOWXM2?=
 =?utf-8?B?SVFpZ2QzUEFOaW4zUWh6Q3RLWEMydDBpUmJ2TWtLRVc4UGVYQWtDVFFnQmpp?=
 =?utf-8?B?ZXNFb0ZhbHFaVnpUOGpWQWIvVTVLN2dITXpZU2ZNSkVGZ29aRjFubkxrTmhQ?=
 =?utf-8?B?YVRXTGRudUpzdDB2Z2NYcHc1KzlBZjFzSWlCRnRYVTI1NC9pODBFeUQ5dEtS?=
 =?utf-8?B?dTZ0MUEwMk51RURWd1BUd3BOdDhvdnNncENCLzFlZWNiVEVuUk9wVHRNSlEx?=
 =?utf-8?Q?yG2LI9CHlaSdAG7a6oFa8Y31r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A41FC1D3CFCC749B2DCDD098B761704@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafdedf8-2834-4c61-2e1b-08da7af797b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 17:41:44.6581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mOHtuoTPDQyqy5q59B1EVDLhGuSSnU8lNjU3dBh3Vg4xm9ejAFYBfHsrax/Q1TOISu31D3+9UP6ryD34L2IuYP6Y6JXKiWCMfF1cHzzNvss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6949

T24gMTUvMDYvMjAyMiAxMToyOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoaXMgZW5jb2Rpbmcg
c3BhY2UgaXMgYSB2ZXJ5IHNwYXJzZSBjbG9uZSBvZiB0aGUgInR3b2J5dGUiIG9uZS4gUmUtdXNl
DQo+IHRoYXQgdGFibGUsIGFzIHRoZSBlbnRyaWVzIGNvcnJlc3BvbmRpbmcgdG8gaW52YWxpZCBv
cGNvZGVzIGluIE1hcDUgYXJlDQo+IHNpbXBseSBiZW5pZ24gd2l0aCBzaW1kX3NpemUgZm9yY2Vk
IHRvIG90aGVyIHRoYW4gc2ltZF9ub25lIChwcmV2ZW50aW5nDQo+IHVuZHVlIG1lbW9yeSByZWFk
cyBpbiBTcmNNZW0gaGFuZGxpbmcgZWFybHkgaW4geDg2X2VtdWxhdGUoKSkuDQoNClRoaXMuLi4N
Cg0KPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUvZGVjb2RlLmMNCj4gKysrIGIveGVu
L2FyY2gveDg2L3g4Nl9lbXVsYXRlL2RlY29kZS5jDQo+IEBAIC0xMjE5LDkgKzEyMTksMTggQEAg
aW50IHg4NmVtdWxfZGVjb2RlKHN0cnVjdCB4ODZfZW11bGF0ZV9zdA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgb3Bjb2RlIHw9IE1BU0tfSU5TUigweDBmM2EsIFg4NkVNVUxfT1BDX0VYVF9N
QVNLKTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGQgPSB0d29ieXRlX3RhYmxlWzB4M2Fd
LmRlc2M7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gKw0KPiArICAgICAg
ICAgICAgICAgICAgICBjYXNlIGV2ZXhfbWFwNToNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
IGlmICggIWV2ZXhfZW5jb2RlZCgpICkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHsNCj4g
ICAgICAgICAgICAgICAgICAgICAgZGVmYXVsdDoNCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
IHJjID0gWDg2RU1VTF9VTlJFQ09HTklaRUQ7DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICBn
b3RvIGRvbmU7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmMgPSBYODZFTVVMX1VO
UkVDT0dOSVpFRDsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7DQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICB9DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBv
cGNvZGUgfD0gTUFTS19JTlNSKDUsIFg4NkVNVUxfT1BDX0VYVF9NQVNLKTsNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIGQgPSB0d29ieXRlX3RhYmxlW2JdLmRlc2M7DQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICBzLT5zaW1kX3NpemUgPSB0d29ieXRlX3RhYmxlW2JdLnNpemUgPzogc2lt
ZF9vdGhlcjsNCg0KLi4uIG5lZWRzIGEgY29tbWVudCBoZXJlLCBhbmQgLi4uDQoNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgICAgICAgICAgICAgICB9DQo+ICAg
ICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKCBzLT5leHQgPCBl
eHRfOGYwOCArIEFSUkFZX1NJWkUoeG9wX3RhYmxlKSApDQo+IEBAIC0xNDQzLDYgKzE0NTIsMjQg
QEAgaW50IHg4NmVtdWxfZGVjb2RlKHN0cnVjdCB4ODZfZW11bGF0ZV9zdA0KPiAgICAgICAgICAg
ICAgfQ0KPiAgICAgICAgICAgICAgYnJlYWs7DQo+ICANCj4gKyAgICAgICAgY2FzZSBleHRfbWFw
NToNCj4gKyAgICAgICAgICAgIHN3aXRjaCAoIGIgKQ0KPiArICAgICAgICAgICAgew0KPiArICAg
ICAgICAgICAgZGVmYXVsdDoNCj4gKyAgICAgICAgICAgICAgICBpZiAoICEocy0+ZXZleC5wZngg
JiBWRVhfUFJFRklYX0RPVUJMRV9NQVNLKSApDQo+ICsgICAgICAgICAgICAgICAgICAgIHMtPmZw
MTYgPSB0cnVlOw0KPiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPiArDQo+ICsgICAgICAgICAg
ICBjYXNlIDB4MmU6IGNhc2UgMHgyZjogLyogdnssdX1jb21pc2ggKi8NCj4gKyAgICAgICAgICAg
ICAgICBpZiAoICFzLT5ldmV4LnBmeCApDQo+ICsgICAgICAgICAgICAgICAgICAgIHMtPmZwMTYg
PSB0cnVlOw0KPiArICAgICAgICAgICAgICAgIHMtPnNpbWRfc2l6ZSA9IHNpbWRfbm9uZTsNCj4g
KyAgICAgICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICAgICAgIH0NCj4gKw0KPiArICAgICAg
ICAgICAgZGlzcDhzY2FsZSA9IGRlY29kZV9kaXNwOHNjYWxlKHR3b2J5dGVfdGFibGVbYl0uZDhz
LCBzKTsNCg0KLi4uIGhlcmUuDQoNCkJlY2F1c2Ugb3RoZXJ3aXNlIHRoZSBjb2RlIHJlYWRzIGFz
IGlmIGl0J3MgYnVnZ3ksIHdpdGggbWFwNSByZWZlcmVuY2luZw0KdGhlIHR3b2J5dGVfdGFibGUu
DQoNCn5BbmRyZXcNCg==

