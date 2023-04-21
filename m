Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B96EAC90
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 16:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524599.815663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pprWV-0001TH-C5; Fri, 21 Apr 2023 14:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524599.815663; Fri, 21 Apr 2023 14:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pprWV-0001QT-7s; Fri, 21 Apr 2023 14:14:03 +0000
Received: by outflank-mailman (input) for mailman id 524599;
 Fri, 21 Apr 2023 14:14:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfVw=AM=epam.com=prvs=8475e47d9c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pprWS-0001QN-SM
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 14:14:01 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0839127-e04e-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 16:13:57 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LA2PWM030003; Fri, 21 Apr 2023 14:13:48 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2170.outbound.protection.outlook.com [104.47.51.170])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3q3dv2tsd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 14:13:48 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by GV1PR03MB8077.eurprd03.prod.outlook.com (2603:10a6:150:1c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Fri, 21 Apr
 2023 14:13:44 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3%3]) with mapi id 15.20.6298.045; Fri, 21 Apr 2023
 14:13:44 +0000
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
X-Inumbo-ID: c0839127-e04e-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVWk9mVfTJrMiTOnBGdh2MkiRYMpGs6LcwXCPqPcefYpDaAuQpTZRQA5Ltk0RItEzSRUpebiEE1uvLpQLzeqjCKmTfGcbWRaNxqN1bemfSK4g4AYHZbkqmnDuKiJBsxaJCC8LEZZrmccxBqSIhU4RhpJVXbKDMhuAr47T/nOPb2qVUYvlH8DnWMLNfZdz9FxXV8nKhr5y4vUiVhfwJYtG9qUUCpxKUwdNqmu2xUEejliOXI6NbJGFHageNq0cciGftSeHx69k3h/TmvuBUMk+T6qYktsWZBgWXacyXmWMHjagsWgjPfG+ab61nAZ9JNTtKJCTLnj/yEO1tZz1t7GHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86g7TwiRUUiY1zsqf2UsjU9Buscg/ufe8UAnR6+97fg=;
 b=GegRsFaCTePpAuADWGIO33JeVI5IB+OzAgns6CjgUtCrVVmsiiVz8m7XEPrdvnVq/Q9b+hoBEV3Dcv217+nggA8tXdsn5HMiqKDGjsgK4NDZEr5kN/pfH4MUCS5NWyRMvpYycU7q5uvOymfihJiBLWR6iXCx+Rg64mnzdLUVIpQwKvKdmvFdwUONTTCLsX/K9OytgWYRCnKxWnjrBhsIjLyBrC5N7hQEKIGGtVXHWBu54budcARuHlP+0yJrGmLJJqrbJNCRhU0ExrMdyEy8F0D2PfyUZVDux67e12rShOt2nkS68KXF/McpEoPtaWGWApsY8aXrnrn9TrjAFhdacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86g7TwiRUUiY1zsqf2UsjU9Buscg/ufe8UAnR6+97fg=;
 b=W0Pf0H7L1LSpKwzvLie//aQlY9FM+HLf97FOQ6h2S9VK+jACkoWT/n5TGbTsJZeLiPuzKtf73HIjOm/r+hGS8EbguCKnHdLxqwrSBLm5opOHSN7NqubnabdN7d6LYA3RFNfBEU/2H/xCaYrVxoPJQ40OvU9x70XJl1UiF4Jqt0pc1EojFqk8V4yUqhf/mK+aarl56WUS/oZJnRWFJION7nrAXkJSz+STbZL7V+uEy7KfgCeEzrVDT01E2JOoplEKH0ziSIeuaxhE9qnYH4MgwWW8NAiNCWUD51lC8C8UEsv6GGsX/Ixrk3QRf+vDrfkmyTEWyc6h+3oaHB2H5BksxQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Topic: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Index: 
 AQHZVrdzsdckomMx4kauxHkZQ597Iq79mAMAgClI2ACAAK/igIAAVGGAgAGe14CAAJvOAIAFXoKAgAAEr4CAAAS6AIAGQ32AgAAsn4CAAAL9gA==
