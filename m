Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182DB577FF8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369551.600986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOCO-0006Ks-FL; Mon, 18 Jul 2022 10:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369551.600986; Mon, 18 Jul 2022 10:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOCO-0006It-CV; Mon, 18 Jul 2022 10:42:00 +0000
Received: by outflank-mailman (input) for mailman id 369551;
 Mon, 18 Jul 2022 10:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDOCN-0006In-3x
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:41:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dea0783-0686-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 12:41:57 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 06:41:51 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6609.namprd03.prod.outlook.com (2603:10b6:806:1c8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 10:41:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:41:49 +0000
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
X-Inumbo-ID: 3dea0783-0686-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658140917;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9aPR39BjsIXpC3oY56oqxK1fFSdDx3DNYMzk9a7Vygk=;
  b=U2kfR6pAIfL1o8A6DrMsnAm7yLisxmijt6pJ46qby3xtsZLviaEMPvnA
   zgIZ4Qi5x3tTGr1nkiQEl8cZqT3H7G/f4tsX+2yt3+uFS4uLo7vKyUGe+
   HtZfmN8nqFlSual4uk9qC2Jfgeg1aH2IjMPdTyVla8Gh6FBslAEBh1ZMt
   0=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 75321633
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:u/CWkK3a/c16/yr7PvbD5c1wkn2cJEfYwER7XKvMYLTBsI5bp2MFz
 GtKCGDUMqyNMTeheN11YNmz8UpS75SDmN5kQQBopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQXNNwJcaDpOsfrc8Uw35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6+lcHAYWGN1Ew8NID2Jw+
 vkjCRYsdinW0opawJrjIgVtruIKCZCxeaYg4DRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2Ce5L2EwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPCkmDcrCn37gPJtRjLYIErOYa+yt9rqkaq5WM2JU0qCWLu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslgEYc8pdFas98g7l4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9WopWm1876VqXa3JnITJGpbPyscF1NZv5/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:aaTp46kHW0xOfaRDbpyZQuNShyTpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duv22vaIJy4EUbICbQhGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="75321633"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxYk+NAe6xJVY/w3NPHBXO0SG7ScbufxOWn88ExUYbnJTUqXGtfXDCC6EETEOsu+tmBG0acRMdc/1uYMdmd+OcJUq7h4wTW/MisN8HhriF7MQYrBRBlLjwrDm5G/ZrfjwPNOcusqtESXkmG2Qa2r0UR2Ch1F1b4sPbfMeDKXt7cqv+rCQp8ycSHRjjBHNszY2pmn+6/bNuRO7gj/drbSm6QjQfyBEMJITy4rnDFpLhJrYSxq/MESw6Ph/mjuiafk1c9tIPw8dPyBcTmAxT/kcB8T6oPxJVmRTfP/jPj7jq0TloNW0ZyJ1WQ1CrR5Bxk8sM5on2Pz5x0lxVJFm0lmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aPR39BjsIXpC3oY56oqxK1fFSdDx3DNYMzk9a7Vygk=;
 b=RAPG/95y2WLyorNIpHbz+5WWdozQXrHqgkCH7Z7Y+hc1RnqLecydnilxJjbLxl3VyVwYs1OelJFU320iC97v93hgXhrbfeKTTO6xZVoZu6+yNH840WNqrKg9szY8E8GylgvZX7MjI2A+4MbKJ0ZOx12BShtZeVn7GS1uYxeOzD0b6Nkx7Wo0nPAfgySE7ZN8kG0i6V1aS2i2vTrA5z5Hk2osch3Inc6gshq53WfLlbBZ4nxVs0ZtLpJUDrf1kQbJuNSW4WuXJnNk8lx/+v38ulyyrcPCNKPX2SFaG5YJG7tpJGqlyf2K+PYjmupBygAN1jHnn1Agm+Lqs6S/vZkCkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aPR39BjsIXpC3oY56oqxK1fFSdDx3DNYMzk9a7Vygk=;
 b=StqcAeBi7RI5lI9LYJGhZbCte44ieGbTtlYpxJFR9N/boNoaBb0o1K2oerAKNemc/IxflIMlLkz4qLYKdZghwmNpSBY9YO3V/w2MDKyouIqoaQjMYkBtbCxF6JjiSN1uXV92pE1PtrgYlI3RrLyjHKPJJOHb+vUnNBUKGDCCyDA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/5] xen/wait: Use relative stack adjustments
