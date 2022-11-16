Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594962CEF6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 00:43:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444418.699601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovS2S-0006nC-3a; Wed, 16 Nov 2022 23:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444418.699601; Wed, 16 Nov 2022 23:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovS2S-0006l1-0T; Wed, 16 Nov 2022 23:41:52 +0000
Received: by outflank-mailman (input) for mailman id 444418;
 Wed, 16 Nov 2022 23:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCFo=3Q=citrix.com=prvs=3126b6494=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovS2Q-0006kr-7A
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 23:41:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a94d2c3-6608-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 00:41:46 +0100 (CET)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 18:41:40 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6133.namprd03.prod.outlook.com (2603:10b6:208:308::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 23:41:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%5]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 23:41:38 +0000
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
X-Inumbo-ID: 3a94d2c3-6608-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668642106;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5L0eP4LUzgRdHGLpOYPVmIL/y/XtitB74DVmbauyVJY=;
  b=DIpAY/OBv6ZNQUndnrXWJ2HLQLcvASJN+udxWvAI9aRSmUy8Y+EwbTuC
   6zWPUFKLsBGZzbDle46pm7oOofidXW5kGfpWbL7j6TQ8ytmF3WZkFb4Od
   0vih29Lm99iJHhTjzwJmL0X6Y9oe19ZTEcbr2LN0eYQz1eWAL0KQ7Mrqx
   c=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 84049320
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WKSknakY1tJpzwsquXvB+4Ho5gwvJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXUWqAbq2Ca2GjL4t3YYnk8B4CuMDQnYJkGgM/qSpkESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5QGGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 foHCyIOfx6Tvbrs346hadBpm8QcPfC+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3ieexWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapCSOXkp6Uw2DV/wEQ/NS0SBGWDhMWhoXThUNZhd
 G4ZyzUh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bpgnCRct5EbKkps34H3f32
 T/ihDc6r6Uei4gMzarT1VLahzOhoLDZQwhz4R/YNkqb6Qd+aJ+gdpafw1HR5vZdL66UVlCE+
 nMDnqC25u0UEYuEkiDLRewXBayo/N6MKjiaillqd7EB+jK36jicdIZfyDhkIQFiNcNsRNPyS
 ErauAcU6JoNOnKvNPZze9joVJhsyrX8H9P4UPySdsBJfpV6aA6A+mdpeFKU2Gfu1kMrlMnTJ
 KumTCplNl5CYYwP8dZ8b751PWMDrszm+V7ueA==
IronPort-HdrOrdr: A9a23:x5toxqtaWqNsNufEo2AeSDTN7skCXoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQngoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPbi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZDIMu60vFjLA
 BdNrCa2B9kSyLdU5kfhBg3/DWYZAV2Iv5BeDlbhiXa6UkMoJkz9Tpk+CVWpAZ9yHt6cegF2w
 2MCNUXqFkFJPVmEp5VFaMPR9C6BXfKRg+JOGWOIU7/HKVCIH7VrYXriY9Frd1CVaZ4u6faoq
 6xJm9wpCo3YQbjGMeO1JpE/lTER3i8Ry3kzoVb64JisrPxSbL3OWnbIWpe2PeIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20n7V4NJIXcTXcUJspIwWk6IoMjMNor239arOMr7Nf7oC3IpS2n/Cn
 wMUHz6I9hB9FmiXjvijB3YSxrWCzjCFFJLYd3nFsQoufsw39d3w3koYHyCl7G2ACwHtLAqd0
 1jJ76imr+npACNjBT101k=
