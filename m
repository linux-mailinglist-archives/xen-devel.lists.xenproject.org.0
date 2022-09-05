Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8B65AD03C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 12:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398704.639621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV9T6-0007M7-T6; Mon, 05 Sep 2022 10:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398704.639621; Mon, 05 Sep 2022 10:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV9T6-0007JG-Oz; Mon, 05 Sep 2022 10:36:40 +0000
Received: by outflank-mailman (input) for mailman id 398704;
 Mon, 05 Sep 2022 10:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v9Wd=ZI=citrix.com=prvs=240277b11=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oV9T5-0007J9-C8
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 10:36:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d395122-2d06-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 12:36:37 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Sep 2022 06:36:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5804.namprd03.prod.outlook.com (2603:10b6:806:fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 10:36:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:36:30 +0000
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
X-Inumbo-ID: 9d395122-2d06-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662374197;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uv2wUdVfPvpiScb5nREle6bDlPbjffGNPQ4dXabpOvM=;
  b=eWmkoqF8ooMnINKc7MQVh/xTQRTEMpk6AB7VGugsUuqDHvamFDk5qV4n
   SJHaXsTZd2/l5i8MvoBxtCx8eiyCMaYAzUBh7MCy9XCHpiawXzja5saXi
   vvkbOdHZf56n4xraaU3SSV7wDEneyc1EaTi7jN8uiOr195MnF02peIypF
   4=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 79459289
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vv31ha144Yx2+yfa9vbD5TZwkn2cJEfYwER7XKvMYLTBsI5bp2MOz
 TcWWDqFaPyJM2T3LdsiOYW2/UJUsZeEytYxG1Q+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrS8E435ZwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6612Dl0WepEAxsRUIT5/8
 vw9ECAjaSnW0opawJrjIgVtruIKCZCyeak56jRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2ym5KmMIwL6WjfNfD2z75Qp9yrXydvHSfcSHX559lUeEv
 GPWuW/+B3n2MfTAmGbYoyj814cjmwvRc7k+L6Cd3MIwhR6B6mk5AUcVeguC9KzRZkmWHog3x
 1Yv0ight68p72SwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQK2
 1mTjpXWDDpgmLSPTDSW8bL8hT+8MCcaLGgGZAcfUBAIpdLkpekblA/OQNtlH+i6h9rdGDfsz
 jTMpy87750Rh8MW06Sw/Xjcnimh4JPOS2YICh7/W2uk6kZzYt6jbonxsFzDt68efMCeU0WLu
 2UCl46G9ucSAJqRlSuLBuIQALWu4PXDOzrZ6bJyI6QcG/2W0ybLVehtDPtWfy+F7u5slefVX
 XLu
IronPort-HdrOrdr: A9a23:2UXgzKgSk0lYXCRw86TnVnuiTXBQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.93,291,1654574400"; 
   d="scan'208";a="79459289"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nv3JyM3aOAIV21PpRFuwt+IY4qcsH/p6n+dATNwL060tVT6X2N8iV1dZPikSqPP0NAlubVrIc5i2ev/to+/jGRRAsgdkGLHVxS+jDzbOH4ri3XZu6EesZUrDf/1QWupHRfl7tuXW6sfnXCXo2A5EDby5N/N/2noGHq45SST/tkR4ge+bBvxzmceGKIog2rSyjvMEK+PYTEFKw2+ZxWqR8vF2nH9h0bKKmbVejmSpxH2NrbJ4YlXQ34TG5Bpw45aJ98+/S8Nk+QfbYCmDe3qMsLO3XrpiafmZ2GHMepUcISsNcO6HJh9fjiHbuM0u+6MUQoz/5626OvYIIpspd4WK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv2wUdVfPvpiScb5nREle6bDlPbjffGNPQ4dXabpOvM=;
 b=l6SX0L7IckAozV+8FBIfZWP+9Uwt+o3J8W4dPxBiB8Dm3KXIO5pb3mLaWUNdqlBkxT2WmZ8I/988m5IkfYcpKCteDwo489Pq39vYQVR8LUmNy2qsdGykD/h6SEixdPBZDtih/yQGG+7nm5jf0xGYiuoHKRczGdCLA5cfFOKkqHj9uVe8XsPok3Wo4AC6MbzYag59MrWOL7Yp6xW8U7IgBnFE49+KexgabnKI3pq8Cj5dm1fifehLqxTL25YwiSZ3jPGYZxT3KPr31L9iiVkJf/zVc4VGv+9zXAaHQl9DWcvP8o+A3Az0N1tVgbXBKECldooTitN67mDAUdwtE2u9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv2wUdVfPvpiScb5nREle6bDlPbjffGNPQ4dXabpOvM=;
 b=pWuolGU0ESKR6d66DlkPE9sJ7AW/yUR/NeNqKpfR0J7ZBqsVJYXwL73hiPoT6STHYUSf70WJv7drbZ2IuibnFBeGKug2hb/CLDAcNBjEqgU2mB8NQRcU8F6YBIa7dBttjK27dBfJlRMls021xgZcs+WZ60GSwquM3rQ7sOrrGOo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, George Dunlap
	<George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Gao Ruifeng
	<ruifeng.gao@intel.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4 3/3] xen/sched: fix cpu hotplug
