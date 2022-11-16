Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C962BC3D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 12:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444274.699303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovGnc-0007Ah-Qc; Wed, 16 Nov 2022 11:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444274.699303; Wed, 16 Nov 2022 11:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovGnc-00078W-NW; Wed, 16 Nov 2022 11:41:48 +0000
Received: by outflank-mailman (input) for mailman id 444274;
 Wed, 16 Nov 2022 11:41:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCFo=3Q=citrix.com=prvs=3126b6494=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovGna-00078Q-CV
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 11:41:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a34a77ce-65a3-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 12:41:43 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 06:41:36 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DM4PR03MB6997.namprd03.prod.outlook.com (2603:10b6:8:42::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 11:41:33 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 11:41:33 +0000
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
X-Inumbo-ID: a34a77ce-65a3-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668598903;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0GQYNXHK42E8YwJZDQuJ3dZr4sVEb1T9VwXr3ouvMdc=;
  b=cgz1cRXf6BRZkuYKdwuX2p8NI/5eWWuS8OPE1NFPIQaKG3VVBXSOEX1V
   XuhwTe84U1CKKO5ej/rUM0sbnHeC8nUU1N+3QKu9bZYrMPccx8Fo3Qxbq
   2j/Ju9csGp1ykTD4IAkh7T1zW9xjguLtdPKxuPM1w0RJqJD9ttL4jXs3L
   c=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 84518218
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fMJRZaBgK2blSRVW/xfiw5YqxClBgxIJ4kV8jS/XYbTApDl2hDQAx
 mBKCG6POfyMamX3co10Yd/loUNQsJbXz4RmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpB4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwy8doQlxz8
 +YiCC0uVkGdgvuRh++eVbw57igjBJGD0II3nFhFlGmcJ9B5BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/exuuzW7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+TwHqrAttCfFG+3qc3g1jN/349MhoLRUPiham0jGWbUfsKf
 iT4/QJr98De7neDbtT7RQz+n3eCsTYVQd8WGOo/gCmPwKfJ5weSBkAfUyVMLtchsaceWjgCx
 lKP2dTzClRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf5mGa+xy9fzRjf5x
 mnSqDBk3u1Oy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:u0meYqsUTEVq1Br+ILGjn4VK7skCXoAji2hC6mlwRA09TyXGra
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
X-IronPort-AV: E=Sophos;i="5.96,167,1665460800"; 
   d="scan'208";a="84518218"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OF248NJTOSve8giP5PojGku29WpvepGNAZsPZ2JV2eA1rLzM9MsEWmFaoE0wXxV997jtr2yO0+D6jru2yPZrSGY49e918V4t0Ia8Sbj3s7iK+/Ql2NNviK/tCQfygDrj+0bpU6n+zefR3U3KFyYmBC0OPfrnBScMdwbdS+5KtykvSQZdKxCnR6EZSqSaTYeMMrXHA01qQ1k5koiflSqG0FhfzKfVk9OTt9lVAJRhS7BYwkj4m0WXX2ewL9/scLE1xfUuykp/I0o62BZR3SlB6YVlu5MKRkzGaaJ4Y79GgtJ4ExtYPvjJeOVzZxL0xQ1PvH8dVLJonqyFabcrw//K0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GQYNXHK42E8YwJZDQuJ3dZr4sVEb1T9VwXr3ouvMdc=;
 b=K46h1FerEnXIVwZI33aGYE1+1PMTo2s4jW7HXPVB1GX3TOnfyGeAKO22UoqNmSPR6OqXCGN9QxQa7jfHDM5PfLyuAKTyXFJdU16XC6zDUNzZak+25RvPsB0cBN+gmUHLgfsUsnWx71eQVKdcapsj5AVz+ZP7YPu8VGH2WndO349NJdpZFfF1ilhthJaH1vf/VuyIr8oPt93mmld4kXyoDj+x5JJGMdnaBRcnB6YxAMg9NjhahYGU36lwzhKd7zlVIzvZ/AA/JVSU/5IYhaF42s1Uvl6VZlsh25ElVO68LEAGhUXPKanA/yMUGdDmUV6ZOBOpdz+3OvcF5QFNDvpVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GQYNXHK42E8YwJZDQuJ3dZr4sVEb1T9VwXr3ouvMdc=;
 b=ji3JE9PIdPQo5mEK1hxFHhAs87k2oDxgt3g16XQAUSBA0LPJ4I9sZ27JNKUeTUEypr/ISOM4xO3wf67sy64bz1yAezh9D0zfp1Uk+/N5OGfGOnsGnk+Kf+Lm9caCJTinAoM5Pf8U3QzoWejpYUHTjIUzjliRaRQlvYujaG/3ikM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17] x86/spec-ctrl: Fill in whitepaper URL