X-IronPort-AV: E=Sophos;i="5.96,169,1665460800"; 
   d="scan'208";a="84049320"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggy0hrotj9r1ugSuoC7iOsrrekO7zEb3l4dHVO1iDFNj2wnCt+XhazkOuarNatMgIOQJOA9fPkeQBb2SvM981q6BpvOWJ6ofKli2b9kzl9P+jhrbcMOazf3y/xw2WCV48UA30ZUHX6OKyLAiqp1PSkzHTeIb6OPPLyjJwkIv8LMgScd/Xfm1fqYI9eazoaOiN5QTqtJDQpty/FK8Z5Gv+EOigu3ccBrspxLyq5EGo9u1wr8WmCe6vjh/zXuRCb2J8OZn5wozrygVEm6d9aIzP0lOFLBP5aUZl6dSXyNmCfLA7kNiVQsrj6ngz4F8hN8F/qP7OxVY38w3jQshl2g8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L0eP4LUzgRdHGLpOYPVmIL/y/XtitB74DVmbauyVJY=;
 b=JQ4I2pDVdjs4NrKkV++RsYXGYEYItpmZvnaiYyBYtAmpNf3EZ1YYTwSKEFVORrkVkGiwmTynyyv2+QGgDRiWuwUcchJvIeVYS7BngJ75lBHXcCYL0NSfdfdFfGwtyOeFHZMxl9wPK/uuKUhX0d8qY+0N7sBaKYub1H4KR+9n+I7GZQBau3N/PAzbx5/QNoY7TiUUA3vAJR6iapav8wtJXoJXFcSZThMo+T8Nee5lTpDP+i8k1P1IbZzvBQHBQsiYOah7PY2d/duaPyeXpGbA/UoH5EIzR3qEc4iCIIJAoZQTSIh5aopYCOeuIwXMB6w4J4QKphHOBDp9BR2nl6M0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5L0eP4LUzgRdHGLpOYPVmIL/y/XtitB74DVmbauyVJY=;
 b=NM2lL3wBCit6AjyTqirVmJuGm66M5Tl9l98N3mT5/AVZG0bkrKmTl61Zj/XPPax8l8zImIN8fPt93PsEydK8CX2s5RMye2KXjgRzax+qGEDBGA4FffZWklApu0i4zE4Pz/0RwEVLHSwIuCns9aomXGQ7etEgs+K9L8iW5p1RG2Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Xen Security Team
	<security@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Thread-Topic: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Thread-Index: AQHY6SSlXP4isouqyE+BbtcNRl5Xnq5A5cGAgAAC9ICAAANygIAAbOuAgAD+lIA=
Date: Wed, 16 Nov 2022 23:41:37 +0000
Message-ID: <269f4e70-07c2-5cf6-f42e-6f98e2ce70dd@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2211151724320.4020@ubuntu-linux-20-04-desktop>
 <c0ba7b0f-d91f-74f2-be4a-3cb944392c95@citrix.com>
 <alpine.DEB.2.22.394.2211151759480.4020@ubuntu-linux-20-04-desktop>
 <ddb3dd9b-8697-1fe8-2dcc-2b5b859d18f6@suse.com>