Date: Fri, 21 Apr 2023 14:13:43 +0000
Message-ID: <87o7nh727c.fsf@epam.com>
References: <ZBNA9q5DXJYG3KVp@Air-de-Roger> <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger> <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger> <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
 <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
 <ZD0krtCOrEwiKMFP@Air-de-Roger> <87354t8pqg.fsf@epam.com>
 <ZEKLN8AlzDUckorU@Air-de-Roger>
In-Reply-To: <ZEKLN8AlzDUckorU@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|GV1PR03MB8077:EE_
x-ms-office365-filtering-correlation-id: 22db354f-ec1e-4838-28f2-08db42729d8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yas49Cvs7HxwuA1PrFx9IfbaGlVau4JODMuCDKVtqFNCX+Di73cG53K5Hfes8szW8jTn94M1cPCSvUjWH12ee1M0QjXoyZEIKBaUpH4ErmzjabbqiAeTmuEQ3IispOa+fCrb3WoO+FDwfr9wuKYg1DKKkcchTTixlUEVks2tvUWxoOgklkc4yGE/yJ7KRXhgu7w6qI7Sf1oMOHNmF4FX/g2fQPfevorDEMNJeInT/rkRtQ3vdhZy+S/VM90kBskdY02EW65UAqQO6t9NaZC5xqCj+qo9KnVGU4jTM/mfQVDC9BK132VOS/IGQGOE7ZHyMrcMOqj8DCKwqAIgJgYgQlaoeqA3lsXGlU9wqqZYSOMenr59G51bL8sIO10uSgsLWnqfJ84TAo+SsgOQ4S3abXAG2shbfHosHYZ8X44DWoKZT7j0XriDNZV19SWffLRyIt32dWsgSEDzEn1TCqy5WccvwTwmmhB0+J8z0WS/Xacz9fOusdE8xcz3uLF+XyADzhD9o5wCf0uYFPcAtCkPVAE3frgiYlsmZb1hyjshDNg9BWqTe7mBj1ipsDZJEKDlPV46EIk26XtLLPQXbdcfZE6q4cqs5Hqu2xbIp19yitSix+w03AOJYvW41kfG+jBb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(66899021)(76116006)(316002)(91956017)(54906003)(66556008)(66476007)(66946007)(64756008)(66446008)(4326008)(36756003)(6916009)(53546011)(55236004)(6506007)(26005)(122000001)(38100700002)(6486002)(2616005)(186003)(6512007)(83380400001)(5660300002)(8936002)(478600001)(71200400001)(8676002)(38070700005)(41300700001)(86362001)(2906002)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TzU3YUxwaTlHUDZiRnR6K3g1V0tZcVFuQWRRcnEyNStGZlp5dTJOYmNrTHVs?=
 =?utf-8?B?QytVQXRrZEFEdWdyNkE3RzBteFdHbzZYRFdhZXZINDZNL2xYM25iK3hCRWFT?=
 =?utf-8?B?d0xmN09jK2tReDQ1Rmk0bTJoSDNyQWlBSURFMTZDZ3liR1ZzMFJTR1dDQjF5?=
 =?utf-8?B?N2w0cElDMGpVM09jclY4cUVMNGxvWUE3UEw5U3pyL0VvaHorOXE4QzNaSWVI?=
 =?utf-8?B?RlkvRTMyYkJQVTN4QUFLN0N6enRtbS9EbGE3aGZSRm9BYWZEMkZ3WmwrdXpq?=
 =?utf-8?B?dEc4ZC9UbjNoUXBpSjZqcWkrTkJwdDNNK3JhL083TXVnYmdlcTYyUktxN0x2?=
 =?utf-8?B?QUhuZkVQYTFwUEhubk9MZ3dRdjBaMHRHTEpTUFE3WTMreW1POWduc211SXM5?=
 =?utf-8?B?QWVMdzNrOXA1dmw3Vk9KeUs1TThhazVsQVB6aHY1S0M2T3pMaWk1NHA2WmFh?=
 =?utf-8?B?eHhXbXhCek11S1orQUFwN2FLd0NPTkQxMzFBWnVNdkZYQnNRaThXUCsvUzVy?=
 =?utf-8?B?NHFqQjcrTUVJdUNYYlVNaGtwWTNiaTRuUEV3cCtMdXlrUlgvNjNFeHVRd0tr?=
 =?utf-8?B?Tkp1czVQVDZKZzZSdTZ0bFg2N01tR3FQY0VPNWJKRGNCMnRqdE9BVVF6ZkRW?=
 =?utf-8?B?VS9ZZUV5cXBrS2IvVzFhKzBNdllvcSsyUmJXT0RTU1VDdE1DT0FvZmlSYmww?=
 =?utf-8?B?R2Ziczd0MVFiY1N1T0IyNjZ3SVAxYVQ3WHRLSlV3Tjk2WFdUY2VJYTNqREJV?=
 =?utf-8?B?SDNlMTNheUhMb3JBbkprUkFqUm5HRnV5QVAzNkY5anNQL28raWZZS1dSb0Jk?=
 =?utf-8?B?UjN5eDh3djBEbFJ1V2lEemtFZzhjZnhPNWZHWHpLQWxhY2daMCtaY0NYWSti?=
 =?utf-8?B?dlBGRTRnd3o0K0gzNmZMMWQyRStOdk5rWTZvcEdtT1JuaHFZZEU4WDZNQVJ1?=
 =?utf-8?B?bGx5ZWdranRVNHd0YVZYYSt0OWNqdTRsTU9IU3JlOEhkS1lRM095YW5hdWZq?=
 =?utf-8?B?OXBFSW84dC82eXN0N0pLQXZPVm5Ma3FEWmdaR0tWdWFuV1F0Szg2OXFKbTR1?=
 =?utf-8?B?eFMwcThVUkF3em5NbVNuK0ZuSVFHSzdOc203T1ZuTElTSWxyMUx3eTB0TlU1?=
 =?utf-8?B?K252UWFZWHp6K21FUzFOTTI1Ui96a3NVSmNxQ29pQ1AzODBPWlEvaitFTitt?=
 =?utf-8?B?OUtoZlMvU3ZmaWdKTS9URDRzL21nek92NFE3UXhHTmo4R2V2bnA4TU1BYTh4?=
 =?utf-8?B?MDRnWEVDY3FZMFBmMjlCanJsTFJ4b1NtLzBWdEZiQkJjY09lbCt6MjZnbDhF?=
 =?utf-8?B?U1A0R21XM3h5MXpSMnRCVkd6eXpDZ0hlQTU2cFFoV2NkU2lzakd2VkYzY3B4?=
 =?utf-8?B?Y1c1c0puZ2VqRDBqMFM4U09qdHRTNnpTM0EvTFdnaGorQnN6dU5VMGNVMGdx?=
 =?utf-8?B?SjZ1K3p2ZmZPWmtZbEZhaHF3bHFrNkxFVmxtTkRyb0MwQ1A5eGtlWFlkSytJ?=
 =?utf-8?B?U2NzL3YvZ0t3YmFTMlBXME1BQVBMUGVMeFJTMjdjMHRMTnZEblJ3M0hHc09E?=
 =?utf-8?B?cG41U1BsSUM4TTRDcEZSZ0lDc3NIQnVJNGIvNGU5TEw5eERKQytNa3NMS0RE?=
 =?utf-8?B?bFBzV3ZUOUozR2pZMFdxVGg2RDNEb2h0T1lMWXFJcXZaZUZuZmdZRkdMM1Bu?=
 =?utf-8?B?RWFmeFBQZG5abHU3K2VFeHc1UmlYUUo0Tmp1anNpR2RlTk1YdFR6Z0hzd1d1?=
 =?utf-8?B?UEErL3JwcFc3cGtSWnY3Y0FGanBRbE95bkl4ak5yOUYyYVdPNTMxTkhUbnp0?=
 =?utf-8?B?QXpjdDFIa0ZzTGtEcmtsWHBaQlJ4aUxJNGpkQVVETTY0Sy9NM2NBcWRoRGNo?=
 =?utf-8?B?SVdXOElpTlVuQ1E5NDJ4cEZ2Ukd2ekxnSUlxVDM1T0o2MmNGUDdYVUFDTnhO?=
 =?utf-8?B?SDZ6OEU4c2xKM2xES0l2SmlFa3ZCbUhxc0FhM0UvVWd0OG9pMDRMdVdVOEg0?=
 =?utf-8?B?WkZRY1EyelRqL1pPNTE1ZkFYMUZNZVN0UHRZM0Eyb3Q4cmEvZUlzVTg2T1BW?=
 =?utf-8?B?NEl0TnJ0c2l1K3h1c1gxWndUTTdRakIxZHVDRFVndGk0REtQUFFVQmlnZGo5?=
 =?utf-8?B?bmFHcWFicGVUTVVMRmhLRXM0WVRSZ3lrV2oxYnlLRm9pUXlxZEt3U3M2T015?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD736F41E3F6E7459FF421AE203503BC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22db354f-ec1e-4838-28f2-08db42729d8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 14:13:43.9662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YL2yFoCT8bw1+/0VMmGI/hhLBS3hmd7wSdElBra5W37SXqFC+tbHoXUXFOXFNfbV74ER6kGfGZG3zEufBg1JjSwupQ3lzCxBFLVNg3Q9aA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8077