Thread-Topic: [PATCH for-4.17] x86/spec-ctrl: Fill in whitepaper URL
Thread-Index: AQHY+HI5MxstOuNgcUuBZdmquEvEpa4/pLgAgAHHkICAAAOTgA==
Date: Wed, 16 Nov 2022 11:41:33 +0000
Message-ID: <3d47369e-c4f4-be4b-3695-c9df831adaf9@citrix.com>
References: <20221114214358.17611-1-andrew.cooper3@citrix.com>
 <780da682-806e-6ada-eadb-018579d0e808@suse.com>
 <AS8PR08MB799192FCA6B9D5B09BB6862392079@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB799192FCA6B9D5B09BB6862392079@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|DM4PR03MB6997:EE_
x-ms-office365-filtering-correlation-id: 6464c57b-5094-4461-be7e-08dac7c782f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lRi6yEnYxRvN6hnEVz/tF3UB+3k4didAk4B0+WtW0O7bgcILTw3tfrGvfoZc+mWmNewsc27Sac+MB/bqN1W8/feBsWo8AvJbXZWjFbjYSD0S1v79Rxaivj7sbWXKvewN0wenaNdCWv6xIxCS31vxiVv4qZMHsWMZ+SU+bQkF8UJS7ACXB6wPdhN1f3rNeGcwK4IBtYrGlOiE48+w3PszS1FDE7ledHb+G+GN4BhHDEkzqXQkPBPqWZHexP9+t7b0BtJUMd+GDO4HVZ87hJMHFCEPXJBKNemuw+NPlRaGll8rxYaX3kFsRIhdcmPivnzg6hkPIrhUy1tSyCdNWkYTkiVkrtVwtdqQDSALJZAJti4MjWx7riDfUmkhEvQWBfqKDzXxF8xkUkkEj7/B8jCUT/p5/PlH2VvYvGOV+b3IWYm6xMt+QeJ59m+5M946ByzQyZSUT2hLTpVEAHDlA4jCmqG5NsxMqnqR3fTiE4sLkpf9jwRU4rKXovGVRep4UnS8zR06HilY7n4Eckq9Z/4tz92L0seA3PDZPV1DMHTCYZEEoz/Y8pVSZ4IO5+UEK97jgLiMBr+/Y3HsyatK6/0qhv0WbHJJfvTzX718swne9aWr3rQwDjyUlC89eN35vI5uqKIg3JPAwUGU4xTQqxwPz/nKO+M817vw2ylGpMj8LcoGxgaXzDR34mCzylveIwm1fbUlJDVN70vwHdKjgI3T917Zq6oRg5bVUGeMK39Cv+BliaCHuVVCRMMzyqbT1ibLCBQq9NtRlqRH+2BPjMbvM+10fs9B3guHD1pBKRB++W+1PLkJsFSD8CYRFUs+RGQwIB9nYuYpP2Xmu+IakUAgDA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199015)(36756003)(31686004)(86362001)(31696002)(2906002)(478600001)(82960400001)(122000001)(4744005)(38100700002)(8936002)(38070700005)(83380400001)(186003)(2616005)(54906003)(110136005)(316002)(91956017)(5660300002)(53546011)(6486002)(6506007)(66476007)(64756008)(66446008)(4326008)(6512007)(66946007)(76116006)(8676002)(26005)(41300700001)(71200400001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUhZeStqZm90T1lsY0RIYWwyc1ZGMTVPc3hDdlRiZ09sMEdGZTh3bzA0VXh6?=
 =?utf-8?B?R1NlS1lIbVExM0FieTR5Nll6WWtFTlVCbTZJbGphVlYzU0xiUnloZlVMOFF5?=
 =?utf-8?B?cGlDYjJFUjFLeUs2Zk84MlhsQ2F1eFk0QVNFRDk4blRBZDVUOHZJZ2lhcE5p?=
 =?utf-8?B?d0E3YXlDRng1eWljRTV6TFZpZkV0THNBVDIrUTNob2xSZ2swT0NHQ3VZSW5G?=
 =?utf-8?B?Q2FhaDZKSFhMVGpGZWlKR0V1aEtmWjFwVjJrSDZBOXFpR0g3ZlQ4UGY2d2dB?=
 =?utf-8?B?aGRvVDlxMi9hVEw4cTNjbjMwdlRhTE11QkVzS1ZaNHNPWjVHd2d5K2Jmak5Q?=
 =?utf-8?B?NHpEa1YzeU5GeUd2bjlqUThRRnlOckFWaEJIT2cxdmplZEVLNDJXT0JuZHdD?=
 =?utf-8?B?Nm1xR1FpeUlXYW9uT2FEUGhhQS9iMnc5blBjMDkyL2tRcUFOdzJtZGtGZW10?=
 =?utf-8?B?ZlJ6U2RieWVZelcvOVY4UnJycmQ0Z3dPc21abzd4QVpZRGc2TkZMbnV1VG9C?=
 =?utf-8?B?VzNmV1RQWGU5TGxmamlNU3pNRVN5aTFBbjRBTXcxdXBTUDA5Z0JLT2pQREhh?=
 =?utf-8?B?a3RHS25wQW4wMDJxMy9la2tSZDh2VDRoTy9XVkNPNjR1dlpzTUtJUkdtampF?=
 =?utf-8?B?UldEZUdGYzNHYlRRcFZJM3pEK1Q4U0tPeGczTHVEMmVMR0wvV09MMVA4TFNh?=
 =?utf-8?B?dW1YVFZVOE5KRHNseC8vblhQbVBkV2k5UlVWeEZKRnRMWFgyT1ErWk5iSm5Y?=
 =?utf-8?B?NkZaTStkaFJkclVpR2RxWkFMZVU5SUhCdnRtR0g3TUkzSU9qbE5aYndOQ044?=
 =?utf-8?B?aHVaMUdnc0svQnlmNWxuY2dFSlBTdXdRajJzclQ0c2plbVZnaDgvNHlsOHdF?=
 =?utf-8?B?Y3NhRnRma1V1Sml1Z0tMbTAvRTNJTVBHdTV4VUhxSElOenpRNWFTWDlZT0Ri?=
 =?utf-8?B?NEdRMFRuNXN1WmN5WXYramVsbHVWS0tsRGFOVjJUVUtnSGNGdGJubzBaTFJ2?=
 =?utf-8?B?L1A4Rk5YZE5Eai9HMW4waFk4RkkyQzZyWHI1MjNxMzRvT2VQSHRZdmxORXJj?=
 =?utf-8?B?Y1RYN3JLR2NRMGh1U3h6c3dEbHpvOGlSMno2WXVoL1Z5bERsNzlKcUZDcXR6?=
 =?utf-8?B?ZVBRbzhwWDVRMWdGSkR2c01ma0N2d2gwZjBaTWsxZGQ4Y0pCdTlGQjNBQXFS?=
 =?utf-8?B?djZudFFwSXZ1Ymw5azJIMzgzSjJsQk82MGdtNnV4WFV2UkdDUy9NNXAwRyta?=
 =?utf-8?B?OTdaamlTNGYwWEVHR1lpM1FQcjlURUNuby8yWHhpd09ybitScUw4cCtydEJT?=
 =?utf-8?B?cjR4TG15OE01bjhWYmFueGNyTG9Od1Q3aWdzSVQralE1RXI2eTExdGJabGNx?=
 =?utf-8?B?N2JnZzk0OUlCbVEreXI0amlwQUpYVTE4U2t2V3hETlUrZ0ZGRGZVOVFUZTBr?=
 =?utf-8?B?MThmSTJuZGlTNkVuVG5zVmtkV2w0WGFUNU9EM29zdEdxNTcwbU1HMXJxaGNu?=
 =?utf-8?B?R1FzRkNibFRvMjY3T1p5U2pMdmdVaUx2dFkwVms0a1N2QUFMMTBnaHpFVGZB?=
 =?utf-8?B?V0p0dEljckJEQ3hKaXBTQzRRNHpUc1NRdFVvaDJnMUp5WnFuTGM1V0RhMy9y?=
 =?utf-8?B?cG1scXJWcXlZNyswUEFzZ2NhcGNTYi9aQ051V1UxQnNRRk9qVmQ2aE9WbHEx?=
 =?utf-8?B?UW4wQmtnODlSdzBzTWhwd1ZVRkhaNTl0L09ZTTdJa2wzZzVVdTMzKzYxSFBK?=
 =?utf-8?B?d3lSWkRZUjdlVmNjSzVtblZFZ3hNU24xVkRNYW14TGxTNlFuaHZXTURPTjhm?=
 =?utf-8?B?ZThYdlFKTnE2RVM5cGkyNzVVL215OUtlRjEvUFNKbW9GLytKQy81a25LcktK?=
 =?utf-8?B?Y0s0b2JCYUVLSW9vOUxhaXl0dmltKy83ZEVtQVZVSFdKZ1lsYWZWcUNLenhi?=
 =?utf-8?B?ZTdGc3RjdkF3SWN3QzQ2SnB2d1NBS1hXQnJhQnpzNUdmRXkrOUxWSzJsUi81?=
 =?utf-8?B?YTNkK0pvNmJNc2x6cUFtWHJ6cWtXUXFPZHJZQ0VYWmZlYWs4S3RFaFZ0dUZk?=
 =?utf-8?B?VzdzL28wRmNybFRMS1k0NklOSjY5WmR2V1J6MzRPb3p2ZFE0M1phY0ZFMW03?=
 =?utf-8?Q?HxVdavkhMGLdnb0+QEw7QKFFi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7479A6C0626F414EA0A21C088B1BDB88@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yUD2EaOV9CEVK/E8YwtN50WkISzTCsGLVdqGhebi2Itdr4So8Mks9TLz4GLc05zFJVIsXmi3xNDAgEsll39fPZN055/36w0/6FhNT3bCDc8iOPa6JRyOgGTJSE7Wju52KoXtls6oGAtyVm9dSwGRdoMX7nzHdePTQpNmSltB6CO7DlEYjeRpq3DxwnUYUdJIf6aEnUrAgXOO1hWeaBYMuusBX+j10wFAhBRujTxS0zsCNfkq2mbZU7KEiYqYJ2vQc8RvkbDS/DnHo8/zqGdDARG1tXinUV6aIHMTpthENakjzzVkc0DGSsLhr2k8QryJCfCS8wwjQWkOd87Txgp6VRgKAmJEDqv5yykwFmmHrgNLnsJWPNs8JsjocRlecPLH/Hnu5LQGlaaUm/x0CzhehBi9UYBlkw8Q+vU7AZhFC4FO60hwJOZ8fWFaCYE/HweP5x1D/ozQpOiJ4FccZ9tWDYPfQ0fwOPbMBOee2Jfauv9zQ/3iGGltPiUrn9qIDoY7dcQ71jHh+6g+rkrQpCbx861ez3DrBsuaoBXaZTBCdZkKPQq/qserYAOaUS5fchvPX6yKnfko8tSGDMXUFqX8nZBcKGCYdtFHXj9LZLCqsVbYw+JuKT4utxpZwPRxfH72dGwz9eftXqtXFMX4Q9Z9MPD8h6vQL/EeiVgrXexFhEwOwqdELAuKp/2oYVg6CH42iws+H/Kp4T81lNic2REP4Z798TYDwT/kxWZzy0PeCIbYS2i4TT0An+ZA/2KVrpQf5uf4eXNEubKm/RGlmcC+vPFDRHVSCJ1u30WvbFfQn/nsexsi3ydsq81oEuAG3GBnuNC+j9J+gS57c99g0+emyKN3MWSV7+JUCpM6QWNor1k=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6464c57b-5094-4461-be7e-08dac7c782f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 11:41:33.5152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MBmINBesqpyG22a9ib1BsKOc8W+lCbu7cvHWBopWNV1C/GQkbxSFSnq8NVgi/L6OZnN8Wv746mhIi3S9dyTH5UQhws/hS8//smEYKUxBfqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6997

T24gMTYvMTEvMjAyMiAxMToyOCwgSGVucnkgV2FuZyB3cm90ZToNCj4gSGkgQW5kcmV3LA0KPg0K
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggZm9yLTQuMTddIHg4Ni9zcGVj
LWN0cmw6IEZpbGwgaW4gd2hpdGVwYXBlciBVUkwNCj4+DQo+PiBPbiAxNC4xMS4yMDIyIDIyOjQz
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IC4uLiBub3cgdGhhdCB3ZSBhIGxpbmsgYXZhaWxh
YmxlLg0KPj4+DQo+Pj4gRml4ZXM6IDlkZWFmMmQ5MzJmMCAoIng4Ni9zcGVjLWN0cmw6IEVuYWJs
ZSBaZW4yIGNoaWNrZW5iaXQiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiBSZWxlYXNlLWFja2luZyB0aGlzIHNlZWluZyBzY2lzc29ycyBsaW5l
IGNvbW1lbnQgZnJvbSB0aGUgb3JpZ2luYWwNCj4gcGF0Y2ggIklmIG5vdCwgaXQgY2FuIGdvIGlu
dG8gNC4xOCBhbmQgZ2V0IGJhY2twb3J0ZWQuIi4gSG9wZWZ1bGx5DQo+IHRoaXMgcmVsZWFzZS1h
Y2sgd2lsbCBvZmZsb2FkIHNvbWUgbWFpbnRlbmFuY2UvYmFja3BvcnQgZWZmb3J0IGZvcg0KPiB4
ODYgbWFpbnRhaW5lcnMuDQo+DQo+IFJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5
LldhbmdAYXJtLmNvbT4NCg0KVGhhbmtzLg0KDQp+QW5kcmV3DQo=