In-Reply-To: <ddb3dd9b-8697-1fe8-2dcc-2b5b859d18f6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BL1PR03MB6133:EE_
x-ms-office365-filtering-correlation-id: 48978556-f8d3-4767-54d4-08dac82c1ad2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OZGQY1rIaEcNVk2KPnjW+vgoSXu6yLLnamVolq15mPRoca9hvqYE+KP7OVcwL5sW5kIrTmgvvtAIutL2OrH8rSBnx3jST6sn5LmyoqFoTA1sDmexN23SxAh40XgCntdaC2CO5orySiw2lsNoV0tIRx/kz45UDzW1tcMMZ7Uv+XHA6NOt2bRjpzWmMpsZt9eUrVNEmCn2Ckw/OoenMxBt12YXOHgJwpHOY4vki24hhTDD3itzG41up6i66jM9kBIA2q8h+SpDlAtlleKSaGa/tzbEVeJMnJlBcrL/c6yFAjpp3Mbh771QlucSTA0DZXqgXEXkuy1hiAmnLC2Lob0gDd3EpUGlTScFDcur/4HVoeDm1Mu0wLRfRu2Uz9Ntpl0JYD+I1f8k/lZFqJ/hKRCoE9hMNCPLmqYxWbkjzlVEP+fYXEgvoWBuSPzHxVIgw14QY5G4TIpcCh1M2oSQBRR5MGZJRCCMqIOh8zNpbOrmD8ZoJjmuw+02q95TUE9tGhVfkpq0mvHFgVRQ1tboy8lW5uG/RMxFsEjBISHBYWj8yIwq127s+4h5QTh7qN4F2x4QAL8TypeY77LERHQXNWQzw6qXUaV0VSyG7lG9cnPdJA40ngaqH/NL1oEv4UqlgRkIosb01zpPJ80smsIUVu7lsGa3USHWdAt05x3vH1MWOwks/UoL6Q/kk1kXvrL2upmYDdruBqhNXinnD3zAjllVlAa6qTBj5osJDUnWstc02pL/YNyXFGgotwIbaX6PoGN3ey0oyHn4NuZxbC3PHCSUd++nAKtQSOrgfrck/6YvP3ysPbtcvdAB5FX9fAWhdWuA33LB2M28+EDhuQVWhypyIA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199015)(36756003)(76116006)(66556008)(66446008)(26005)(64756008)(66476007)(91956017)(66946007)(8676002)(6512007)(4326008)(316002)(54906003)(6506007)(110136005)(5660300002)(41300700001)(186003)(2906002)(8936002)(53546011)(86362001)(31696002)(2616005)(83380400001)(6486002)(71200400001)(31686004)(82960400001)(66899015)(38100700002)(38070700005)(107886003)(478600001)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NDA0OGlxMHBSdHpnK0d5WTNKTWRwbmRCUnVyUm1Oa0s4QUNnK3ZSMWYweCtr?=
 =?utf-8?B?RWowcExUVVZ6NWVVV1ArR0VldXJVdDhIMC9ZbC8vNm5ERFYrVTF5dDFSdlJH?=
 =?utf-8?B?b0YxcXkreThaaUJsZnVEbFJrRTV1aElpVDYwTlh5T3RudUlESExjbmRtcUJQ?=
 =?utf-8?B?TkQ1ZGxRR3puNGVQTEN1ZldySC92c0ZaTzFOc3YxL3NQNmlPcVdZbUNXTkxv?=
 =?utf-8?B?T1RNZGJoZFg0Z2JtcU13clpPVlY3Z3VsSDNqWW5lN2RvUC84cFI5R3V5Vkda?=
 =?utf-8?B?NDhML1FOZGVLYTJYK2N3OVV2Tm1rcDdTMW9CVG9sRzEySG1oc2ZZRHh4M2pu?=
 =?utf-8?B?Rkd1YmtJQ2Rpb0ZrNE84RmFnejkxU3Zkc0hxaXNHTVlIYVpqYkFvQU4xQXZi?=
 =?utf-8?B?WUlWVnNrd3RrTU1oNzJZcU4zWGZ6dHN4U2N5RGxxQzNleUpqcFlPVkgvbGxm?=
 =?utf-8?B?Yjd3L1hiNHp4ZFhyK09KS3luYWdPWDJWQW5NNVZGNUJkM2tFYXl5cHlJNGMv?=
 =?utf-8?B?SldObFEvNENGMUtFdlRwSVdWVkRHN1Q3cnVJYzc3SlRUZXlMME5aamdUSzZl?=
 =?utf-8?B?cmo4M0lPT1VmcHBrSE5Pa25WUVQ3bnNFK3dqSUszVlloMURFV1FrODNYSFpP?=
 =?utf-8?B?RHQ4ai9hV1lGVzZVS1dmQzFtQW1EYTFlNitlQzRFZlRUTlJ3RDhMSTFSMVlF?=
 =?utf-8?B?TnU5VDJQenhEdDdYU3M2TTVDSlJNcmNtbUNNRzZvby9tdW8waHB5Qm1ndkpE?=
 =?utf-8?B?WEdLUEZ3OWlQdG9EcmRFTXFiMS9rNWNuWDZiL2ZzVmRIVGdleFpjVUxTLzlZ?=
 =?utf-8?B?TmZBOEFIVzB6azFMci9JNkpMK29oUnhPTU11THh0cWY2dFEwZGJLRGVMTk1y?=
 =?utf-8?B?TXhXZ0lJY2N3RWk2Z2doS2NhUUpsUFZBemZ0WUxZMFV6c2FqOTN6bW1ESXVn?=
 =?utf-8?B?ZGl2UXV1OXdiNnFydjhTMzdoNVhDQ3J1NUF1VmQ1QkNCOEVPOEJpcEo4WTJ2?=
 =?utf-8?B?MVdZQ0FhdVpkSUw3RTZEY3l5YmlUQ0oxMzhoMnlUeURieUc1V0xHZzZyelNk?=
 =?utf-8?B?cTRPNDh1dmhIL1UxVkpzUVJuR3RibE1kV002SEttc01TZVdySXRnblYxY1dO?=
 =?utf-8?B?U2NrWm5RczZYZWhQS2FkQnB1aFdIcGZmKzBWZVgweHpOVHNzU3R4ekVMOTZw?=
 =?utf-8?B?dXFYNWNiTWxzRms0OE1lV3VtckRFeXF2bDg0aU5veGhUTzVWWkxER3U3dVRB?=
 =?utf-8?B?a0tUN1pIRWNzOUoyQXFEQXJTQ1pqTFI4dWVtUE5uUFNUZ0ZGOUF3MUdpM01E?=
 =?utf-8?B?WmkzNXJOdTI5VEU1YVpxZmdid29jMlpBTkRxWENuQlJ0V2FtUFEwTkdONWFL?=
 =?utf-8?B?OUtWbnZFUDAzL2wxVG5ybDIvR2VRRHBsTmh5akJobFZ3Y1A0cXJjelUvait2?=
 =?utf-8?B?UHdhcjQ2TEVITEJsMTR2RkthNWFyZ25WODFPeXpqV2luUDZLd1ZRWFBFUC82?=
 =?utf-8?B?TnF0UW4zUDhnSGZBeWpZdHIrUHJ4MVlTdU53VDhpck5hVkVKbU1xUzFNaXhs?=
 =?utf-8?B?ZExHRnI2TTVnY0NndFFjaUsvQ1JRMUFIUlRydnk1bi9XREhOb2gwcEFOVWtM?=
 =?utf-8?B?eWRzZk0rMThjTWdXdWJ3a2YvYXRwODBaajhtR2l6SUJTaFNNSzJQbjFIZDBW?=
 =?utf-8?B?UVVZSGFJUkYvZWNveVhvMm5uY29saXRmZGFTTGUvVUNKQTczc2ZadFFxWldj?=
 =?utf-8?B?dFJBeHdxV3M5S29MMVJVQThPZlhpeS9LQXhHcXh5RmhmcXN4Q2FoZE81d3dq?=
 =?utf-8?B?WG9ZS0pLb1JTNEljN1FLdDZTd0RqRGIxanFIMUtweGt5THI3ZjkrYk5xZGJw?=
 =?utf-8?B?YzY1VzlzSmRHNDJMc0s0TG1tOC9QNXBYaXZPN3VaZDZ1UzFrT2ttZkpuVEFa?=
 =?utf-8?B?cms5b1I5bkhXZFRGdHNaOWVPTmhjeXlJZmx3MkdicUdWUm05dW8vNGhQcEFq?=
 =?utf-8?B?YnNmV0RyODM0N1preTRKVDdhb1cxaWpsSkxKQlRCUjFYR25RUVlZMzhPSXhl?=
 =?utf-8?B?RHp1M1ZSVHJrZDB3WENuLzJxUElmNkdHYTExOWpFY1ozaXJkSnBNWkY3OVlF?=
 =?utf-8?B?dFlsM3lHekNHUmhreEZiUmxsaGZ0cStDbE95T2F6eVVUUjhQQytUSmkvMUZG?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15D60AB6EE7C444C98D401B6C4C905FF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?bFNrenZvNU5peHlaY3dGUFRVK0FXMDh3cWJmRWFuMERZMGJIczdkY2FWdW04?=
 =?utf-8?B?bzFkdThWMkM1SmtzdzcvTm5JU1ZuQnJDV29PR3o5cnB0VVlWR0JEQy9NWVpE?=
 =?utf-8?B?UG11RnphVk8vYmp5VFlRV1pzYlNzVnhwdFhrcVFMb3AyQ05PWlRONDBRalc3?=
 =?utf-8?B?UW1hM2dIUlpVSno5NGFxakZIa09Pa0kxYU9xc1RTL1NwendDdjVBTW5vZkhO?=
 =?utf-8?B?ZGpHRWRwd2VrY2tYR25yYUIyMHQ4eUNsTjZmWFNFVjJZN2ZGdm5OYm1wb0dz?=
 =?utf-8?B?aEtBQVRyd3hxSDFVYmFVeWdhMjM0elFmVTJzVHJwTkpndE9CRG5VNEVPUTNM?=
 =?utf-8?B?eG54NDJjazRxWnl3MXpDTFBrOFdtb0lrSHhmUjRYZ1VlNzJOTVNIbUVIV1Uv?=
 =?utf-8?B?ZFNyTHFiWHMxWCtWcC9ucUg4NFlGMlR0d3ZpVUFXQkRSQXMwQjg1aVFPYlpK?=
 =?utf-8?B?eGI0dFBsRTZpL3VLTVBoZnJCWGxMVmUzSVhTL0Mra2pBSWQwTGZ2eEdHOFpN?=
 =?utf-8?B?R3V1STZaQVlxOGhwUFE3c29JZWRWY3VUbFdlMnlmMUpwYVA0bTVJb0IvTFdC?=
 =?utf-8?B?KzZWaUFYU3R6aVBuZzY5Z1E1VWR3SnpxQXdENVlyS2lQTldVYXJscEhvVE9a?=
 =?utf-8?B?Vnp4ZXd4Sld3SldQUHFvNC9sM2c5ckk3UHFQU1ZvQ0l6b1NoVy82bkJjUFE3?=
 =?utf-8?B?VkxHKy9aNWFvblRwMWRjdGVSeXNtbXVQZ2NITG5hV0VNaFBjQTZzRjZIaWp3?=
 =?utf-8?B?VzlJTTRKOWZ2LzlNOHRhQnNWZVpDL1FUOVZJY1pOamN3dGtKalpySUVYQ3V0?=
 =?utf-8?B?cHJ3ZlJ3NEp5WU9FNFk2UW50cU44a1liY2hzUmN1VVdIcjIrTGNCdFJpb1dh?=
 =?utf-8?B?S2QyUmNibFJVQkVySWNwT3hCNWM1WmJLY0VWM0FuM3o0WStUa1lycXRocnI0?=
 =?utf-8?B?cFlxazViaDFqMEpDbjlsWEs5RTNsYkpCMXRHRVNUaG5DRmxtZTR5VENuT2FC?=
 =?utf-8?B?QWd0aWtaNTlvWFBWOWpMOFJQL291VGNIRnpRcGxnOVl4b0lLcGxsT2Y4YU1J?=
 =?utf-8?B?c1dPTTVtSFRFeXZwYmp6a3F4Mno0bEtieFJ6ZFd4T0NVWlNsYUMvcjR5T25K?=
 =?utf-8?B?R3BORUIrYVg5dVVtVTFPWlZ0dUYxaDhROERYdEVDY0swelNIZlVQUzErOUJV?=
 =?utf-8?B?OE1EUi9GTjNXeGl4anRHTTBybTgxK1crT3NudUFiQXhIK0YxdVFKM2ZMSlBZ?=
 =?utf-8?B?Zzl5bFFuRHFhZ29qQ3MvSzhVT3BidW1zN0NaSUpPZCt2bllQUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48978556-f8d3-4767-54d4-08dac82c1ad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 23:41:37.9829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vHYiPllO3mGYCRZRQLbnhuS5sXQ4YasbNyoSj5qT29cO6EcwMTnQh6PgRwiQyEMWeziGfFp3IVkhF3wXGapnUNmD/JepfhZIKoCQx119rcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6133