X-Proofpoint-GUID: wfcxm9WxF6Ku4jdFz7-oxqhdJKfInrp0
X-Proofpoint-ORIG-GUID: wfcxm9WxF6Ku4jdFz7-oxqhdJKfInrp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_06,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=922 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210124

DQpIaSBSb2dlciwNCg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
aXRlczoNCg0KPiBPbiBGcmksIEFwciAyMSwgMjAyMyBhdCAxMTowMDoyM0FNICswMDAwLCBWb2xv
ZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IA0KPj4gSGVsbG8gUm9nZXIsDQo+PiANCj4+IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cml0ZXM6DQo+PiANCj4+ID4gT24g
TW9uLCBBcHIgMTcsIDIwMjMgYXQgMTI6MzQ6MzFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+PiA+PiBPbiAxNy4wNC4yMDIzIDEyOjE3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4g
Pj4gPiBPbiBGcmksIEFwciAxNCwgMjAyMyBhdCAwMTozMDozOUFNICswMDAwLCBWb2xvZHlteXIg
QmFiY2h1ayB3cm90ZToNCj4+ID4+ID4+IEFib3ZlIEkgaGF2ZSBwcm9wb3NlZCBhbm90aGVyIHZp
ZXcgb24gdGhpcy4gSSBob3BlLCBpdCB3aWxsIHdvcmsgZm9yDQo+PiA+PiA+PiB5b3UuIEp1c3Qg
dG8gcmVpdGVyYXRlLCBpZGVhIGlzIHRvIGFsbG93ICJoYXJtbGVzcyIgcmVmY291bnRzIHRvIGJl
IGxlZnQNCj4+ID4+ID4+IGFmdGVyIHJldHVybmluZyBmcm9tIHBjaV9yZW1vdmVfZGV2aWNlKCku
IEJ5ICJoYXJtbGVzcyIgSSBtZWFuIHRoYXQNCj4+ID4+ID4+IG93bmVycyBvZiB0aG9zZSByZWZj
b3VudHMgd2lsbCBub3QgdHJ5IHRvIGFjY2VzcyB0aGUgcGh5c2ljYWwgUENJDQo+PiA+PiA+PiBk
ZXZpY2UgaWYgcGNpX3JlbW92ZV9kZXZpY2UoKSBpcyBhbHJlYWR5IGZpbmlzaGVkLg0KPj4gPj4g
PiANCj4+ID4+ID4gSSdtIG5vdCBzdHJpY3RseSBhIG1haW50YWluZXIgb2YgdGhpcyBwaWVjZSBj
b2RlLCBhbGJlaXQgSSBoYXZlIGFuDQo+PiA+PiA+IG9waW5pb24uICBJIHdpbGwgbGlrZSB0byBh
bHNvIGhlYXIgSmFucyBvcGluaW9uLCBzaW5jZSBoZSBpcyB0aGUNCj4+ID4+ID4gbWFpbnRhaW5l
ci4NCj4+ID4+IA0KPj4gPj4gSSdtIGFmcmFpZCBJIGNhbid0IHJlYWxseSBhcHByZWNpYXRlIHRo
ZSB0ZXJtICJoYXJtbGVzcyByZWZjb3VudHMiLiBXaG9ldmVyDQo+PiA+PiBob2xkcyBhIHJlZiBp
cyBlbnRpdGxlZCB0byBhY2Nlc3MgdGhlIGRldmljZS4gQXMgc3RhdGVkIGJlZm9yZSwgSSBzZWUg
b25seQ0KPj4gPj4gdHdvIHdheXMgb2YgZ2V0dGluZyB0aGluZ3MgY29uc2lzdGVudDogRWl0aGVy
IHBjaV9yZW1vdmVfZGV2aWNlKCkgaXMNCj4+ID4+IGludm9rZWQgdXBvbiBkcm9wcGluZyBvZiB0
aGUgbGFzdCByZWYsDQo+PiA+DQo+PiA+IFdpdGggdGhpcyBhcHByb2FjaCwgd2hhdCB3b3VsZCBi
ZSB0aGUgaW1wbGVtZW50YXRpb24gb2YNCj4+ID4gUEhZU0RFVk9QX21hbmFnZV9wY2lfcmVtb3Zl
PyAgV291bGQgaXQganVzdCBjaGVjayB3aGV0aGVyIHRoZSBwZGV2DQo+PiA+IGV4aXN0IGFuZCBl
aXRoZXIgcmV0dXJuIDAgb3IgLUVCVVNZPw0KPj4gPg0KPj4gDQo+PiBPa2F5LCBJIGFtIHByZXBh
cmluZyBwYXRjaGVzIHdpdGggdGhlIGJlaGF2aW9yIHlvdSBwcm9wb3NlZC4gVG8gdGVzdCBpdCwN
Cj4+IEkgYXJ0aWZpY2lhbGx5IHNldCByZWZjb3VudCB0byAyIGFuZCBpbmRlZWQgUEhZU0RFVk9Q
X21hbmFnZV9wY2lfcmVtb3ZlDQo+PiByZXR1cm5lZCAtRUJVU1ksIHdoaWNoIHByb3BhZ2F0ZWQg
dG8gdGhlIGxpbnV4IGRyaXZlci4gUHJvYmxlbSBpcyB0aGF0DQo+PiBMaW51eCBkcml2ZXIgY2Fu
J3QgZG8gYW55dGhpbmcgd2l0aCB0aGlzLiBJdCBqdXN0IGRpc3BsYXllZCBhbiBlcnJvcg0KPj4g
bWVzc2FnZSBhbmQgcmVtb3ZlZCBkZXZpY2UgYW55d2F5cy4gVGhpcyBpcyBiZWNhdXNlIExpbnV4
IHNlbmRzDQo+PiBQSFlTREVWT1BfbWFuYWdlX3BjaV9yZW1vdmUgaW4gZGV2aWNlX3JlbW92ZSgp
IGNhbGwgcGF0aCBhbmQgdGhlcmUgaXMgbm8NCj4+IHdheSB0byBwcmV2ZW50IHRoZSBkZXZpY2Ug
cmVtb3ZhbC4gU28sIGFkbWluIGlzIG5vdCBjYXBhYmxlIHRvIHRyeSB0aGlzDQo+PiBhZ2Fpbi4N
Cj4NCj4gSWRlYWxseSBMaW51eCB3b24ndCByZW1vdmUgdGhlIGRldmljZSwgYW5kIHRoZW4gdGhl
IGFkbWluIHdvdWxkIGdldCB0bw0KPiByZXRyeS4gIE1heWJlIHRoZSB3YXkgdGhlIExpbnV4IGhv
b2sgaXMgcGxhY2VkIGlzIG5vdCB0aGUgYmVzdCBvbmU/DQo+IFRoZSBoeXBlcnZpc29yIHNob3Vs
ZCBiZSBhdXRob3JpdGF0aXZlIG9uIHdoZXRoZXIgYSBkZXZpY2UgY2FuIGJlDQo+IHJlbW92ZWQg
b3Igbm90LCBhbmQgaGVuY2UgUEhZU0RFVk9QX21hbmFnZV9wY2lfcmVtb3ZlIHJldHVybmluZyBh
bg0KPiBlcnJvciAoRUJVU1kgb3Igb3RoZXJ3aXNlKSBzaG91bGRuJ3QgYWxsb3cgdGhlIGRldmlj
ZSB1bnBsdWcgaW4gTGludXgNCj4gdG8gY29udGludWUuDQoNClllcywgaXQgd291bGQgYmUgaWRl
YWxseSwgYnV0IExpbnV4IGRyaXZlci9kZXZpY2UgbW9kZWwgaXMgd3JpdHRlbiBpbiBhDQpzdWNo
IHdheSwgdGhhdCBQQ0kgc3Vic3lzdGVtIHRyYWNrcyBhbGwgdGhlIFBDSSBkZXZpY2UgdXNhZ2Us
IHNvIGl0IGNhbg0KYmUgY2VydGFpbiB0aGF0IGl0IGNhbiByZW1vdmUgdGhlIGRldmljZS4gVGh1
cywgZnVuY3Rpb25zIGluIHRoZSBkZXZpY2UNCnJlbW92YWwgcGF0aCBlaXRoZXIgcmV0dXJuIHZv
aWQgb3IgMC4gT2YgY291cnNlLCBrZXJuZWwgZG9lcyBub3Qga25vdyB0aGF0DQpoeXBlcnZpc29y
IGhhcyBhZGRpdGlvbmFsIHVzZXMgZm9yIHRoZSBkZXZpY2UsIHNvIHRoZXJlIGlzIG5vIG1lY2hh
bmlzbXMNCnRvIHByZXZlbnQgcmVtb3ZhbC4NCg0KPiBXZSBjb3VsZCBhZGQgYSBQSFlTREVWT1Bf
bWFuYWdlX3BjaV90ZXN0IG9yIHNpbWlsYXIgdGhhdCBjb3VsZCBiZQ0KPiBwcm9ncmFtbWF0aWNh
bGx5IHVzZWQgdG8gY2hlY2sgd2hldGhlciBhIGRldmljZSBoYXMgYSBtYXRjaGluZyBwZGV2IGlu
DQo+IHRoZSBoeXBlcnZpc29yLCBidXQgSSBoYXZlIG5vIGlkZWEgaG93IHRoYXQgY291bGQgYmUg
dXNlZCBieSBMaW51eCBzbw0KPiBpdCdzIGV4cG9zZWQgdG8gdGhlIHVzZXIsIGFuZCBpdCBzZWVt
cyB0byBqdXN0IG1ha2UgdGhlIGludGVyZmFjZSBtb3JlDQo+IGNvbXBsaWNhdGVkIGZvciBub28g
cmVhbCBiZW5lZml0LCB3aGVuIHRoZSBzYW1lIGNvdWxkIGJlIGFjY29tcGxpc2hlZA0KPiBieSBQ
SFlTREVWT1BfbWFuYWdlX3BjaV9yZW1vdmUuDQoNCldlIGNhbiBpZ25vcmUgdGhlIGtlcm5lbCBi
ZWhhdmlvciBhbmQganVzdCBjYWxsDQpQSFlTREVWT1BfbWFuYWdlX3BjaV9yZW1vdmUgZnJvbSB0
b29sc3RhY2suIFNvbWV0aGluZyBsaWtlICJ4bA0KcGNpLWhvdHVucGx1ZyBTQkZEIi4gQnV0IHll
cywgdGhpcyB3aWxsIG1ha2UgaW50ZXJmYWNlIG1vcmUgY29tcGxpY2F0ZWQuDQoNCj4gTWF5YmUg
dGhlIG9ubHkgZmVhc2libGUgc29sdXRpb24gaXMgZm9yIHBjaV9yZW1vdmVfZGV2aWNlKCkgdG8g
ZHJvcCBhDQo+IHJlZmVyZW5jZSBleHBlY3RpbmcgaXQgd291bGQgYmUgdGhlIGxhc3Qgb25lLCBh
bmQgcHJpbnQgYSB3YXJuaW5nDQo+IG1lc3NhZ2UgaWYgaXQncyBub3QgYW5kIHJldHVybiAtRUJV
U1kuICBFeHBlY3RpbmcgYW55IHJlbWFpbmluZw0KPiByZWZlcmVuY2VzIHRvIGJlIGRyb3BwZWQg
YW5kIHRoZSBiYWNraW5nIHBkZXYgdG8gYmUgZnJlZWQuDQoNClNvLCBiYXNpY2FsbHkgaW4gdGhl
IHNhbWUgd2F5IGFzIEkgcHJvcG9zZWQgaW5pdGlhbGx5Pw0KDQotLSANCldCUiwgVm9sb2R5bXly