Thread-Topic: [PATCH 4/5] xen/wait: Use relative stack adjustments
Thread-Index: AQHYmnakulieGT4u2UqPhEJd4RhrIq2D7XmAgAADkYA=
Date: Mon, 18 Jul 2022 10:41:49 +0000
Message-ID: <45bec79b-f065-eb98-b4a3-3be6d4b7e674@citrix.com>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <20220718071825.22113-5-andrew.cooper3@citrix.com>
 <68555ada-e769-9565-4224-b543c9e71098@suse.com>
In-Reply-To: <68555ada-e769-9565-4224-b543c9e71098@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5014d839-b08e-4540-9a9b-08da68aa1e9b
x-ms-traffictypediagnostic: SA1PR03MB6609:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 38b6Im38tdJ5okbkMTlJQhB4BE9lh9F2MgjHmtZYCIr79l2q6GN+i5T8boYMgOj/GKltQHwHhyE1pTJzqE3DW7JlWCcoKpSbQ41OHQdU+rRXnqCtKnyORswR+sXsSLkPzrbspQcEEk85vfCD97qxST2y/5XhnQx1bYDbmCiotiyMAKNz0LFPPyl/jGs74RMmT75L1m46NPkTkHRcEqKxGvMlAM1OwWMUXh0NVbQgr3xgPIE45xJ93BXMbe0aLuzvI70LdWZPmx2fhU/oT7NDU9Hbr95B85Whx8lLbqakgkMAO2Zwwl6QyxbgvV8GSmFB1J5nMfFf3jBYneaDc/95xY6GmaVYT6coEPy4Cl+8SvS/oC1DIBO60M1UfyAkbZW6Ib5jVTpMreScEObyfTdIZnmt0iuI+3wqnZXJhn6aLO+QGglL2joPE+CNmm4YUv2lRzQRHZ6dTmY6faHDEFlCoHyK8g4SYHyg4tRloN4XENjQ20n3GVhmMM7OzLw1aaZv+i6BbtSc+nYf5W3hhPYo9kAJB75QmzHqV19LbBnE0VGdX4ox2fS156lq5SKvI67xuocS2U0D4TDbA+86ostjQQTusLFaQ1oQL2lZAqbIRTDsFMc0Y7etMpKGa+hHhyocvQtX0g2GuvaryS8JOZO8GeZ4piNwZN26gHVNVQ5cJ6UfVe9cc+oeFcgJYYkslv2C1JROw/94sWwEFq/2fCLfQwPWCIDZ+6w8xNe9fVbEExXPiRtDnzJu8TVaOH/5RSASMvzLQVWN2kG2q0zx6NDtnJHOa1nt0p8PFBxPxmm7dUjCfXa7db3OUHc+II/EYe7XMOlC+GNy0+pLrF6V8hKKSAx6mV6jKJ2d0Of/Cj8T/sV8gAUxhEcS4wkFW/dhtor4A4OvIhg69fmzTBMOxUWBgw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(2616005)(186003)(38100700002)(6486002)(478600001)(122000001)(6512007)(91956017)(966005)(53546011)(71200400001)(6506007)(26005)(41300700001)(64756008)(38070700005)(66946007)(82960400001)(66446008)(36756003)(4744005)(8936002)(2906002)(31686004)(5660300002)(66556008)(8676002)(6916009)(54906003)(31696002)(86362001)(76116006)(4326008)(316002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0dRUmVhY24xS1RHZlJmVjFyaS9vMFRvZGdQR1VGSENVWU5ubS83clN0RW9z?=
 =?utf-8?B?eDZwSTZ2ZVBwNGVkVm1DbEIzUkk2VVJDZEtWTnNQU2JSSlZHd3FPbkY0a1Jv?=
 =?utf-8?B?UHRJNEZMdCsvU3Jsa3kvZTZJNS9oakZ0eGxRT080ZmJoSlNqaEdwNjdYbkpj?=
 =?utf-8?B?YlhFbVZNamtac0YxbUVzQ3ZxM2M2aExNNEpPMm9lUm90T1ZObkNaR0FiNG53?=
 =?utf-8?B?NSs2NVRxVmFFNGJhMkR4Q1licUFLNEgxT2Y0V29sUk1UNDBiQTlTSmpxSEpM?=
 =?utf-8?B?R3FqOXZHZGhZbEd0VHBOcGlHYjdPanhjd2NyYjQyd2psc1p6aURXbkZFV2t5?=
 =?utf-8?B?ZGpNS1ZZUnBUUGpnV2RWd0txSFpTUms4WHBmbSszQUhFMERJQm0wTWkydnBS?=
 =?utf-8?B?c01zaEhwdm1hODhUMyt6ZnIwRzUraXN0dzVhQnlIeTZ4SktwNm1qWThCVkY0?=
 =?utf-8?B?cnJEcUp1b3RkYVhQaGN5aHlZUkZwbXN4STZVNFBXaldlN0c2Znd4L0o5UTRB?=
 =?utf-8?B?bGRTOUx1V01Hb081MUJpRUJPU1ptVUZaUFRnaWFuaHAxdFZyaXJiNzdub29s?=
 =?utf-8?B?eDJZc2Y3RlhYcE45aG1pejVKNk94NFBqR2J2QnYzNVhaakJtNmhKVFV4S1R2?=
 =?utf-8?B?OGE5Yys0RjREc1lBZTZ1Q1UzZ0RxOWs0S2RBbGl4ZUhLZENMWVFqV0s4ZjVP?=
 =?utf-8?B?RTRVVHRyeGw4S1lEM05rRnNmKzFSL05NcFNNTjdqL3RZcE5UNUlTcEpibFdS?=
 =?utf-8?B?UWtwb3JDeTc4UWFSOU96a2tkRXJsM2M3WmlRbTU2SFlrbDMzRDd1WTVuSHBO?=
 =?utf-8?B?ZGdCcnFkaXA2L3lwbnREWndMVDNyTU1SUWhBTW5OaDh3RmdkQVpLdkZidHBU?=
 =?utf-8?B?RTFNaW1IZXZTYWdabWg1WWJZZXQvSmJjc01NcThKZm1rM2ZKS2FsOHpSRXFz?=
 =?utf-8?B?WE1IVkRUbG5WTWpkbGFFOWVBeEFxVUlhZ0JHaVIxVlVrL2NmZEpGRTNsMHFm?=
 =?utf-8?B?R05VdXhqS3ZmOHJIUGkvUEovbGRXZTZDQVAzMnhXcUU4MVo5QnZINyt4TVBn?=
 =?utf-8?B?ZnNudyswU1UvYnJLYlRzaG9vQmxzbDZlYko0S2FnLzJpME5Nb1o1UjJzYVF6?=
 =?utf-8?B?akkwWXBXMXphZHovcW9sQlRtRlpOcDBhNVY3azkyL2x1ejJEOXJmR21VYldu?=
 =?utf-8?B?MDZ5YTVvQzloNzczU05ERzM5U3JnbFpwQldnVDg2MXNNNENQSEROaStXajNs?=
 =?utf-8?B?OWhZbklKK1djdDZybUUxTGk2aWhkZHJmMGtsdEExNFpMU09CalZrU2ZMTjA0?=
 =?utf-8?B?cnVCRTVET2J1VHQvUzVyZm8yYWlueUQ3MUp4eTd6OHZDQjJtYW94aUc3cGRD?=
 =?utf-8?B?Ly9QYjBhQmhxbmluTTdPZVRRSlNlOVljaUx2TWU4UlRYSEJCSDJFQnMwZjlW?=
 =?utf-8?B?MlRTUEpLREM3VXN1N0FzdXMyVTFYaDlldXRydWdxYytlMGE4ZHlELzN6NWll?=
 =?utf-8?B?Q0p1cnlRSlM0VCtacEpIOHg3cmMwZFVUMHdyK2F0c0R4Sm5GSVF1aHZ3RHpD?=
 =?utf-8?B?cDhGM0hpR2ZwaGFaMmlGTUtsRHpqOFNPTlprZW4zVFdIa1JjMWFFV05oK0JB?=
 =?utf-8?B?eWRXRlZ4VTUxSHI0eHlZMElJclpGdXBBMUxuY1dIa3UrblFhN1lnSFhQL3hL?=
 =?utf-8?B?UEp0M2p5WXBuK1NkZUNTclQwYVlQdSt4UmI0MWFpTjRjd2s1V2xkVFI5b0JV?=
 =?utf-8?B?NFNkRDFEZ282ZXliQm1KTDVpTjNVU1hSUWVacExydGYxUVNLREgvZDZuWXVv?=
 =?utf-8?B?byt4Z0dYZnBBMmtjV2Zqb2dSKzBVV1NWZDNET0dDN2UwdXNkK0V4WTd3QWZ3?=
 =?utf-8?B?S3V5R2N1MkJQL1c5NWwzWTBYQjlGUFFpOFZtNXVZbk4yT2NSaUdjZmF2Vjdn?=
 =?utf-8?B?RzV5a2s1bGNJeFJwTUJUcW8va0hpNFlRdFJ0RWtJSVFCS2xUYkVPczM5RndB?=
 =?utf-8?B?Y1NkRHUwUkpYZGk3SVh4TW5QSndUZWRTU05QdERCVXNXbW85S1pGc0pzMnN4?=
 =?utf-8?B?anNrRlFEdkViNDNwL3orNU82ekNnVFlUQ1EzQithQmNBRElvcERsdXRqWkVF?=
 =?utf-8?Q?WDNN6GpucTty+F4eLV/JjHW9Q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E64302FA0DF2C48B65E7BF303B92161@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5014d839-b08e-4540-9a9b-08da68aa1e9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 10:41:49.3120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nEU12KfvhRFAebq+HhpQ7SLUs6yWyGwF+k4q0VHTkJOtUkGcCeQPF9Zv1MI3FQVLJvLOXxNJ939OQHNdj8Ed5q+Oig9QxjeCX80+Tkc7KOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6609

T24gMTgvMDcvMjAyMiAxMToyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE4LjA3LjIwMjIg
MDk6MTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAtICAgICAgICAibW92ICUlcnNwLCUlcnNp
OyINCj4+ICsNCj4+ICsgICAgICAgICJtb3YgJSVlY3gsICUlZWF4OyINCj4+ICsgICAgICAgICJt
b3YgJSVyc3AsICUlcnNpOyIgLyogQ29weSBmcm9tIHRoZSBzdGFjaywgaW50byB3cXYtPnN0YWNr
ICovDQo+PiAgDQo+PiAgICAgICAgICAvKiBjaGVja193YWtldXBfZnJvbV93YWl0KCkgbG9uZ2pt
cCgpJ3MgdG8gdGhpcyBwb2ludC4gKi8NCj4+ICAgICAgICAgICIuTF93cV9yZXN1bWU6IHJlcCBt
b3ZzYjsiDQo+PiAtICAgICAgICAibW92ICUlcnNwLCUlcnNpOyINCj4+ICANCj4+ICAgICAgICAg
ICIuTF9za2lwOiINCj4+ICAgICAgICAgICJwb3AgJSVyMTU7IHBvcCAlJXIxNDsgcG9wICUlcjEz
OyINCj4+ICAgICAgICAgICJwb3AgJSVyMTI7IHBvcCAlJXJicDsgcG9wICUlcmJ4OyINCj4+IC0g
ICAgICAgIDogIj0mUyIgKHdxdi0+ZXNwKSwgIj0mYyIgKGR1bW15KSwgIj0mRCIgKGR1bW15KQ0K
Pj4gLSAgICAgICAgOiAiMCIgKDApLCAiMSIgKGNwdV9pbmZvKSwgIjIiICh3cXYtPnN0YWNrKSwN
Cj4+ICsgICAgICAgIDogIj1hIiAodXNlZCksICI9RCIgKGR1bW15KSwgICAgICI9YyIgKGR1bW15
KSwgICAgICAgICAiPSZTIiAoZHVtbXkpDQo+IFlvdSBjYW4ndCB2YWxpZGx5IGRyb3AgJiBmcm9t
ID1EIGFuZCA9Yy4NCg0KT24gdGhlIGNvbnRyYXJ5LCBHQ0MgZGVtYW5kcyBpdC4NCg0KJiBpcyBv
bmx5IHJlbGV2YW50LCBhbmQgb25seSBwZXJtaXR0ZWQsIHdoZW4gdGhlcmUgaXMgbm90IGFuIGV4
cGxpY2l0DQppbnB1dCB0aWVkIHRvIHRoZSBzYW1lIHJlZ2lzdGVyLg0KDQpXaGVuIHRoZXJlIGlz
IGFuIGV4cGxpY2l0IGlucHV0IHRpZWQgdG8gdGhlIHNhbWUgcmVnaXN0ZXIsIG9mIGNvdXJzZSBp
dA0KY2FuJ3QgYmUgcmV1c2VkIGZvciBhbm90aGVyIGlucHV0IGJlZm9yZSBiZWluZyB1c2VkIGFz
IGFuIG91dHB1dC4NCg0KaHR0cHM6Ly9nb2Rib2x0Lm9yZy96LzR2V1A0UEtjNQ0KDQp+QW5kcmV3
DQo=

