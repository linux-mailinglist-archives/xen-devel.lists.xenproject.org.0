Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A23859D656
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 11:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391791.629753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPx2-0003MP-Uf; Tue, 23 Aug 2022 09:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391791.629753; Tue, 23 Aug 2022 09:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPx2-0003JN-RW; Tue, 23 Aug 2022 09:12:00 +0000
Received: by outflank-mailman (input) for mailman id 391791;
 Tue, 23 Aug 2022 09:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuKU=Y3=citrix.com=prvs=227d21510=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQPx1-0003JF-FN
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 09:11:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2cf728e-22c3-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 11:11:58 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2022 05:11:54 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6708.namprd03.prod.outlook.com (2603:10b6:510:113::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 09:11:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 09:11:52 +0000
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
X-Inumbo-ID: a2cf728e-22c3-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661245917;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=E/m2I6xBZvRox4xjVSfCYzSg9b/+dz6bpNHpW3VQyKw=;
  b=THM9bipKw/Pzn6jqNh5YMJG4xIjp2gbvn4D+ca7axPD8TwcAzk7Pl7j1
   hW3KYvqZcD2J3M+9y0ODh/GMt0VpiI7Wvcx2o2L4Uoa16dCPjn+4hqGci
   fkCYi3BgmSN6fJLBAGlaYAM5DW8yEl9v6hVSNBy6YW+LlVbMALevzPNhH
   w=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 78692427
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5kAw5qKNAGx8tSZUFE+RyJQlxSXFcZb7ZxGr2PjKsXjdYENShT0Gm
 2EZCDiBPqrcYWL8Kt1xPN+x/RhUvZfQzdM1HVdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/LZ80s11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE3vs3JR9rM6Ih2f9pBFtLp
 NIVdTBOYUXW7w626OrTpuhEoO0GdZOuEKZB/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H11z+mLW0wRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPPl2vfrijz7gPJtX64Z5scPbyHzcZBgx6/2XU3Djo4cFTu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslgEYc8pdFas98g7l4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9WopWm1876VqXa+PHYTJGpbPyscF1Jbs5/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:UV7PuaNLrmvaiMBcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw6zvmWehTNYd3E8LAs27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.93,257,1654574400"; 
   d="scan'208";a="78692427"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QK0gZ3Lg6CSYt667CaPwCr5n4ppyom7g6h479rE6DYpKtQTSrzVoi+kzFflL0/PxbzLmEbruPPAOE6zTFAxMJOuqFen9GPahmYb6fru+AlLz8HP6Uiuj3YYOK6w0UzzoACnFtBAZYzxo7nZsiJYwVfOEcb07mnUDwBt/uzPHbC2VHaIzfRkpBfWuEQhuB+J21KiEBTL5A5QpFWPEwS39lERDjm7GSNfWO5jH/AvmcBvjfqh7Wp/FAASQ+BfhbU2N4cl75yj64rxqY+EIn/m1WBaa8Exm01imbliuwCXBqGZ1W5KscSBxGENRQvBkpIvkUf0vXWjNLdmzHEC4gjr7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/m2I6xBZvRox4xjVSfCYzSg9b/+dz6bpNHpW3VQyKw=;
 b=gVvkc/8v65OBAO4nfkctAth0A3qMhheIN6FKxwHtGuhKinE0nKC2yvC8gUhRnaBGk+7tdca6U50TYPs6tmaUZdXEG+ohLrt3ksoo5J8jyYPuSSa1eOv4uCYPu/neMn4iJVFPXsXUmEFQ9V4AA1dcYHOCJiYXfYhCDVA3837BokeyOKUorm9kWeOARgordYMUixgL6zpuYNODzclI+4eB6Kd//mPcTNrC2bGNlu0Z36H829Ej4+dj1x366zf1QqNBxJH/uexV7qSho+NluISWRS4nPgh4+WBH+PrFNchgU42KSWeEo8eBe+lnqkGD6dh+2bBqTFLhy1hf9lB2XHWw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/m2I6xBZvRox4xjVSfCYzSg9b/+dz6bpNHpW3VQyKw=;
 b=Z9DHw1DZRdUYRSD4wqs9MBxFQYejN4UahqXSqkm5WSxPXWn0ao9gLlWnDCOQLbx23A3HDewVoqw+ZeAptAZisWZGSn8SksJ+7W2nmdCtYphxqC93iJf2Nahh3Qg1X9UkNMx/NPNt6zLM34HHV3cAd06HtpjBrF3+Umx4vWFHHQQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jane
 Malalane <Jane.Malalane@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/domain: Fix struct domain memory corruption when
 building PV guests
Thread-Topic: [PATCH] x86/domain: Fix struct domain memory corruption when
 building PV guests
Thread-Index: AQHYtm55VD5gh57AFES863M73+ue8628FP0AgAAe6QA=
Date: Tue, 23 Aug 2022 09:11:52 +0000
Message-ID: <b9470a27-9cc3-2d12-194d-59f7260dcf9e@citrix.com>
References: <20220822213036.21630-1-andrew.cooper3@citrix.com>
 <1dcb2390-e15d-815b-d63d-527628bd939a@suse.com>
In-Reply-To: <1dcb2390-e15d-815b-d63d-527628bd939a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 715e8bca-5fb7-40d0-fc38-08da84e784ec
x-ms-traffictypediagnostic: PH0PR03MB6708:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KZOianU0TljfJd9GcqaRVw6wNQAi2BPubGh/WwdEU6oR9d/1nRxgfnanz91cvWXG0ZIGl3PCoFoF6Kuby4U7Gz30YqPZJg+2xTHwQG4vFrj3PBjwWt49Y+0rMHdD5cQHTp3mqNNzQ7p09zT8uwLA+UOZyGqDpKf/LVpwbpe57caiQjmE0nH1aMU+iGPUgIRkUhjNHaJJCHC3wGF+lipAR4/JUKImF40WmW0andsegcCo5VXlIx+BsZ7yEoB54iVbop9NJpsSpZ+KNe3n3yMss+ZuyHiS4goYiP0q4Nxgk5yBl/sZs2Rkgj7C1VBvYXfQZFZNud9ZEAtpxrtBohKkhDhPzazPuyuyMcaezzXjh76TT67hVn+BaHYfQlHtEaPjO4YroR6VJBbbIAqpfzsP9+ny1ePS/All4BSCzpUBTCy3zWNzYyLV1SA1Ku1Fid7pYigXU0tPaKq/owwfdmvdoF3F1lUYUre4I0E6iTbpAxBWBpvkblYB/TsePMAZgV+2+hzvT+8GrWORAIDxV6d/+EHfOLEV0gVBO4k68NK8VEn9KJUbbknYMDN7RqMa0OQ79Inq7WwcChQo5cqkg3fQY7teW6xzoaBa6//qBY3tEyRCb+0yW9FSFdaOH1cZ/gxhoJG+pnHSOqAtv+CBhZZ7dmV+iSYbWcuMTT9BjRW7bCf2yOZldtmfUKGu+/kt6yi5KSemPmgaRFmHT2BwIDurb6qNlrMzBqEu9muB2AV/hVluH6HsmteCMDSsAZXwCdRLKXXE15ESXzSQtlDp3rgLz7P8nvhVpJ4x02QnJjDf2szjHnl56zHRucChmUhM/YEJpeGcrqmueQkOKN3Zzbhgtw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(6916009)(36756003)(2906002)(66446008)(4326008)(8676002)(64756008)(8936002)(5660300002)(31686004)(66556008)(91956017)(66946007)(76116006)(66476007)(316002)(54906003)(6506007)(53546011)(41300700001)(6486002)(478600001)(71200400001)(26005)(6512007)(31696002)(86362001)(122000001)(82960400001)(38070700005)(38100700002)(2616005)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ck9kRDZtVk02eDZJUGsyOEJsQ1paT3ZLcFRpN215S1VWU01KUWpseGxxYnB0?=
 =?utf-8?B?bTR2eklTcFVWaW9la3QzVzdLbVVZRWczd3pNM0lhQWNIRStXcDRDNllZZTIv?=
 =?utf-8?B?SDhkYThoVjAwZk5FWDNmc0Q2RkFQZ01oRDZNS0w0aXVtanQySVJ4UGY0TlRt?=
 =?utf-8?B?QmN0U1JWc3Y0dER1c3lKSWlKMHlYQnhNUyt6cndtcm0zbWVDRnNUQTMwSTVz?=
 =?utf-8?B?UXBEMEFseE5qMVltRGJnNHRURnc0dEhURGFCK0l2M1NkbWVBWG50SFBOVTlO?=
 =?utf-8?B?dUxYWDhoRC9IK2orVmk4Y0ltWHl3UjVVQjJxbVA1VTkxQ0dBY3RrK2UydXBx?=
 =?utf-8?B?cEY3RXVmclVtc1FsR21XTDVUNFN1MWFvQWZIQldFUUtiVVM1MFZjdmhlc3lS?=
 =?utf-8?B?V2ZrK2Z0WmV2M3J4RC9jUXMzRVJPWXVGVkw3UFdSZUQ1VkpsREw2N3J5U2Vl?=
 =?utf-8?B?YzlrR3loaUp4SVlxT3lGa2lVUHdjRjdGWXM4QjVYZ2R1SEFlNzQ1RElBbWpM?=
 =?utf-8?B?czNyWkhmY3VtYWd3NVVzWXdxY0lnM2V5R25MWGpjUTd0RVV2OU15emFVT2lu?=
 =?utf-8?B?QkI4V2Zxb1NDZFZUNzBNQUk2UFZieUZ6U3kxdkozWmNnNEJpYVM3RFMwVFdq?=
 =?utf-8?B?MDJwZDV2Q2s1aGdtY2d6SUFOaHlMaGQyTFFHSHVXU2MvYnA5WC9YKzVCQ2Vt?=
 =?utf-8?B?aFhhZnJVYS8zN3M0ajhVdnY5ektMTmRnK2huYjZmRkVsWGdUcTdTamVhdnlQ?=
 =?utf-8?B?OGV2dVkwZjRrY1BhcmlKaGpBTWxuQTlDclMrY3QrV2lYZjdTQ2pnRVRQc2VY?=
 =?utf-8?B?QTZQZ0ZpdTJyL2N5KzA4cFhHa1dvY1BrZ3JaRlh2b2dWWkxFY0c3bjdwdkVP?=
 =?utf-8?B?dmJEVzRzMERJbmp3eTBkVm85UnlXK1NKbzVhaDhOVnUzR0Yvbm0rc1pZajVL?=
 =?utf-8?B?MlpjSHlKKzdCanZXbXNXS0JHdzBHcFRSR3VMOER1dTMzYzROcmplekx2Ulo3?=
 =?utf-8?B?enpPb3hkUWh2ZFYrY3JlcU5HemNBN2VaRGpmcEtqQVQ3WVdRNSt3ZzdTODFO?=
 =?utf-8?B?TkRLMzhxQTlpR1FyV2gxdmtON2YxSnAvenVpRVhLVW5HWEtNUE1nRmNwVE9R?=
 =?utf-8?B?TDVIS2RTZlNlN2tFUVJiVHZ1S3h5MC9QVHlZeEVhVThZa0ZLWnRSOUUxV3dT?=
 =?utf-8?B?M2tEME5LSGVETlMzMXI3Nk1WUTBMdWNGWXVKUEgxbERpOHRoV0dVZ2FoanpF?=
 =?utf-8?B?QlEvREdQL2ZZYklNb1V4RUw4SmNmN3lqMFQvQ2FNQ1dGeGNsbDdrVkxhY0Vl?=
 =?utf-8?B?dDdpVmh5V1VRQXhPQjFKQ2ExY0VzamtPUkFOMmNGUlp5Zk0yRzdGckRoMWJF?=
 =?utf-8?B?b3pKN3A2NUN4YkZzSkZRRDhuQkZVS2ExLzlJNzlxWXUxMTBPR1hQZHEwSEdw?=
 =?utf-8?B?R1hTaHRCdExGWEF1Y215MktHb01OdHc1dnlWU2YwVmxUTmtIUStneHRiUjhJ?=
 =?utf-8?B?ZUR6dFdQKzk5QkpnK1c1bytxbXEvVC8yNjJFS1hMUFdScUlaU2poKzF1V1gw?=
 =?utf-8?B?dUZUbUsva0drUm0rY3Q3V3JhQmNLWGJncXZ3andhMWQzOVVQeCt5TXdFTG85?=
 =?utf-8?B?YUNIcDZFK2ttbWFOU3FoclhZbHk4TDY2SmVCTXJiclFVRHB5NTJJZ0VMOENB?=
 =?utf-8?B?YUJYMHBBVVBVOHdlQVB2MEVmYlllSXh0ZFhZVk9CN0t4Um1hbmFtRUErWVc1?=
 =?utf-8?B?M3BPbWticUtvVCs3Ynk0WElHWlBGVVE3WVBVY0NWVGV2QWdRcDBZNloxdStY?=
 =?utf-8?B?RGp6dVFiTFBzSmhjWkpPRzk0L3hjemVSRE4wbTIxQXhwRTVjdkZWUzZlVHo4?=
 =?utf-8?B?SWNWU3ltcjE3VFpTWDA3bzMxbjRSU3ZuMEZRV1dPN3pNRzVscCtVeGUyOG1s?=
 =?utf-8?B?QjFrekdGUGhtaGtCRTFLVXZBNHB1M2tWR0dyNitOdUVMRUhNeDFvbnNIVkxJ?=
 =?utf-8?B?ODBGR1Bmb1BtSCtLS202T3RRWGk1dFFDcitTV1NOYytVOVEvSS9UM1FCbnBh?=
 =?utf-8?B?akR5TDVHV0JzZUtqNjVmSlN0NitqRWpBVytuUjg3VE5aYmNZZThoaFJXSDU0?=
 =?utf-8?Q?2fqJwM3YhPwuo6KOWMAobjiuX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE5B6966D7B8B3449322DEA4BBD3BE78@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715e8bca-5fb7-40d0-fc38-08da84e784ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 09:11:52.8156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAG1e2uNYdyj5GWvAB7Xtyr04IVsnrCgMR2Q52sz+4j9g+gCX+8T9iJhBrwGmuIJFION26Yvv3rXOc3Q29SWsDZXn2v1Th06raidql1a13A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6708

T24gMjMvMDgvMjAyMiAwODoyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIyLjA4LjIwMjIg
MjM6MzAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBhcmNoX2RvbWFpbl9jcmVhdGUoKSBjYW4n
dCBibGluZGx5IHdyaXRlIGludG8gZC0+YXJjaC5odm0gdW5pb24uICBNb3ZlIHRoZQ0KPj4gbG9n
aWMgaW50byBodm1fZG9tYWluX2luaXRpYWxpc2UoKSwgd2hpY2ggaW52b2x2ZXMgcGFzc2luZyBj
b25maWcgZG93bi4NCj4+DQo+PiBGaXhlczogMmNlMTFjZTI0OWEzICgieDg2L0hWTTogYWxsb3cg
cGVyLWRvbWFpbiB1c2FnZSBvZiBoYXJkd2FyZSB2aXJ0dWFsaXplZCBBUElDIikNCj4+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClRoYW5rcy4NCg0K
Pj4gVGhpcyBkb2VzIG5vdCBmaXggWGVuU2VydmVyJ3Mgd2FsbCBvZiByZWQgZnJvbSB0ZXN0aW5n
LCBidXQgSSBoYXZlIGF0IGxlYXN0DQo+PiBmaWd1cmVkIG91dCB3aGF0J3MgZ29pbmcgb24uICBU
aGVyZSdzIGEgcGllY2Ugb2YgcGxhaW4gUkFNIGluIHBsYWNlIG9mIGENCj4+IHdvcmtpbmcgTEFQ
SUMgTU1JTyBtYXBwaW5nIChhY2NlbGVyYXRlZCBvciBvdGhlcndpc2UpLCB3aGljaCBjYXVzZXMg
SFZNTG9hZGVyDQo+PiB0byBzcGluIGluIGEgdGlnaHQgbG9vcCB3YWl0aW5nIGZvciBDUFUgMSB0
byBjb21lIHVwIGFmdGVyIGZhaWxpbmcgdG8gc2VuZCBhbg0KPj4gSU5JVC1TSVBJLVNJUEkuDQo+
IFdoZXJlJ3MgdGhhdCBwYWdlIG9mIHBsYWluIFJBTSBjb21pbmcgZnJvbT8gQW5kIGRvIHlvdSBt
ZWFud2hpbGUNCj4gdW5kZXJzdGFuZCB3aHkgWGVuU2VydmVyIHRlc3RpbmcgaXMgZXhwb3Npbmcg
dGhlIGlzc3VlIHdoaWxlIG9zc3Rlc3QNCj4gaXNuJ3Q/DQoNClRoZSBzaW5rIHBhZ2UgaXMgYWxs
b2NhdGVkIGFuZCBpbnNlcnRlZCBpbnRvIHRoZSBQMk0gYmFzZWQgb24gaGFyZHdhcmUNCmNhcGFi
aWxpdGllcywgYW5kIHRoZSBWTUNTIGlzIChub3QpIGNvbmZpZ3VyZWQgdXNpbmcgdGhlIG5ldyBz
ZXR0aW5ncy4NCg0KQVBJQy1WIGlzIHN0aWxsIGZ1bGx5IGRpc2FibGVkIGluIFhlblNlcnZlciBi
ZWNhdXNlIHRoZXJlIGFyZSBzdGlsbA0KaW50ZXJydXB0cyBsb3N0IG9uIG1pZ3JhdGlvbiB3aGlj
aCB0YWtlIG91dCBXaW5kb3dzLsKgIEphbmUncyB3b3JrIHdhcw0KdGhlIHZlcnkgc3RhcnQgb2Yg
YmVpbmcgYWJsZSB0byB0ZXN0IEFQSUMgYWNjZWxlcmF0aW9uIHJhdGlvbmFsbHksIGFuZA0KdWx0
aW1hdGVseSBmaW5kIGEgZml4Lg0KDQp+QW5kcmV3DQo=

