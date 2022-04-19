Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D0250729E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 18:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308353.524062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngqN1-0003Ln-MO; Tue, 19 Apr 2022 16:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308353.524062; Tue, 19 Apr 2022 16:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngqN1-0003IJ-I5; Tue, 19 Apr 2022 16:06:27 +0000
Received: by outflank-mailman (input) for mailman id 308353;
 Tue, 19 Apr 2022 16:06:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mThm=U5=citrix.com=prvs=101c57682=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ngqN0-0003ID-Bi
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 16:06:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7cb405e-bffa-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 18:06:24 +0200 (CEST)
Received: from mail-dm3nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 12:06:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5432.namprd03.prod.outlook.com (2603:10b6:5:2c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 16:06:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 16:06:19 +0000
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
X-Inumbo-ID: a7cb405e-bffa-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650384384;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=K18yJa0mvn0c4nvHjp2+PMA/6b9XrRtukNIp6LQK1tw=;
  b=hbRTPPUSeEcKp/3xlYWt7INgnqesU+swzufPYOx1EWTk5GtwEgOxE2/T
   Rmx/vtjSQpnFan9qabC7Lr3ay80w0S4StvsGnXWLkOBxW/Ra5/Mf2QxfH
   5JTcbcDBRgPv/oGPK4MsT6z6Y+ncBV9ofqQQ9kMkK2VztR3UlEZo2slZW
   A=;
X-IronPort-RemoteIP: 104.47.56.42
X-IronPort-MID: 69827412
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DFaEvqmPwQ55eMQ1vvWT2X/o5gyMJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbWDvTPfyCYjD1KY13OY3kphkAsJbRyoVqGVZt/n1jQSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWlLV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYZgV5Ban+vcUhWTJmDTpgZYJ685bBPi3q2SCT5xWun3rE5dxLVBtzEahDv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXu5kEhl/chegXdRraT
 +MfZSBic1LrZBpXN01MIJk/gP2plj/0dDgwRFe9+/tnuTePlVYZPL7FOdyLV4KzQdpuuW3fg
 1za83jFOkwTDYnKodaC2jf27gPVpgv5V5gVD6aQ7eNxjRuYwWl7IB8cWEa/oPK5olWjQN8ZI
 EsRkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yx6QG2wsXjNHLts8u6cLqScC0
 1aIm5blAGdpubjNFnaFrO/I93W1JDQfKnIEaWkcVwwZ7tL/oYY1yBXSUtJkF63zhdrwcd3t/
 w23QOEFr+17paY2O2+TpzgrXxrESkD1czMI
IronPort-HdrOrdr: A9a23:0mqUwqrnENkdanKNPTPxAjAaV5tyLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcYtKLzOWwldAS7sSorcKogeQVhEWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZe6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInNy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0WVjcVaKv+/VQIO0aWSAWUR4Z
 7xStAbToJOAkbqDySISN3WqlDdOXgVmiffIBSj8AbeSITCNU4H4ox69MNkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pXVFZ9l/1owKpuKuZIIMs60vFULM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpT+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQOHl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7hSwlgF/NKQgF5vsul6SR4IeMNYYDGRfzO2wGgo+nv+gVBNHdVr
 K6JI9WasWTWFfTJQ==
X-IronPort-AV: E=Sophos;i="5.90,273,1643691600"; 
   d="scan'208";a="69827412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lp05NfTjYpMiUH6j+qBrSQIgr2IiREwQEnH266DKUL8PAmdRB8f++uIsSca219efwWPZxDI3dlFnwE9g2Ov4dv8BbNI3fEtjhHMmBJi4E3q/f7l5d5jBUCVzu2Ry4hyCrpjIeuBHMTyfpZvk5aeMIFsi+G0HYTdDCUSnJmDtUk0A0SyU8KYh/8wgTG7oGCBJ5iSRYKi94U25KikR95HytppzoEuOUV0Y5CaO38FcyzMZKwTrQ9eAaj2sXGaEhVWIPKCBgJJO4Z87d+3T6dpmlr46aGYe5c1l5MScQX6tUop4KY3DkozZ/6irZxFz78Hbit2IlR/Do7X5WYuhvDowRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K18yJa0mvn0c4nvHjp2+PMA/6b9XrRtukNIp6LQK1tw=;
 b=h9EyQWjlkFKZQRHzspMsh3bE/0MyR0to4OVAlhMgup4MsG21EhzmwrHV5XZnzm8QPEJ4a7BvFfoWiOIhY9d5JkNLfoOJgfYZ4TuJZvrif12A0RQgd5LnvYLPMQjYzBpdgAr17iTNYk5PcxnS84kLxizpjFRtPwRw8duNz8wtjFuZFhaD4fFs0NlmERO8A219pIVUZN/2su6/Lsvk+z1Cw55XILiOZE9LRN7rJtFviWsoeb7FeufRMcdg5oiUnKh2P8+Mq3+858vYMajMy3CsJkN7/POh8QjUeO0uFETcDpHqlBneQn4wGweLFpnoPUmCU/hr2Zdxva59NtQJICBS1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K18yJa0mvn0c4nvHjp2+PMA/6b9XrRtukNIp6LQK1tw=;
 b=s4JticngbjWhp/SKFpERPGQRKgowjVDcEM63AIN4Gg6AXuorZMW/ofwH+OK3aygwGDESegq2X4NTSovZrHHQQigqzqCP0x250ugTIwg9sK8ebnQ8x9p9tKQBy2s4RZxL6w/f+ABqq9jZjtx50Z1X/d4Nm43QNNNWyGgz2n2GTYc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Thread-Topic: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Thread-Index: AQHYU9FUwjuogeCS0EWgGeBVFIanqKz3Yk2AgAAA74CAAAPwgA==
Date: Tue, 19 Apr 2022 16:06:19 +0000
Message-ID: <226afabd-ea07-dd60-474f-c594d7468de3@citrix.com>
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
 <8a8aa0c1-e6f3-2dc0-77d4-282af89f4ed6@citrix.com>
 <bd446b5b-49ea-3d6f-6792-7d785586ea69@suse.com>
In-Reply-To: <bd446b5b-49ea-3d6f-6792-7d785586ea69@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4217271-ee60-490b-6d94-08da221e8a92
x-ms-traffictypediagnostic: DS7PR03MB5432:EE_
x-microsoft-antispam-prvs:
 <DS7PR03MB5432718D4C671A78FF7A827FBAF29@DS7PR03MB5432.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 waTVcWdtQNGLKJQxxrm+2bfNuX10XyIVdpvVB5RF1G3zBzfQpYrGfMgdPHGe8RfTjAplgbgfkbjJ2RIrh0evb8gx4D6GrxJS1WPWcdQGuyZBmjtURIMzDWSPeLgCxFWHcZAvoL0Sp/kk+HNnqwDew3pp1lh0zFW5asWLqu7olAZpLLkpDM3rK8qpLZhLdwDqfpbBfNYOKNR4wZiD/e0QNK1RnMMbcVzGk1mPoszrN7V7j2tIph63rInvxIkEBf1/sh2P02et9ijPavX4bMbOuEoiTZu045ZRRJ6IbTrsvoUwtCdhKp7/Bom2fYNaAlxRboCKzB9/mLgAPXkm8Lp2yB4xlK6tzxVVu4hr89JvAIlbXtFtKrnPSixJZTiA/u5+wQTAPDtCKvkFIEVYpqV9EJ8N5G2PsLVpuhr5ZJHlP/ydC/kwv2tanZyIROvAM100TSykahGV6fNU0ZG0efhCcarStgU2vQKTO59orUEVVuvmzhm3BcdgPU2OFLg7U2wggrMV1bXv+xVfaWPdui/m7UrWuu4gs2M9rF8KUKhwavasjTKf/hWzlIPrTyFixzREejekYkyeaWNz2ZltFkKIz4puSLvulJ2xEal1Fo9k7UoNUp8VpXmioUhzIpwdNGzBUD2Tr8LMcaVwHVTS/NcJwrGQeI06Aibj/84LXnJ63AKG7QTXhH6z9BhUO6tasEkke7rkoKe6XvKA/Uj0D4Nzy7LE7f2JnNg3V9pRcCHu2qOLkMrl3AOT4ghJbUtTBaaD6c1YvqEiXVlm/Rawuv3hcQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(53546011)(122000001)(64756008)(5660300002)(83380400001)(2906002)(186003)(6512007)(6506007)(38070700005)(86362001)(31686004)(36756003)(82960400001)(26005)(6486002)(66556008)(316002)(66946007)(38100700002)(66446008)(91956017)(76116006)(8676002)(4326008)(110136005)(2616005)(66476007)(71200400001)(8936002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bkZHWWNKOFNaWlEwYm1VSjY0dW9SUjlKUG9nUGVCR0JhNDRBWVlMTVFvaWpl?=
 =?utf-8?B?ZnA2Yjk2Tllkck1nWHUvYVlwT29QWmcrNG1McVNGVkJSNFN3TXpTVWxDUkQv?=
 =?utf-8?B?NE14NjZoNzBWdThVcEJNVGE3a2tQWlJ4UlU0OHRzV1NQTU1hTllTK1hrcVFN?=
 =?utf-8?B?N0dzRng0SzR3bDd5ZGx6Ulk2bnpyRmFCeEp0QktkdGRwR0VVeGxiRjNXdXJS?=
 =?utf-8?B?UnhkYlFXMHA1M0hSVzg0amZ5dHcrTUxvNlRVSDB4NzRmMjE0aHlzaC9WcFNH?=
 =?utf-8?B?VldRRXpuWnhydVg5OG1iYkFjbll4L0MxZm1HbUlmK1ZtODFnNXQvaXJZeUtz?=
 =?utf-8?B?emt2UG5FNkpNUi9GN2Y5Wm5UUE9vMG1HQ09zZ0VOZjNJRTNUcVFPbGVKaFAr?=
 =?utf-8?B?SDZOOVdPRXplVFFxTm9LWENqckVpdlBvUGV1dGFydmdtbGF5L3U0S29nUXpU?=
 =?utf-8?B?QUUvRFVBMnFSdkdwTWtQd0RaK01Bd3hDL1BuTSswOGI3K2M4b054YlNOaXFn?=
 =?utf-8?B?QVA3QVVaUnNFVmdsRWxBallTWENGVFlqRllRblBXcmgwODFNeWdLV3IrUVND?=
 =?utf-8?B?eDQ4R2UvRU1rZFNlWTRrSXVkdmZ0eVJRYVdCanJ3eU85NldXTks3MU9BcXl6?=
 =?utf-8?B?V0FpRjF0Vy9vTlVTS21OcVRwRG1SSFZoYlowUXhXRXhpMDN3VHVOQ0xBNDV1?=
 =?utf-8?B?VDYyQzcrcVRrRGhOYVkzVGFhbW5wSGdiOEpYQlNUWDg5aGN3dlp0M0NobEcz?=
 =?utf-8?B?VU5SWllmNEtJRHhVbGR3dkZTN3pVKzZxU25Cc2NsRGNUcUhtQ3NleWtxdTd1?=
 =?utf-8?B?ZEdRVW1YR3RMeWE1ellvRTlZQm9Yc3VBQ1VmWFhhdGF2dTd1eWFJeUZGVUov?=
 =?utf-8?B?R2tsaFcva3B3YVl6WEdYV3h4Zk1MWGdMMTNNTjJnV2RGS0EzWUVsb0FlSGlB?=
 =?utf-8?B?VmFIeTdWOGV1dEdGSU1vcGgzdHlDNGVEM2F2dkR2T0hldFdLRlB4c0dpRU5v?=
 =?utf-8?B?eVYwRnJWdm82VHEvVFFRVE42OFZJTFhVOUIzb0dUK3QzTVRIOExMMFViRUFl?=
 =?utf-8?B?cjJSVlJoK2pxK3JtandUTTJPUlNxeG00SzdTbWw1Vk8wcWQrZ29rRDFCTDRJ?=
 =?utf-8?B?M1BoR0FTbks2OUhNU0JxRlhYSWFORGJSYWh2cDdBd1JyMFJVUS83RXNDVGph?=
 =?utf-8?B?U2hXSDloSk5iN1YxN3FBQ21uRVB3am5scUNIbHRJNmY0M2lpcXBvSnhMbVhS?=
 =?utf-8?B?OEJwR21xWkYwTjZCMDc5bzY4djdpU01YbCtWbHlPNGRpV3J5SFBzYmRweW1h?=
 =?utf-8?B?RGZwS3VJR0lpWG5pd0N3djdHS3Q0TnJtY1ZrSGpvNURDdW5CSlBSUUZyVlFT?=
 =?utf-8?B?c3VpTmFwTVpWc012b2xtY2t0ZVQrSlRzeGpMWi9Qa2RyQ0JYa01EQWNBbkFy?=
 =?utf-8?B?bE1lek5ialpRUkp3U2IreDEwNEI2Sm9PZ2J5NXMycDlTM2lhWGdsUlNWWTJI?=
 =?utf-8?B?MGRJQnhndVhmbndoZUduNmFsTEV2UnZvclk2M0V3R1JHM2c5NHA2c1Z3K1d5?=
 =?utf-8?B?OHA3THZzems3QSt2dUpGdnVEZ0RLNUVZNEQzU0RRVUF6aWh1QURIS1BhRjBn?=
 =?utf-8?B?WXNSWGhNSmhUZFZIdTdKMWpxNm9WSU51VUhGZ25tM0Z6VGt5V28wcFltVGtS?=
 =?utf-8?B?R0lLaCtiMGphMDVybktTTzA5a2dGdHBFSUdSdzl1NVY1Rk5ubWg3cjB4ZVhB?=
 =?utf-8?B?cGIwbW5rMzdpMHgyWkpxRTlFR1dhbk80bDcxZjdwREpha3RmeVZZNElxNlhs?=
 =?utf-8?B?aUxHenZmb2l6eEFmSUh3T3pFS01vK0Jzd0dHbXE5WU12MjdWWTAwQm5LdkNF?=
 =?utf-8?B?WUQvUU1WdnVPVG9jY1BlZ28rQ2RiSEM1QTM0MmZIQXJmbXg3SnpDSFQ5Q3A5?=
 =?utf-8?B?ZzlYbi9HN1J6VGhFMjRsR2w2blJFNjE4UDlSRjJvS2RiUXVRM1ZIdFZOdDVE?=
 =?utf-8?B?MDY5cnBNK2xVZVpkaGhyUHN1M0gyQktheDZXN1lZRVBTRnUxdFhnRFZsV1dM?=
 =?utf-8?B?enEzeis1NTU1dC9nQXVVcWZTVVZ3bTVHb3BaVzFWNldpT1Zyb0hGYVUwOHU4?=
 =?utf-8?B?R1BNaHNJUS9KM2xtMm0vb3RydjZmOVlNM1I5K3NoNjRaY2htNVIyUGtvalhi?=
 =?utf-8?B?bVJZVUhsS1B6QjcwQ3pWOGF0THdyNFZpc3A4Q0hZRVZOeUFwdXhKS3ppMlNF?=
 =?utf-8?B?V1ZJVm1vWWN4RkxhNWNJMzlMUUdVZEg0NkV0TnYvbGtZMzBMc25NbjZXUVRx?=
 =?utf-8?B?YjU4dFlqSUJyQzFpR3k4WjlHQk82OHNoODdZN1VKUzh4bWljMndGV3RCL1JL?=
 =?utf-8?Q?HyflKUSZRbMIJnzQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CA53AD6387D1F449412174C54FD4C4E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4217271-ee60-490b-6d94-08da221e8a92
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 16:06:19.4936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xn7miA+I50OvsMwcLDtW9Pbw96scI3b71JVEgtBif6YZoThkF3flAqFKmX+aFDHu+Mv7dHv/xLDL/DggRMc7fp4EVExXrZvp3dL/Bn4AjLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5432

T24gMTkvMDQvMjAyMiAxNjo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMTkuMDQuMjIg
MTc6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxOS8wNC8yMDIyIDEwOjM5LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBCZXNpZGVzIHRoZSByZXBvcnRlcidzIGlzc3VlIG9mIGhpdHRp
bmcgYSBOVUxMIGRlcmVmIHdoZW4NCj4+PiAhQ09ORklHX0dEQlNYLA0KPj4+IFhFTl9ET01DVExf
dGVzdF9hc3NpZ25fZGV2aWNlIGNhbiBsZWdpdGltYXRlbHkgZW5kIHVwIGhhdmluZyBOVUxMDQo+
Pj4gcGFzc2VkDQo+Pj4gaGVyZSwgd2hlbiB0aGUgZG9tY3RsIHdhcyBwYXNzZWQgRE9NSURfSU5W
QUxJRC4NCj4+Pg0KPj4+IEZpeGVzOiA3MWU2MTdhNmI4ZjYgKCJ1c2UgaXNfaW9tbXVfZW5hYmxl
ZCgpIHdoZXJlIGFwcHJvcHJpYXRlLi4uIikNCj4+PiBSZXBvcnRlZC1ieTogQ2hleWVubmUgV2ls
bHMgPGNoZXllbm5lLndpbGxzQGdtYWlsLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4NCj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9pb21tdS5jDQo+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUu
Yw0KPj4+IEBAIC01NTgsNyArNTU4LDcgQEAgaW50IGlvbW11X2RvX2RvbWN0bCgNCj4+PiDCoCB7
DQo+Pj4gwqDCoMKgwqDCoCBpbnQgcmV0ID0gLUVOT0RFVjsNCj4+PiDCoCAtwqDCoMKgIGlmICgg
IWlzX2lvbW11X2VuYWJsZWQoZCkgKQ0KPj4+ICvCoMKgwqAgaWYgKCAhKGQgPyBpc19pb21tdV9l
bmFibGVkKGQpIDogaW9tbXVfZW5hYmxlZCkgKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gLUVPUE5PVFNVUFA7DQo+Pg0KPj4gSGF2aW5nIHNwZW50IHRoZSBiZXR0ZXIgcGFydCBvZiBh
IGRheSBkZWJ1Z2dpbmcgdGhpcyBtZXNzLCB0aGlzIHBhdGNoIGlzDQo+PiBwbGFpbiBicm9rZW4u
DQo+Pg0KPj4gSXQgZGVwZW5kcyBvbiBKdWVyZ2VuJ3MgInhlbi9pb21tdTogY2xlYW51cCBpb21t
dSByZWxhdGVkIGRvbWN0bA0KPj4gaGFuZGxpbmciIHBhdGNoLCBiZWNhdXNlIG90aGVyd2lzZSBp
dCBlcnJvbmVvdXNseSBmYWlscyBub24tSU9NTVUNCj4+IHN1Ym9wcy4NCj4NCj4gV2hpY2ggaXMg
bm90IGEgcmVhbCBwcm9ibGVtLCBhcyBpdCBpcyBiZWluZyBjYWxsZWQgYWZ0ZXIgYWxsIG90aGVy
DQo+IHN1Ym9wcyBkaWRuJ3QgbWF0Y2guDQoNCkl0IGlzIGEgcmVhbCBwcm9ibGVtIGV2ZW4gbm93
LCBiZWNhdXNlIGl0IGlzIGJvZ3VzIGZvciB0aGUgaG9zdCBvcg0KZG9tYWluJ3MgSU9NTVUgc3Rh
dHVzIHRvIGhhdmUgYW55IGFsdGVyYXRpb24gdG8gdGhlDQpYRU5fRE9NQ1RMX2dkYnN4X2d1ZXN0
bWVtaW8gcGF0aC7CoCBUaGUgcm9vdCBjYXVzZSBvZiB0aGlzIGJ1ZyBpcyB0aGUNCmV4aXN0aW5n
IFhFTl9ET01DVExfZ2Ric3hfZ3Vlc3RtZW1pbyBjYXNlIGJlaW5nIGNvbXBpbGVkIG91dCBpbiB0
aGUNCiFHREJTWCBjYXNlLg0KDQpJdCB3b3VsZCBiZSBhIG1vcmUgb2J2aW91cyBwcm9ibGVtIGlm
IHRoZXJlIHdlcmUgY2FsbHMgY2hhaW5lZCBhZnRlcg0KaW9tbXVfZG9fZG9tY3RsKCkgaW4gdGhl
IGFyY2hfZG9tY3RsKCkgZGVmYXVsdDogYmxvY2tzLCBiZWNhdXNlIHRoZW4gaXQNCndvdWxkbid0
IG9ubHkgYmUgY29tcGlsZWQtb3V0IGZ1bmN0aW9uYWxpdHkgd2hpY2ggaGl0IHRoaXMgY2hlY2su
DQoNCn5BbmRyZXcNCg==

