Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CCF4AD438
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:00:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267743.461492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMMU-0005i9-Ah; Tue, 08 Feb 2022 09:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267743.461492; Tue, 08 Feb 2022 09:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMMU-0005ee-6w; Tue, 08 Feb 2022 09:00:34 +0000
Received: by outflank-mailman (input) for mailman id 267743;
 Tue, 08 Feb 2022 09:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHMMS-0005eS-JI
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:00:32 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 900feadc-88bd-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:00:30 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2186iL9f013032;
 Tue, 8 Feb 2022 09:00:26 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3kgu0hy3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:00:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2226.eurprd03.prod.outlook.com (2603:10a6:200:4d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:00:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:00:21 +0000
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
X-Inumbo-ID: 900feadc-88bd-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HW4resnCC0tyGVVaV+gquvyZwFQna+5jranohtXzOkdBepPnjd4BpV1ETBH82JofIKVZ+UZOxjwj5ukWPXsakwesEASCsPMyXF9QemfGoSOAKtspNiZxCPpHMjvbEJ0/VCuceiLpdLXCZiDS+HqVSjZ9mRnqr3ThPgYj4uiKtZ9OklGSgFiKH4dbDY47vxfXXGT9v3Icq61+g53l8BPf9eqwBlUPn2fwiVCf96o06LM36Li69Ivbelf+a7o8xVX77E0u/kKV/6gYxoPbhwU+8HT8KIfGw5Mcy8hBNHCmjVIBgtejhyri8GNdHf0egpYqiSCRCQp1EmKWUuTvGvMtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOvedpwc4BrgJPXSjAHoARgCDT0cQXFsosolrHyQ5hE=;
 b=mm1/Cfbj1o+p6fCBsJE98lRDaKWYdh/zqLPY1yFUbqQvLlrtuHpOuN8joBSx1Izez7B2nx7SZT8bcbxT1O310ejWjvPAYHSlJN1cqzGN16JiiVl27hTUpmESo+jR4HjFfjXyhukL6j/YD1nbHYsBGxwhG1KiTfJyzzZx1aAG8NDAbBK/8nNuUqqjHfVGg4rcS+3CfVmgbhwgbp3VwBufUyANNbDcEHNUKveUsWZ7xcIURoKFD8/QOvlcGUh7H/4mXvLOKFhE4RyA4NlOe4ao+23hcWDQGRm0QSavkwrKboptvgL+oZEOqDNRRDmEEViDvdUHRclUepNFWVSQifHt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOvedpwc4BrgJPXSjAHoARgCDT0cQXFsosolrHyQ5hE=;
 b=ZtakGRM7uIAK3qXGobLQLyt8C252nBeNJQGXCslDZ7Xma30Mo/0NVa3tvMgRbcRn8wlgQsW2b+e5nHLVOmqU3SgKXMfHDff3m4dfIULUh9vVzC1qprHhG124tpsSZ3LPp9agxHppBAPafLC3F2GMDoFRATRplR7/WfwxOQ5YKe130A63l61EmOYfN5x+gEF6nyZRdzgl5MGYZpPLz6YWqTcz4BriaDOK3xf2LHkzH3pNP7HCwjupqCUfxJpohvb/4/n03x5H0FQfARqEkVxsl4x3Rw/av9wOQfsnOZhKFzCho/97WDVZZL0jPuwMbji9Jfll9HcZpWHJYPePYDSEYw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAASKAIAAAiiAgAAKNYCAAARNAIAAC1wAgAACRYCAAAGVgIAABJiAgAAB5wCAAQ7DgIAAAdkA
Date: Tue, 8 Feb 2022 09:00:21 +0000
Message-ID: <57060264-8c5e-ae39-5bf8-ca5b6a58639f@epam.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
 <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
 <df369309-3767-632c-912e-e83edcf6a2ad@suse.com>
In-Reply-To: <df369309-3767-632c-912e-e83edcf6a2ad@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6da77da4-2f4e-4515-1830-08d9eae1701f
x-ms-traffictypediagnostic: AM4PR0301MB2226:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0301MB22262C7174222F546615C844E72D9@AM4PR0301MB2226.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mr5gHkTF7dUViPt1dzrxKxJoU9Prwh1niSnq1656zzLgsQpTXbVP8S8Fpu0eRmWLciyyoJeERW7G+uosp/ppcvn5/CFXilvhNNSvtBaeMs2wvvZ0PCl02zkArhhV89K/zWB/wN8ysHcalGQImbgCKw52LyxrpOuKvifCZSDCMfQRx8Fn49hqf33dvxfOPSI7aDKvumUgko5KrhLhKe2YRXrdmLk05+B7/9UO0IKZ9nKvg8kADmplNihPzqvIkqyNd0QuVH1G4GY/ldSjdKyj9Ut4rPGEeYOLK2qK6naX5yQcCh8XaE4enFnD38M4tgM3wnCxDyVgwiV+YmkQRVSbu8f5xGYUW+gU7mzrxH0PMvUr+JfllPOkLrJp0GpQbjiZb84OLtsZ2m6GaYROaC5UEcrcKtlzje5nV88TZkpBRgZmLtlntKi6cChf3IgsElunwm8Uhwe1XFqb6I1Wqyb+0dYGWC4dP2AwmVFrMDEV6wyoNfZW9bS/mEnfLkFO9dx3ZK2KUcDbT+mAk9M7I00XCL+CfdQ1MqkDJmDbphm9WFtDJJLJ1vZNL1SgWBXhA/EydaS9Q1QxwXYNZ9F8a3zp2gfpEaBdHmNeo0v6WNmANjjEaNF+hGALi2hIVos9wcQekIld3qfFxoUJzZWBvrdUv/W7RjjJkpwsZLLw78y00GcEkHgIOCsY6nmNWiWf6Hakgt0xWZdXZq6Mi3UZ8uckZz5en82rTcXbzqs9+OumePQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(64756008)(53546011)(71200400001)(8936002)(8676002)(508600001)(4326008)(6506007)(6486002)(91956017)(36756003)(38070700005)(76116006)(66946007)(66476007)(31686004)(83380400001)(86362001)(186003)(66556008)(316002)(2906002)(54906003)(55236004)(26005)(6916009)(7416002)(107886003)(6512007)(5660300002)(122000001)(2616005)(38100700002)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TDlXTkZGQjlBN3JSeGNKZFBKOGhkV2JYaFVoWFhmSTBnKy9xSERSenNyaitl?=
 =?utf-8?B?Wmx5OFNpQ0ZURVd0RWFVMlpLY0ZsaFR5aFJGNnVGVjlCUkh5elNWUTlIOVBa?=
 =?utf-8?B?d2JXQmhZdUtGajRmOFJ6MHErdVg0cFZWYytTQjVmVGs0RldTb1l1MWxCMExN?=
 =?utf-8?B?QTlEc0I0dGFVaHk0bHUxUHhlaTFWbVpsaEs5VEUxQkVMbkxWWUFqUGppNXlV?=
 =?utf-8?B?UHQrYXA0V29TQW10SHl0aXc0ZnBodEw3V0tBNDFMWTNvOG1XTTVVOXM4THlU?=
 =?utf-8?B?SWJqc3k5QU1wM0hxa3hXOGNiWmVpaWozMU9qbUtIdlVlT2UvdTNDWGdVRHZF?=
 =?utf-8?B?S29IWG1VZ3NKUHBMaHRBcEFVTHVuWERSZE1Xd0M4cUVpd0VlV3BMR0dZMjJT?=
 =?utf-8?B?THA3WDI2b045R2I2Sm5uVElBSGhTemsrSmZjU3NmNEhRMEpES0R2Mzd0SnpI?=
 =?utf-8?B?SU80UzI3aGsxTk1PVEp0VVZDME9WblJJcXlTem9vZ3pCTmdDZjdKQnFoMXZI?=
 =?utf-8?B?bXRTRVJORU1Mampyb2Z2cG1ESXFvb1dzOU9nLzYreXpzUEhOMW44Sk5OQkNp?=
 =?utf-8?B?bGcrckE2TzJqQW5EakRpcFNhZFYyM0lDRm5MSHBBUWs5aWROanBIdGZTeFdY?=
 =?utf-8?B?MUV1N2szUGxZMWs3dkthYlZxcHU4WUlvaEdkc3k4YlJ4SXh4Z2pwMWQ1T1Np?=
 =?utf-8?B?bERUd2dXaStPU3pucFhnYjBNcW1pcUs1emNlcGhSOXBBSGh0dGJTZFFwY2ZN?=
 =?utf-8?B?UnFSK2Uva3kzQUZxZDFPdUdpcy82QSsxempodGljOVZDVFRXMEY1QTl2ZWda?=
 =?utf-8?B?UEZpTUV1cUpwMWtFZzMvVkg0ZjluQnVyLzFuaTFFV2xBa0xyTDBDTVNJN1hW?=
 =?utf-8?B?VXlkWFJXR2J3Q084aElmVFZOZ1FncThQVVRlRmxsMnJRS3pRalRVWUZYRVhw?=
 =?utf-8?B?WWlqNkIzN0p0NW44aGs1SWZWL1Z5TVN3cS9XY0s0Rm5STndCa0dBU2loZkJH?=
 =?utf-8?B?SDlBbTQvNGRTTVpZaGRZVkRjbzhBQlk0aDErNzAvNEVrcmRZTkFVNTBZeEJp?=
 =?utf-8?B?VFBYd2ZxNm1oRitxVXZvaWE0eE5uQ3VXYUJseWhuQUtuSDdVZ2RuQ2F4M1Br?=
 =?utf-8?B?empoamZiUHZOaWJrb2Vvd1VpTFNMT2RIR1R4SmZZQkVsdkd0OHY3aTdVbU9Y?=
 =?utf-8?B?Wm5FSjluZnVWaysrQnhzTFJWWlZ4NjVpdFo5TnNsYkRFNE8zNFVuV2dSQ0hJ?=
 =?utf-8?B?MkRiRTFzSzZoNTIwcTZuckVPZWVkTU1KTS9MeGdmZ0hRU2YvakZ1WlI1WWxP?=
 =?utf-8?B?bmI2MWxFcXRNVUl2NzROT0sra2N5OFMyR0VGYmhablRzZVNTUUk0NDYwekpQ?=
 =?utf-8?B?bTZMOWREYkJzYm9HMVhDdXBRc1VTVi9ybG9MY1RYaWlEYkt5QmQ3WitGcmVO?=
 =?utf-8?B?clg1d0VWdVFYT1kwSWJNcSsvbW9OZnZQVEoyLy95VnNOMlp3Nlp2dG1ZNWhv?=
 =?utf-8?B?RlBFVWVPRm9UdHIyMXNKVEVUUDNmenB3K1prRUd0ZWQ4ZG53T1RKYlJWRUdt?=
 =?utf-8?B?YTdKWnVoRHAvOUw0b3RUd202THFzMDQvbW1JbkdLUkJVT3lEV01hTnFiMnZl?=
 =?utf-8?B?b1F2RWtqTTNENzJySEdGTWk4ZDFDYVVSVmFFZTlnNXJ1elVvUUw5eGlIVDZj?=
 =?utf-8?B?T2JkSnBxU1dRY25BazFBUXh2ZVo4MXUrS2JyRVpKNm9la3lyelRKL2FRSGls?=
 =?utf-8?B?S3hMRFFOU1RITGZHVjBDRSt4TktMc0VUYkdpVTVMMEdSSFNrTlEwQkUvM1Nz?=
 =?utf-8?B?R3M3Vk5GWkxrczUrTDJrSG1HcDE0aHo5KzVhR0NQdHVoL0RuRXh6NEZhTlUw?=
 =?utf-8?B?NWU3RTByRzl1VWxZcCtQaWhCZ3VFbERsYkdjU0tsYk5PVnd4Mm5LZUpFMHBU?=
 =?utf-8?B?QnlWbXlFOVRHbWtrWDhhNDVaTkdET2JkcXkxbWFNWUtSRHhuYStPcWNoYXcz?=
 =?utf-8?B?Y1QxUTNIRHdXaDdFY3lPVDY2eFNQa1FjU0FpcTIvZlZpdG5NQXkzVVczTnEx?=
 =?utf-8?B?ZVRKZzV5TFJMZWRyN0JkeUZUdGM5WWRDdnYyOHNCMEVmS2plRlZXRnFzcWFC?=
 =?utf-8?B?bUNLVnNGREp3TG1HZWMvdmMzQWZEb2hjU3hwRDcxVDZTb2pJcXNFK0k1Rld4?=
 =?utf-8?B?VnBzWFpHTjdQbTE3bXczZGhaY3NPWlo0dHdCMVBRNW5BcTgyZXByMGZiZUtG?=
 =?utf-8?B?VGM5aGJHWnF0UDZsZlZMMENiWE5hTVpydGZCdWFBcGlUQ2lyYlFSaCtmOVhE?=
 =?utf-8?B?aFZVYStXSTNOVmVQTHJuQ0tNSW82MlNOSWdvTjZMZWxvb3pjd0o4dUNlUnJX?=
 =?utf-8?Q?HttDG0DH4i7n7F9k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <732C08E913ACE944BB1758C4F685D9DC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da77da4-2f4e-4515-1830-08d9eae1701f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:00:21.8325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NYGF1rKCSYE8rt8ou40P70lfl1GKzgQPygNDN3Ig+73Gkmn2gtS1GatKkhQQhHKUIyIgmKpiPcgPz5QcQnPbMqecC6CFTMnD8KUeQbO5sZBBWMb8ROfG9BM6CHIa6R2V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2226
X-Proofpoint-GUID: dRTYrEwttfJamNQ_6QAa4xYQBbo80VS7
X-Proofpoint-ORIG-GUID: dRTYrEwttfJamNQ_6QAa4xYQBbo80VS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080050

DQoNCk9uIDA4LjAyLjIyIDEwOjUzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxNzo0NCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDcuMDIu
MjIgMTg6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAyLjIwMjIgMTc6MjEsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNy4wMi4yMiAxODoxNSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNy4wMi4yMDIyIDE3OjA3LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNy4wMi4yMiAxNzoyNiwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+IDFiLiBNYWtlIHZwY2lfd3JpdGUgdXNlIHdyaXRlIGxvY2sgZm9yIHdy
aXRlcyB0byBjb21tYW5kIHJlZ2lzdGVyIGFuZCBCQVJzDQo+Pj4+Pj4+IG9ubHk7IGtlZXAgdXNp
bmcgdGhlIHJlYWQgbG9jayBmb3IgYWxsIG90aGVyIHdyaXRlcy4NCj4+Pj4+PiBJIGFtIG5vdCBx
dWl0ZSBzdXJlIGhvdyB0byBkbyB0aGF0LiBEbyB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZToNCj4+
Pj4+PiB2b2lkIHZwY2lfd3JpdGUocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1
bnNpZ25lZCBpbnQgc2l6ZSwNCj4+Pj4+PiAgICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVpbnQzMl90IGRhdGEpDQo+Pj4+Pj4gW3NuaXBdDQo+Pj4+Pj4gICAgIMKgwqDCoCBsaXN0
X2Zvcl9lYWNoX2VudHJ5ICggciwgJnBkZXYtPnZwY2ktPmhhbmRsZXJzLCBub2RlICkNCj4+Pj4+
PiB7DQo+Pj4+Pj4gW3NuaXBdDQo+Pj4+Pj4gICAgIMKgwqDCoCBpZiAoIHItPm5lZWRzX3dyaXRl
X2xvY2spDQo+Pj4+Pj4gICAgIMKgwqDCoCDCoMKgwqAgd3JpdGVfbG9jayhkLT52cGNpX2xvY2sp
DQo+Pj4+Pj4gICAgIMKgwqDCoCBlbHNlDQo+Pj4+Pj4gICAgIMKgwqDCoCDCoMKgwqAgcmVhZF9s
b2NrKGQtPnZwY2lfbG9jaykNCj4+Pj4+PiAuLi4uDQo+Pj4+Pj4NCj4+Pj4+PiBBbmQgcHJvdmlk
ZSBydyBhcyBhbiBhcmd1bWVudCB0bzoNCj4+Pj4+Pg0KPj4+Pj4+IGludCB2cGNpX2FkZF9yZWdp
c3RlcihzdHJ1Y3QgdnBjaSAqdnBjaSwgdnBjaV9yZWFkX3QgKnJlYWRfaGFuZGxlciwNCj4+Pj4+
PiAgICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZwY2lfd3Jp
dGVfdCAqd3JpdGVfaGFuZGxlciwgdW5zaWduZWQgaW50IG9mZnNldCwNCj4+Pj4+PiAgICAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBzaXpl
LCB2b2lkICpkYXRhLCAtLS0+Pj4gYm9vbCB3cml0ZV9wYXRoIDw8PC0tLS0tKQ0KPj4+Pj4+DQo+
Pj4+Pj4gSXMgdGhpcyB3aGF0IHlvdSBtZWFuPw0KPj4+Pj4gVGhpcyBzb3VuZHMgb3Zlcmx5IGNv
bXBsaWNhdGVkLiBZb3UgY2FuIGRlcml2ZSBsb2NhbGx5IGluIHZwY2lfd3JpdGUoKSwNCj4+Pj4+
IGZyb20ganVzdCBpdHMgInJlZyIgYW5kICJzaXplIiBwYXJhbWV0ZXJzLCB3aGV0aGVyIHRoZSBs
b2NrIG5lZWRzIHRha2luZw0KPj4+Pj4gaW4gd3JpdGUgbW9kZS4NCj4+Pj4gWWVzLCBJIHN0YXJ0
ZWQgd3JpdGluZyBhIHJlcGx5IHdpdGggdGhhdC4gU28sIHRoZSBzdW1tYXJ5IChST00NCj4+Pj4g
cG9zaXRpb24gZGVwZW5kcyBvbiBoZWFkZXIgdHlwZSk6DQo+Pj4+IGlmICggKHJlZyA9PSBQQ0lf
Q09NTUFORCkgfHwgKHJlZyA9PSBST00pICkNCj4+Pj4gew0KPj4+PiAgICDCoMKgwqAgcmVhZCBQ
Q0lfQ09NTUFORCBhbmQgc2VlIGlmIG1lbW9yeSBvciBJTyBkZWNvZGluZyBhcmUgZW5hYmxlZC4N
Cj4+Pj4gICAgwqDCoMKgIGlmICggZW5hYmxlZCApDQo+Pj4+ICAgIMKgwqDCoCDCoMKgwqAgd3Jp
dGVfbG9jayhkLT52cGNpX2xvY2spDQo+Pj4+ICAgIMKgwqDCoCBlbHNlDQo+Pj4+ICAgIMKgwqDC
oCDCoMKgwqAgcmVhZF9sb2NrKGQtPnZwY2lfbG9jaykNCj4+Pj4gfQ0KPj4+IEhtbSwgeWVzLCB5
b3UgY2FuIGFjdHVhbGx5IGdldCBhd2F5IHdpdGhvdXQgdXNpbmcgInNpemUiLCBzaW5jZSBib3Ro
DQo+Pj4gY29tbWFuZCByZWdpc3RlciBhbmQgUk9NIEJBUiBhcmUgMzItYml0IGFsaWduZWQgcmVn
aXN0ZXJzLCBhbmQgNjQtYml0DQo+Pj4gYWNjZXNzZXMgZ2V0IHNwbGl0IGluIHZwY2lfZWNhbV93
cml0ZSgpLg0KPj4gQnV0LCBPUyBtYXkgd2FudCByZWFkaW5nIGEgc2luZ2xlIGJ5dGUgb2YgUk9N
IEJBUiwgc28gSSB0aGluaw0KPj4gSSdsbCBuZWVkIHRvIGNoZWNrIGlmIHJlZytzaXplIGZhbGwg
aW50byBQQ0lfQ09NQU5EIGFuZCBST00gQkFSDQo+PiByYW5nZXMNCj4+PiBGb3IgdGhlIGNvbW1h
bmQgcmVnaXN0ZXIgdGhlIG1lbW9yeS0gLyBJTy1kZWNvZGluZy1lbmFibGVkIGNoZWNrIG1heQ0K
Pj4+IGVuZCB1cCBhIGxpdHRsZSBtb3JlIGNvbXBsaWNhdGVkLCBhcyB0aGUgdmFsdWUgdG8gYmUg
d3JpdHRlbiBhbHNvDQo+Pj4gbWF0dGVycy4gTWF5YmUgcmVhZCB0aGUgY29tbWFuZCByZWdpc3Rl
ciBvbmx5IGZvciB0aGUgUk9NIEJBUiB3cml0ZSwNCj4+PiB1c2luZyB0aGUgd3JpdGUgbG9jayB1
bmlmb3JtbHkgZm9yIGFsbCBjb21tYW5kIHJlZ2lzdGVyIHdyaXRlcz8NCj4+IFNvdW5kcyBnb29k
IGZvciB0aGUgc3RhcnQuDQo+PiBBbm90aGVyIGNvbmNlcm4gaXMgdGhhdCBpZiB3ZSBnbyB3aXRo
IGEgcmVhZF9sb2NrIGFuZCB0aGVuIGluIHRoZQ0KPj4gdW5kZXJseWluZyBjb2RlIHdlIGRpc2Fi
bGUgbWVtb3J5IGRlY29kaW5nIGFuZCB0cnkgZG9pbmcNCj4+IHNvbWV0aGluZyBhbmQgY2FsbGlu
ZyBjbWRfd3JpdGUgaGFuZGxlciBmb3IgYW55IHJlYXNvbiB0aGVuLi4uLg0KPj4NCj4+IEkgbWVh
biB0aGF0IHRoZSBjaGVjayBpbiB0aGUgdnBjaV93cml0ZSBpcyBzb21ld2hhdCB3ZSBjYW4gdG9s
ZXJhdGUsDQo+PiBidXQgdGhlbiBpdCBpcyBtdXN0IGJlIGNvbnNpZGVyZWQgdGhhdCBubyBjb2Rl
IGluIHRoZSByZWFkIHBhdGgNCj4+IGlzIGFsbG93ZWQgdG8gcGVyZm9ybSB3cml0ZSBwYXRoIGZ1
bmN0aW9ucy4gV2hpY2ggYnJpbmdzIGEgcHJldHR5DQo+PiB2YWxpZCB1c2UtY2FzZTogc2F5IGlu
IHJlYWQgbW9kZSB3ZSBkZXRlY3QgYW4gdW5yZWNvdmVyYWJsZSBlcnJvcg0KPj4gYW5kIG5lZWQg
dG8gcmVtb3ZlIHRoZSBkZXZpY2U6DQo+PiB2cGNpX3Byb2Nlc3NfcGVuZGluZyAtPiBFUlJPUiAt
PiB2cGNpX3JlbW92ZV9kZXZpY2Ugb3Igc2ltaWxhci4NCj4+DQo+PiBXaGF0IGRvIHdlIGRvIHRo
ZW4/IEl0IGlzIGFsbCBnb2luZyB0byBiZSBmcmFnaWxlLi4uDQo+IFJlYWwgaGFyZHdhcmUgd29u
J3QgY2F1c2UgYSBkZXZpY2UgdG8gZGlzYXBwZWFyIHVwb24gYSBwcm9ibGVtIHdpdGgNCj4gYSBy
ZWFkIGFjY2Vzcy4gVGhlcmUgc2hvdWxkbid0IGJlIGFueSBuZWVkIHRvIHJlbW92ZSBhIHBhc3Nl
ZC10aHJvdWdoDQo+IGRldmljZSBlaXRoZXI7IHN1Y2ggcHJvYmxlbXMgKGlmIGFueSkgbmVlZCBo
YW5kbGluZyBkaWZmZXJlbnRseSBpbW8uDQpZZXMsIGF0IHRoZSBtb21lbnQgdGhlcmUgaXMgYSBz
aW5nbGUgcGxhY2UgaW4gdGhlIGNvZGUgd2hpY2gNCnJlbW92ZXMgdGhlIGRldmljZSAoYmVzaWRl
cyBub3JtYWwgdXNlLWNhc2VzIHN1Y2ggYXMNCnBjaV9hZGRfZGV2aWNlIG9uIGZhaWwgcGF0aCBh
bmQgUEhZU0RFVk9QX21hbmFnZV9wY2lfcmVtb3ZlKToNCg0KYm9vbCB2cGNpX3Byb2Nlc3NfcGVu
ZGluZyhzdHJ1Y3QgdmNwdSAqdikNCnsNCltzbmlwXQ0KIMKgwqDCoMKgwqDCoMKgIGlmICggcmMg
KQ0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBGSVhNRTogaW4gY2FzZSBvZiBmYWlsdXJlIHJlbW92ZSB0aGUgZGV2aWNlIGZyb20gdGhlIGRv
bWFpbi4NCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBOb3RlIHRoYXQgdGhlcmUgbWlnaHQg
c3RpbGwgYmUgbGVmdG92ZXIgbWFwcGluZ3MuIFdoaWxlIHRoaXMgaXMNCiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKiBzYWZlIGZvciBEb20wLCBmb3IgRG9tVXMgdGhlIGRvbWFpbiB3aWxsIGxp
a2VseSBuZWVkIHRvIGJlDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICoga2lsbGVkIGluIG9y
ZGVyIHRvIGF2b2lkIGxlYWtpbmcgc3RhbGUgcDJtIG1hcHBpbmdzIG9uDQogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogZmFpbHVyZS4NCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZwY2lfcmVtb3ZlX2RldmljZSh2LT52cGNpLnBkZXYpOw0K
DQo+DQo+IEphbg0KPg0KPg0K