Thread-Topic: [PATCH v4 3/3] xen/sched: fix cpu hotplug
Thread-Index: AQHYwPUrmwAE8kE4eUqry59vQa94Aq3QpM0A
Date: Mon, 5 Sep 2022 10:36:30 +0000
Message-ID: <8272d775-d8d8-b526-4e39-0d75ff2b5f92@citrix.com>
References: <20220905070005.16788-1-jgross@suse.com>
 <20220905070005.16788-4-jgross@suse.com>
In-Reply-To: <20220905070005.16788-4-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b0807b9-682b-4409-ac51-08da8f2a7f08
x-ms-traffictypediagnostic: SA2PR03MB5804:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6k3r+x5ifLVUoN/bVE4CsmX2OKh2GM09GS9HNBIrpqzImI3ERgYSJmJeNkdXKuYkqO6zH8r9HoPgF+WRjJyPi1NSLDEMbILkO/W/p9vciqX6ZSLX6KqQlrG88hFaD3Htx6dUw/GRTTrU7kzx5bHfGRwUvOM3eFKxalkTP5T9WNMsNn8Vit75bumbifHvPU+hayuJNzP5wAhX+9EoRffphoTAz1C/DpRCYXQctMgB1EZRuJdxkOuCw2lPJfyQbWM16rgElnNtIddGZf8qCKa+oImajfn9GnMaTEazBQq+nns4pG7ccbs2EArf9sKJ5sGirhjw0tHqtNEXTEvWtuX0am/DYkAFBVsaZi3RYye8uJxB24qyLnsQ6R53857q2onVjqRzHo9Iu9m67Tr7qAusuPc/vLQzyorxWV6w7uh1TnohR4tnokbIyMerpe+uEBorXIxuI37zRt2y9LAY4uN1Ed6WNCdc4G9Jhm4v7KuIw8tP42+hB74XiOsojLOBErVqwcLSCwGawc/5OLA6wBj925IaArphfCmxi4i0DVSzkDWjiJASK449iB8maBp9zf8+LWtpcTHrPf5gOViRmf9Xe9UBbAxxFUxcENzmXNE+ufKlmK9B0REpLQGF+boivX3u0TR3V+wVNQIoMIYNHH2J14dwWhy5EwJ82qo6VWaRMdkmlZyskVLxPvoEdDS+PF+yljifydBINgq04SUDgzXgyKFTNxbOlYoATtHsy/gO+Js+lJcady9haUs2lv2Y2ll6QRAYBcFSqMT0c0iR6+DCaaJCCAggHVFzIS63BQ5bPm0uZg3KRl62mWe0vEUmuim4CHBv52HJfnAoZalOSIkJKA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(36756003)(31686004)(31696002)(86362001)(66476007)(76116006)(8676002)(4326008)(66556008)(66446008)(66946007)(91956017)(64756008)(122000001)(38100700002)(38070700005)(82960400001)(71200400001)(83380400001)(2616005)(26005)(478600001)(6506007)(41300700001)(6486002)(316002)(54906003)(110136005)(2906002)(6512007)(186003)(53546011)(8936002)(5660300002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3gwOTJnT3lGOEdCYkg3YzFDSVZaVVhHL0RnMlEwTnpKelJSVTkrK3hzWmFi?=
 =?utf-8?B?MXJJK1dBdU1yWnhrc2t6OUVXNWYzaEV2b3NwZmQ0TmpMYnBmamtGY0dsaWJ2?=
 =?utf-8?B?akxSajc3SzhVdGc1K29NWFhYaWYreUFWZU1iWk5HSXVwZjdSS2ZLN2JoeklC?=
 =?utf-8?B?ZFVXMSttdFpGSEI4K3ZzL3FqMDUra1RtaGgwUjNhbk14YVRBMytjQml3SWs4?=
 =?utf-8?B?dU1GdFJQdWpleHdzUStYdDlDeXg3cDMzWjNlQTIvcFVmaHRlcFJwREppZTIy?=
 =?utf-8?B?eWVkK3dCZjdWdm1kY25WamF0bzBRaEhycVhZeDNoaFY1MHREdngwUTVJWkFF?=
 =?utf-8?B?MnR0eGFFdERZbnpreEFJTFR1U2lNdXlab3RCRDRqbEZOZkdzT3JFOGZVSXh3?=
 =?utf-8?B?UFNCbmhaS0xmMk9Lcjh3TGFFSFZrMHc1a29YcFVMTzZDNHpMYkpNZjEzeXdV?=
 =?utf-8?B?a1VPYXkxN3pwNS9HK3BHNTZDL2x1MFoydVg1aTRWNUpHQ2ZWTlpxbS8xa3Fs?=
 =?utf-8?B?L0t4cjBMS1NCUGJhWXUzb1lTdWlhbTZCWlBYWHpUSTR4RkZreEsxVi9JU0hw?=
 =?utf-8?B?YVM3RnNYR3pyQ3Zpbldzdm1nTXJ3Z1k0bGVSbVp2OTVKYWhESFVHWFRsVnFK?=
 =?utf-8?B?azZPSjJvUllvNitMZ1NqdEhpbFN1S3NPZnJtdVZEamRSZ1dBZmtXaWxjM2pY?=
 =?utf-8?B?VTgxOWI0a0YwaTB0RElBQmdPZVcwMzc0QWNwa2UxODdkd05BUzB1RU13ZjFN?=
 =?utf-8?B?RCszd05mV2RmT2ZvSTk5cGlPMVNqa0R4SVNxd04xaitua0t3QllybmlYanBL?=
 =?utf-8?B?WGhoSXRySDhEY252VEl0ZTJoaHM4cDFzOGV6cDc2VWRVUGh1WGhOQzRMalcx?=
 =?utf-8?B?TFJOdzRIajk2eElxY0U5VWVSVlBlOHRpK2F4U0FvS3RYUUUzV3o1S2ZLd04r?=
 =?utf-8?B?bkxjTytRVlZ5WFpMUjZCOXJodkNsK2cwSlZGSVc3NDJ2NjV2SXBtRTBuUit4?=
 =?utf-8?B?MVlLN0pidDAvT0xtU082QTNMYm9iTE9FUTZ1NktkcTZNbXkra1BFWEVVcDV4?=
 =?utf-8?B?Sko4azY5djFBNkl4Y0IrOGVpYWRNZU5uLzc5QnJLN3pHV09NYUR4VVFHZEVw?=
 =?utf-8?B?MkpUSm8vRzhUcnRGVzJEYWk4eU5WY2FYcUUzcklNNEZWdVk5eTNPdGt6a0p1?=
 =?utf-8?B?VURXSUFQTENOZ1JDM2FrSlFQVkhqY1EzdFdFNW03Wm55TFFSWTlrWkJJOXBD?=
 =?utf-8?B?MlZsZC9HY3pCT2E5amVDNWMwT0drcmNSMkx4WVJvamUzRm9OZk5WTzhFTCtM?=
 =?utf-8?B?M1AwQ0RpWklOSHRuZmpnTVViNmtDMnZnSGlrdUdId3RzOXlxRjFHZnluWlN1?=
 =?utf-8?B?TFhJOVRjanZXWjhVQXIzdWxOYlZkT0FPakdLcTloQVRMMHpzTDVpSG1JdVZ6?=
 =?utf-8?B?MzZpVnlzeGJvMFdIRzFPZFFHUnVaTGNKeU1JdEVVT3RoZzhrc1Y3U1V5N0Fk?=
 =?utf-8?B?MUp5M1BvSlZWVHRRVWVGODNMK1ZXY0tMcTlETStyRGxaazYzSnUwelM3enlN?=
 =?utf-8?B?b2ljR2xXaE9meGVxNXZmVnpXWXprMkw2V1hkdkk3WnNTY3hJWU5TUkRvbmZZ?=
 =?utf-8?B?QU9UaEU3dlJONTE5MlRuVnJSS0w4OFVLZDNkdzRISUlBdnE4NVRUb3A0VHl4?=
 =?utf-8?B?NjJZUHBTd1lnNUdvbkpnbTNXZzVLdUxENWEwekpHTUpqdGVqYVJTZ0RZV1Zj?=
 =?utf-8?B?SitEVUpiRVpxS1FPc1VhSTk0MlVLWW1LOHVrcjlMZmRydSt3Vkg5dFJjR0RX?=
 =?utf-8?B?elRlMXlKcUFHZGFDS0RKMDFORFJMVlZmYXRlSlJyZTlRTE8rZythZjNCd0F5?=
 =?utf-8?B?NktjRmM1c1Y1UERBOW5pTVlsTEJxaXBFMnh4MUdLRXFFckpiS0FzY092dk9X?=
 =?utf-8?B?dzM5M2piOFVPQW9RSUVJZ2NzQzBOelZnVDR5SU9oUGNySkI0d1VNTk04dlR6?=
 =?utf-8?B?V1p1aVFEV2l4YVlKK0Q0cklLQ2tQUTJjZ01rNlBQcm96QnVGc2xPLy92R2lp?=
 =?utf-8?B?MHlndnNneW51UEwxb3FReUw2L2thOUl3ZmRWM2h5Y2xWQy8zQkYvWHRyR1ps?=
 =?utf-8?Q?/0LEQuL665AS4bqytVKy+pjmQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30C964D35E26F247BD08B3BA37BA5706@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0807b9-682b-4409-ac51-08da8f2a7f08
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 10:36:30.8394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6AQrlfNrQy3emqL1+JqORPMwWowjXK6IONutOCsdM5mi8LwNQSe66ttQBB3BzS83b/UPdzeV8wQiBVVCw1P6Rhh7bQRvOAiHAmEFloM8bLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5804

T24gMDUvMDkvMjAyMiAwODowMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gQEAgLTMzMTIsMTcg
KzMzMjUsMTggQEAgdm9pZCBmcmVlX2NwdV9ybV9kYXRhKHN0cnVjdCBjcHVfcm1fZGF0YSAqbWVt
LCB1bnNpZ25lZCBpbnQgY3B1KQ0KPiAgICogVGhlIGNwdSBpcyBhbHJlYWR5IG1hcmtlZCBhcyAi
ZnJlZSIgYW5kIG5vdCB2YWxpZCBhbnkgbG9uZ2VyIGZvciBpdHMNCj4gICAqIGNwdXBvb2wuDQo+
ICAgKi8NCj4gLWludCBzY2hlZHVsZV9jcHVfcm0odW5zaWduZWQgaW50IGNwdSkNCj4gK2ludCBz
Y2hlZHVsZV9jcHVfcm0odW5zaWduZWQgaW50IGNwdSwgc3RydWN0IGNwdV9ybV9kYXRhICpkYXRh
KQ0KPiAgew0KPiAgICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc3I7DQo+IC0gICAgc3RydWN0
IGNwdV9ybV9kYXRhICpkYXRhOw0KPiAgICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0Ow0KPiAg
ICAgIHNwaW5sb2NrX3QgKm9sZF9sb2NrOw0KPiAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+
ICAgICAgaW50IGlkeCA9IDA7DQo+ICAgICAgdW5zaWduZWQgaW50IGNwdV9pdGVyOw0KPiArICAg
IGJvb2wgZnJlZW1lbSA9ICFkYXRhOw0KDQp2NCBpcyBtdWNoIGNsZWFyZXIgdG8gZm9sbG93IHRo
YW4gdjMuwqAgT25lIGZpbmFsIHN1Z2dlc3Rpb24sIGhhdmluZyByZWFkDQp0aHJvdWdoIHRoZSBz
ZXJpZXMgYWdhaW47IHJlbmFtZSB0aGlzIHRvIGZyZWVfZGF0YSBzbyBhcyB0byByZWxhdGUgbW9y
ZQ0KY2xvc2VseSB0byB3aGF0IGl0IGRvZXMuDQoNCkkgY2FuIGZpeCBvbiBjb21taXQgaWYgeW91
J3JlIGhhcHB5Lg0KDQpFdmVyeXRoaW5nIEEvVC1ieSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0KDQp+QW5kcmV3DQo=