T24gMTYvMTEvMjAyMiAwODozMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjExLjIwMjIg
MDM6MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+IE9uIFdlZCwgMTYgTm92IDIwMjIs
IEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMTYvMTEvMjAyMiAwMTozNywgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBPbiBXZWQsIDI2IE9jdCAyMDIyLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOg0KPj4+Pj4gVGhpcyByZXZlcnRzIG1vc3Qgb2YgY29tbWl0IGNmMmE2OGQyZmZiYzNj
ZTk1ZTAxNDQ5ZDQ2MTgwYmRkYjEwZDI0YTAsIGFuZCBiaXRzDQo+Pj4+PiBvZiBjYmVhNWExMTQ5
Y2E3ZmQ0YjdjZGJmYTNlYzJlNGYxMDliNjAxZmY3Lg0KPj4+Pj4NCj4+Pj4+IEZpcnN0IG9mIGFs
bCwgd2l0aCBBUk0gYm9ycm93aW5nIHg4NidzIGltcGxlbWVudGF0aW9uLCB0aGUgbG9naWMgdG8g
c2V0IHRoZQ0KPj4+Pj4gcG9vbCBzaXplIHNob3VsZCBoYXZlIGJlZW4gY29tbW9uLCBub3QgZHVw
bGljYXRlZC4gIEludHJvZHVjZQ0KPj4+Pj4gbGlieGxfX2RvbWFpbl9zZXRfcDJtX3Bvb2xfc2l6
ZSgpIGFzIGEgc2hhcmVkIGltcGxlbWVudGF0aW9uLCBhbmQgdXNlIGl0IGZyb20NCj4+Pj4+IHRo
ZSBBUk0gYW5kIHg4NiBwYXRocy4gIEl0IGlzIGxlZnQgYXMgYW4gZXhlcmNpc2UgdG8gdGhlIHJl
YWRlciB0byBqdWRnZSBob3cNCj4+Pj4+IGxpYnhsL3hsIGNhbiByZWFzb25hYmx5IGZ1bmN0aW9u
IHdpdGhvdXQgdGhlIGFiaWxpdHkgdG8gcXVlcnkgdGhlIHBvb2wgc2l6ZS4uLg0KPj4+Pj4NCj4+
Pj4+IFJlbW92ZSBBUk0ncyBwMm1fZG9tY3RsKCkgaW5mcmFzdHJ1Y3R1cmUgbm93IHRoZSBmdW5j
dGlvYW5saXR5IGhhcyBiZWVuDQo+Pj4+PiByZXBsYWNlZCB3aXRoIGEgd29ya2luZyBhbmQgdW5p
dCB0ZXN0ZWQgaW50ZXJmYWNlLg0KPj4+Pj4NCj4+Pj4+IFRoaXMgaXMgcGFydCBvZiBYU0EtNDA5
IC8gQ1ZFLTIwMjItMzM3NDcuDQo+Pj4+IEdlbnVpbmUgcXVlc3Rpb246IEkgY2FuIHNlZSB0aGlz
IHBhdGNoIHJlbW92ZXMgdGhlIGltcGxlbWVudGF0aW9uIG9mDQo+Pj4+IFhFTl9ET01DVExfU0hB
RE9XX09QX1NFVF9BTExPQ0FUSU9OIG9uIEFSTS4gSXQgYWxzbyBzd2l0Y2hlcyBsaWJ4bCAoYm90
aA0KPj4+PiBBUk0gYW5kIHg4NikgdG8gdGhlIG5ldyBoeXBlcmNhbGwuDQo+Pj4+DQo+Pj4+IFdo
eSBrZWVwIHRoZSBvbGQgaHlwZXJjYWxsIChYRU5fRE9NQ1RMX3NoYWRvd19vcCBhbmQNCj4+Pj4g
WEVOX0RPTUNUTF9TSEFET1dfT1BfU0VUX0FMTE9DQVRJT04pIGltcGxlbWVudGF0aW9uIG9uIHg4
NiAobm90IG9uIEFSTSk/DQo+Pj4+DQo+Pj4+IElzIHRoYXQgYmVjYXVzZSBpdCB3YXMgb25seSBy
ZWNlbnRseSBpbXBsZW1lbnRlZD8gQW5kIG5vdCBhY3R1YWxseQ0KPj4+PiBwcmVzZW50IGluIGFu
eSBwYXN0IFhlbiByZWxlYXNlPw0KPj4+Pg0KPj4+PiBJZiBzbywgcGxlYXNlIGFkZCBhIG5vdGUg
YWJvdXQgdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIEFsc28sIGlmIHRoYXQNCj4+Pj4gaXMg
dGhlIGNhc2UsIEkgdGhpbmsgdGhpcyBwYXRjaCBzZXJpZXMgc2hvdWxkIGdvIGluIDQuMTcuIElm
IGl0IGlzIHRvbw0KPj4+PiBsYXRlIHRvIGdldCBpdCBpbiBiZWZvcmUgdGhlIHJlbGVhc2UsIHRo
ZW4gd2Ugc2hvdWxkIGJhY2twb3J0IGl0IHRvIDQuMTcNCj4+Pj4gYXMgc29vbiBhcyBwb3NzaWJs
ZS4gVGhhdCdzIGJlY2F1c2UgaWRlYWxseSB3ZSB3YW50IHRvIGtlZXAgdGhlDQo+Pj4+IGh5cGVy
Y2FsbCBpbnRlcmZhY2UgY2hhbmdlcyBkb3duIHRvIGEgbWluaW11bS4NCj4+PiBPbiBBUk0sIHRo
ZSBoeXBlcmNhbGwgaGFzIGV4aXN0ZWQgZm9yIGEgbGl0dGxlIG92ZXIgNCB3ZWVrcywgYW5kIGlz
bid0DQo+Pj4gaW4gYW55IHJlbGVhc2VkIHZlcnNpb24gb2YgWGVuICh5ZXQpLg0KPj4+DQo+Pj4g
T24geDg2LCB0aGUgaHlwZXJjYWxsIGhhcyBleGlzdGVkIGZvciBtb3JlIHRoYW4gYSBkZWNhZGUs
IGFuZCBoYXMga25vd24NCj4+PiBvdXQtb2YtdHJlZSB1c2Vycy7CoCBJdCBuZWVkcyB0byBiZSBk
ZXByZWNhdGVkIHByb3Blcmx5LCB3aGljaCBpbiB0aGlzDQo+Pj4gY2FzZSBtZWFucyAicGhhc2Vk
IG91dCBpbiB0aGUgNC4xOCBjeWNsZSBvbmNlIGtub3duIGNhbGxlcnMgaGF2ZSBiZWVuDQo+Pj4g
YWRhcHRlZCB0byB0aGUgbmV3IGh5cGVyY2FsbCIuDQo+PiBVbmRlcnN0b29uLiBUaGVuIEkgYW0g
aW4gZmF2b3Igb2YgZ2V0dGluZyBhbGwgNCBwYXRjaGVzIGluIDQuMTcsIGVpdGhlcg0KPj4gYmVm
b3JlIHRoZSByZWxlYXNlIG9yIHZpYSBiYWNrcG9ydHMuDQo+IFJlbW92aW5nIHNvbWV0aGluZyBm
cm9tIHRoZSBkb21jdGwgaW50ZXJmYWNlIGdlbmVyYWxseSByZXF1aXJlcyBidW1waW5nDQo+IHRo
ZSBpbnRlcmZhY2UgdmVyc2lvbiwgc28gc29tZSBleHRyYSBjYXJlIG1heSBuZWVkIGFwcGx5aW5n
IGlmIHN1Y2ggYW4NCj4gaW50ZXJmYWNlIGNoYW5nZSB3YXMgdG8gYmUgYmFja3BvcnRlZCB0byBh
bnkgc3RhYmxlIGJyYW5jaC4NCg0KVG8gYmUgY2xlYXIsIEkgaGF2ZSBubyBwbGFucyB0byByZW1v
dmUgdGhlIHg4NiAib2xkZXIiIGludGVyZmFjZSBpbiB0aGlzDQpwYXRjaCBzZXJpZXMuwqAgSXQg
d2lsbCBkZWZpbml0ZWx5IGJyZWFrIG91dCBvZiB0cmVlIHVzZXJzLg0KDQpJbiB0aGUgNC4xOCB0
aW1lZnJhbWUsIHdlIGNhbiBzZWUgYWJvdXQgcmV0aXJpbmcgdGhlIG9sZGVyIGh5cGVyY2FsbHMs
DQpidXQgYXMgYSBub24tYmFja3BvcnRhYmxlIGNoYW5nZS4NCg0KfkFuZHJldw0K

