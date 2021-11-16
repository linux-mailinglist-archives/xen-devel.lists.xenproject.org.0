Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9D6452CAA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 09:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226197.390814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtki-0008CD-AM; Tue, 16 Nov 2021 08:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226197.390814; Tue, 16 Nov 2021 08:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtki-00089B-6Y; Tue, 16 Nov 2021 08:23:40 +0000
Received: by outflank-mailman (input) for mailman id 226197;
 Tue, 16 Nov 2021 08:23:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oQI=QD=epam.com=prvs=1954156bad=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mmtkg-000895-JS
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 08:23:38 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dbd4c60-46b6-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 09:23:36 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG84TVD016214;
 Tue, 16 Nov 2021 08:23:33 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cc8ta02cw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 08:23:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5698.eurprd03.prod.outlook.com (2603:10a6:208:171::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 08:23:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 08:23:22 +0000
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
X-Inumbo-ID: 7dbd4c60-46b6-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYGLGognEZmWxFE2Dx02XyPMUNZu0YS+s6qVq8snGm6cXOLm/klFjEE/3PteioZNQK9PdjOud0xx+BrVIquesdTTSI7+x+C087vxPSuq49Gzn3z8Wr5KRyk3K9eWDAQJliio76PTl1HTcRqEf/L9LtNgBfp8s3Mn2TjgIVzONENoRcNZ+r3Xi06s8671wy/pUV4uGNsj5BQVTH/GlLQT4wAoUlV7J7Z3JOvtjy8G3ZK35PxGIGqgS0bvNKJZv9wcdYnMFjX9OEtr2RzmL6fXTo5dqVWYxNSAxOHaNPyjAwnCFDh0jKC7lgaYCg0IfHvfhT/s3cdiUuJYIGlrvEa3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNvNXv2yfdVGZfhl+yQfUPdOI5uAQYgfoNLray0+hXo=;
 b=AU5061anWKrfU9Xfq20A+4QESeeowq2cT0mvi6g/HPvbxmvO0SYZeOAQjU4+i3xTUTnX5//DGEkutxPglxza19v1ZbkfdfYRTafUy+bguYjma10KxgjM/Iw4Xd/UAcktUOAiOuqbapXuo3CJuI2j9QkT3v5eafIdpdPXDmcU5Vf/OHXiyohmeLUfZrUrAZKB2LvH5iMc9nRWQvouPSAt9Ds2q2WXwgsPsXQxLHKVNk3vXEo6uBsTMQo5GebRQ/CpF2h9PDFu2ID+KsSAbnXbTU+mpshjX4GXpyYISO3ubSdS0MM9C6wS7mZ+8qFOtMiiqYg2AOFY/t6mxlNmhIdpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNvNXv2yfdVGZfhl+yQfUPdOI5uAQYgfoNLray0+hXo=;
 b=lk22HGWwP9mC8txT1Cosw05niQtsBA+txNVLJw702kiCh7pSzo3ZOdVyXRSw09weJoQLK5u1NNYwY0APXxA0wucUAgyHfnWJNwAC9jqLTP8YwZoLGZomWhjT95EZbjcHjhnBlLJsUzmh9IDQgO8G42KtXyaB1BtRoHShx3GGJJOWqSl2MS0o7Y40nxQ7/8LYIxnrbiFFGMjUiytacyJruJQL5o6RsfsGabVmjHTQ6PJre8y0O0L5EJMf+voWCWOjRYGfQk9hyVrk370RttUPuvH4Lp0NGuHIIVZZoe+mF+Uf22xfoOG1wPj6jzH5ngzKkB6rjoxjsz1sLqfH6f5Z/w==
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
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: AQHX0hJIYALl/D9fL0OD6N0XGDJh2awE30EAgAD09oCAAAgGAIAABgyA
Date: Tue, 16 Nov 2021 08:23:22 +0000
Message-ID: <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
In-Reply-To: <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2acc44f1-1157-4582-2a83-08d9a8da5a80
x-ms-traffictypediagnostic: AM0PR03MB5698:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5698D9CCDEEB8A66E476E3E5E7999@AM0PR03MB5698.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1uugYKqABbOAbdf49Uza5niaO5BZR9vaxYizxGl9J0LkEyks1TkqsoJp5dR/+H0X1xoHfRhFoXKXlJ9kPfZ65jj/ph1XFOKTET4otTcwRd55dtsqGamR5KEfjA+tr7j84/LZfkB2vmm+kzDaMABEJEXKEbT26tFlmdeYng5r/qp3bJ9E35YvqtrjhwvC0Yh6NRgv2l2GgR4n0YWnYqGTwmjpaKLET634aV7JxAC+/fBuguJP9cpDyVXo5XYC+k/18kIeKO0AR6tFPdzkuyvsFvvTYIV7PA+WZD0y9ni2ddgGosBbOHYaZ2gEMuh2yUU9nsEow7UzQ0H3+OUobeuVc9pKZwzDVQIPKiVmdsaa++WKCQfAIgyWeisnajgN1OqBrEaHa/463kqMSlUP2LQCYMaGJpiuQHV2gkH/H5SfoXeOYz0cmHVFtOC2q7w0F5nDHDXJpRoXkL35WMjIH3+f5FWczMW0akSPeW5GuAGgSy+v+JmCtN00HUxo+yVZHqy+DSVnvOg/Ll20LvVzyXVu66XUChC+rCHRVQ1YPfNBU5hEItHwlwlrL/5NcMAZFTwfhKz1cl77JqnuhyvqbwC7IWFfDhZroUA1aPjJ3JMbs0FTcz+3FUdmyFy/682vGqxIeA3CBZ3RfadPm/UKW22lK9YlrMj0sI04H+MkLEgOtcYTrrlTzSnwP8KY0a1Stn4fxq0LTQz8MeX++qjWZKSBRuPk3gm42usaIT4lfKmdddYdHaApzrTXvZ8aIZw/Up9h
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(76116006)(36756003)(91956017)(6512007)(38100700002)(64756008)(26005)(2906002)(2616005)(186003)(6916009)(5660300002)(6506007)(53546011)(122000001)(6486002)(66556008)(66446008)(66946007)(66476007)(38070700005)(4326008)(508600001)(86362001)(8936002)(316002)(83380400001)(31686004)(54906003)(107886003)(31696002)(71200400001)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NHJvSHpyZWI1bTFMdHVYUHQweCsyMG05L2JKWHo5TVNhWXh4dzJCaExvcTRG?=
 =?utf-8?B?SWtXZmhJSnh1ZkM3RlNTakJRRDgzMXFyaGxsNW80bWVrcFo1S1cvejVweTRi?=
 =?utf-8?B?dFpQOU4vYzB3NUtHVk1sTkpSeS9pZXJ4amlXTG92ZmNjelhWdGpHVEQ0UVlk?=
 =?utf-8?B?L0dPdnVBa2NLM3VYWm9nZFJPc0tHOGsxY3pQTmxYTHd2d2dtM2NpelBkUjFj?=
 =?utf-8?B?enU5a1BLeVVXQ0pnckRGRlFWa0U4MHlYenRMRGVYZVVOSUl1Rm1wOVRyTXRv?=
 =?utf-8?B?bkRtc05EZGpCUTdhNW9uZ0Y2SEJwRklkMGVLbHBGbzFqZGNpdkpMRk5SMjFS?=
 =?utf-8?B?VHdwK0dsYnlkVUl4cHhlcEdCSy9MVWZGM2dxdUcyL1hoQnJGOW4zbVgyN3Jo?=
 =?utf-8?B?Vnc5Y3dBUFczWjJyZEhac0lUMWw2OFlsQmpYL1g2K2hWVFpGQzBWTGlRSTUv?=
 =?utf-8?B?RmZpenJaNnUvWWRjeklGWHlTK0NZUTRWVG9oZDJUbzhQV1JodU13U3VjUzdN?=
 =?utf-8?B?dXY5U1V1NkJIVEtOejRjMnA4VG1uVXF6NWhzVGVoalBnWDV6NHlFRE83TjlV?=
 =?utf-8?B?R1FRaEx1cmg1ZlljaHNtTW43SVZuZVYraE8yWXFZQVpUSDh3WFBITGtnM055?=
 =?utf-8?B?NjVyNjNnNmROSXI4VkM4WFVGaGJmUWs0eTNmQ0plZ3p3cS8xNmt0UCtTUlds?=
 =?utf-8?B?aXBpbitucjRkSk5qUkNKK3E0ZnZWOVUwYzlWUGNrcFA3YTZwZ1QvSENXdkxM?=
 =?utf-8?B?eXVySEZtRFhES2dRdTA2UVZUdVljSGpGOXNkS29pcGYrUytYaVJUU3ZYOHNB?=
 =?utf-8?B?ZVlFcHpYRlZSUUpodUUwRGh6MEVGQWNzS3FTbmJUQ0dsaktWUFZXcURZRUl1?=
 =?utf-8?B?YzRwS1VIQ2VTTW96c2djakdLVm1adWVtOXBmMzh0WGhaUlgvK1FTQmxoN2F6?=
 =?utf-8?B?S0ZmelBnc1pPUDFmdDF4NFQ0UkYvemJIYkVwVGFnRXAyVVFwV0dCS01EZHpn?=
 =?utf-8?B?TGRrd09OYlZ6TXpEelYyVCtWMGRPTnppbFUyUUJQYU92WXZjR081N2RLaHN6?=
 =?utf-8?B?ZlNxWUN1SVNIWDZ4RE9ZOUVaS3NGZkpiM2VyWndNRGZsNzd0c28ySEs1RWNR?=
 =?utf-8?B?M291MFdsSWhzbStoVDJXTzk2bmRvU1gyTkU3cCtrV00yQWhxVVNQcHppbzh0?=
 =?utf-8?B?SEhYYXpCMjNQVFRCQkJ5bEYwd0MwMlpOQTd5c0RmekFYaVQ4UlBKSWpsTldU?=
 =?utf-8?B?SlJRNytLaFdEQXM0Yy94a0x1eStHYlI2blloWFU2eit5OW9iMmVETzFQd1Fv?=
 =?utf-8?B?VGo4VmRsSmVTZTN3SUU4dzhoYzc2ZUZCTmhjVTJ1emRiMWtleUNQVVJtd3lP?=
 =?utf-8?B?VU5HUEpGMkc0TStUc01YSVRIUzFKK2J2emFNdDZ3d3c5aHBqeEdEUll6YU9J?=
 =?utf-8?B?NGdJcDByeXFVazhOaUZiUXFaeXVtdWJCaWRTWnIxV3JyRjd2dE9vWEdNaWtD?=
 =?utf-8?B?VHJrbm9TN1dkTHpjbEc5VEpmcUhnZFhzMEtHM2w3U2NtNCtoU21jRVpUb3JU?=
 =?utf-8?B?YS8xVFo4a0ZoKytucHd2WEV2TUhzM1hPN1Vpdk5qWW9XOUViT2cyaFNYdndr?=
 =?utf-8?B?aXdWRkRiMmNUbW5HNTlLODJFZ3pFTTlpRjRBNG80QU9ZTHVRSlVFWi9YcXk5?=
 =?utf-8?B?STZrM0RyS1lOL2RrV2RPdEo5MGM5VHNPbVRaakZ6VlpTQ2xieU1PS1duMzlD?=
 =?utf-8?B?V21QOFl2dTdFbDh5YVIrTC9nZEtkREJKeHFNd3BIdW5ZcWhralczd2N6TTZJ?=
 =?utf-8?B?SkhVdzNZMDR5QnRsOWtSZnF3MWFPZmk3VVFrZnd3S0ptU0VUd2h6cFJBc3c2?=
 =?utf-8?B?UWhOS2dXVU9hdytHVWZ0Z3dkclZZbDlJc3MwTkM0TVVjQ1pzN3c1dHQzQVJ2?=
 =?utf-8?B?dzJFSWR2ejJGay9oVVBQa2ZaSXVPWHplWTVDcXpVcEFPOVZISkhlYXAzakts?=
 =?utf-8?B?N29ERnN6UjFyNytkcnlBZHRuTG15SkhldG9EcTNCRUFCV2RBT3pFQmIwekV6?=
 =?utf-8?B?MFV4Y3labjJsOUpYSGdpQVBIVWxIbnRaWjNJOVN0Z2dFWFFaNmJLQ0dja3lv?=
 =?utf-8?B?MFl4NVFRS0x0bVVZUkRVR2tINUpZWkNSbXhiVkdzeDZZdFA2OTJ2QUxJSGE0?=
 =?utf-8?B?YjdPdHBNUlUyWWFnb01zaTlWL3JrbWtvbkRGU3d2b0hnQUgyWFk0ZUpDdWNr?=
 =?utf-8?B?U3o4eU9jWndROGtwbWdtblVlaVBCazB1azdVZFVPMnVjK0N2bFBuSVNXazd4?=
 =?utf-8?B?U1hKUFVRbmhNRjZQVWZOZCtFUzNIK1I3eXFpd2pGMEIycmt4QjFaQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <166438F939F82B4AA2F660ED3ABFF708@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acc44f1-1157-4582-2a83-08d9a8da5a80
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 08:23:22.2957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: el8Uht2erQfPofJu98ct6bZtXLMKNbQnj+oNzlU5Hdfivl3clHLar7ihVZ2mPiUFXxn8gB/qkUAl51cMRot30fwXOWLGWFbNbtRSnZz3EJSl5h9zu4DP1k1aN95TRQRG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5698
X-Proofpoint-GUID: L23f7q68ve4ZpNszXEwVPFBPV-V5QsHx
X-Proofpoint-ORIG-GUID: L23f7q68ve4ZpNszXEwVPFBPV-V5QsHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_16,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160042

DQoNCk9uIDE2LjExLjIxIDEwOjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMTEuMjAy
MSAwODozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxNS4xMS4yMSAx
ODo1NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDUuMTEuMjAyMSAwNzo1NiwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4NCj4+Pj4gV2hlbiBh
IHZQQ0kgaXMgcmVtb3ZlZCBmb3IgYSBQQ0kgZGV2aWNlIGl0IGlzIHBvc3NpYmxlIHRoYXQgd2Ug
aGF2ZQ0KPj4+PiBzY2hlZHVsZWQgYSBkZWxheWVkIHdvcmsgZm9yIG1hcC91bm1hcCBvcGVyYXRp
b25zIGZvciB0aGF0IGRldmljZS4NCj4+Pj4gRm9yIGV4YW1wbGUsIHRoZSBmb2xsb3dpbmcgc2Nl
bmFyaW8gY2FuIGlsbHVzdHJhdGUgdGhlIHByb2JsZW06DQo+Pj4+DQo+Pj4+IHBjaV9waHlzZGV2
X29wDQo+Pj4+ICAgICAgcGNpX2FkZF9kZXZpY2UNCj4+Pj4gICAgICAgICAgaW5pdF9iYXJzIC0+
IG1vZGlmeV9iYXJzIC0+IGRlZmVyX21hcCAtPiByYWlzZV9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJ
UlEpDQo+Pj4+ICAgICAgaW9tbXVfYWRkX2RldmljZSA8LSBGQUlMUw0KPj4+PiAgICAgIHZwY2lf
cmVtb3ZlX2RldmljZSAtPiB4ZnJlZShwZGV2LT52cGNpKQ0KPj4+Pg0KPj4+PiBsZWF2ZV9oeXBl
cnZpc29yX3RvX2d1ZXN0DQo+Pj4+ICAgICAgdnBjaV9wcm9jZXNzX3BlbmRpbmc6IHYtPnZwY2ku
bWVtICE9IE5VTEw7IHYtPnZwY2kucGRldi0+dnBjaSA9PSBOVUxMDQo+Pj4+DQo+Pj4+IEZvciB0
aGUgaGFyZHdhcmUgZG9tYWluIHdlIGNvbnRpbnVlIGV4ZWN1dGlvbiBhcyB0aGUgd29yc2UgdGhh
dA0KPj4+PiBjb3VsZCBoYXBwZW4gaXMgdGhhdCBNTUlPIG1hcHBpbmdzIGFyZSBsZWZ0IGluIHBs
YWNlIHdoZW4gdGhlDQo+Pj4+IGRldmljZSBoYXMgYmVlbiBkZWFzc2lnbmVkDQo+Pj4gSXMgY29u
dGludWluZyBzYWZlIGluIHRoaXMgY2FzZT8gSS5lLiBpc24ndCB0aGVyZSB0aGUgcmlzayBvZiBh
IE5VTEwNCj4+PiBkZXJlZj8NCj4+IEkgdGhpbmsgaXQgaXMgc2FmZSB0byBjb250aW51ZQ0KPiBB
bmQgd2h5IGRvIHlvdSB0aGluayBzbz8gSS5lLiB3aHkgaXMgdGhlcmUgbm8gcmFjZSBmb3IgRG9t
MCB3aGVuIHRoZXJlDQo+IGlzIG9uZSBmb3IgRG9tVT8NCldlbGwsIHRoZW4gd2UgbmVlZCB0byB1
c2UgYSBsb2NrIHRvIHN5bmNocm9uaXplIHRoZSB0d28uDQpJIGd1ZXNzIHRoaXMgbmVlZHMgdG8g
YmUgcGNpIGRldnMgbG9jayB1bmZvcnR1bmF0ZWx5DQo+DQo+Pj4+IEZvciB1bnByaXZpbGVnZWQg
ZG9tYWlucyB0aGF0IGdldCBhIGZhaWx1cmUgaW4gdGhlIG1pZGRsZSBvZiBhIHZQQ0kNCj4+Pj4g
e3VufW1hcCBvcGVyYXRpb24gd2UgbmVlZCB0byBkZXN0cm95IHRoZW0sIGFzIHdlIGRvbid0IGtu
b3cgaW4gd2hpY2gNCj4+Pj4gc3RhdGUgdGhlIHAybSBpcy4gVGhpcyBjYW4gb25seSBoYXBwZW4g
aW4gdnBjaV9wcm9jZXNzX3BlbmRpbmcgZm9yDQo+Pj4+IERvbVVzIGFzIHRoZXkgd29uJ3QgYmUg
YWxsb3dlZCB0byBjYWxsIHBjaV9hZGRfZGV2aWNlLg0KPj4+IFlvdSBzYXlpbmcgIndlIG5lZWQg
dG8gZGVzdHJveSB0aGVtIiBtYWRlIG1lIGxvb2sgZm9yIGEgbmV3IGRvbWFpbl9jcmFzaCgpDQo+
Pj4gdGhhdCB5b3UgYWRkLCBidXQgdGhlcmUgaXMgbm9uZS4gV2hhdCBpcyB0aGlzIGFib3V0Pw0K
Pj4gWWVzLCBJIGd1ZXNzIHdlIG5lZWQgdG8gaW1wbGljaXRseSBkZXN0cm95IHRoZSBkb21haW4s
DQo+IFdoYXQgZG8geW91IG1lYW4gYnkgImltcGxpY2l0bHkiPw0KQEAgLTE1MSwxNCArMTUxLDE4
IEBAIGJvb2wgdnBjaV9wcm9jZXNzX3BlbmRpbmcoc3RydWN0IHZjcHUgKnYpDQoNCiDCoMKgwqDC
oMKgwqDCoMKgIHZwY2lfY2FuY2VsX3BlbmRpbmcodi0+dnBjaS5wZGV2KTsNCiDCoMKgwqDCoMKg
wqDCoMKgIGlmICggcmMgKQ0KK8KgwqDCoMKgwqDCoMKgIHsNCiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyoNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEZJWE1FOiBpbiBjYXNlIG9m
IGZhaWx1cmUgcmVtb3ZlIHRoZSBkZXZpY2UgZnJvbSB0aGUgZG9tYWluLg0KIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICogTm90ZSB0aGF0IHRoZXJlIG1pZ2h0IHN0aWxsIGJlIGxlZnRvdmVy
IG1hcHBpbmdzLiBXaGlsZSB0aGlzIGlzDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogc2Fm
ZSBmb3IgRG9tMCwgZm9yIERvbVVzIHRoZSBkb21haW4gbmVlZHMgdG8gYmUga2lsbGVkIGluIG9y
ZGVyDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdG8gYXZvaWQgbGVha2luZyBzdGFsZSBw
Mm0gbWFwcGluZ3Mgb24gZmFpbHVyZS4NCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0K
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2cGNpX3JlbW92ZV9kZXZpY2Uodi0+dnBjaS5wZGV2
KTsNCisNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbih2
LT5kb21haW4pICkNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tYWluX2NyYXNo
KHYtPmRvbWFpbik7DQoNCj4NCj4+Pj4gQEAgLTE2NSw2ICsxNjQsMTggQEAgYm9vbCB2cGNpX3By
b2Nlc3NfcGVuZGluZyhzdHJ1Y3QgdmNwdSAqdikNCj4+Pj4gICAgICAgIHJldHVybiBmYWxzZTsN
Cj4+Pj4gICAgfQ0KPj4+PiAgICANCj4+Pj4gK3ZvaWQgdnBjaV9jYW5jZWxfcGVuZGluZyhjb25z
dCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gK3sNCj4+Pj4gKyAgICBzdHJ1Y3QgdmNwdSAq
diA9IGN1cnJlbnQ7DQo+Pj4+ICsNCj4+Pj4gKyAgICAvKiBDYW5jZWwgYW55IHBlbmRpbmcgd29y
ayBub3cuICovDQo+Pj4gRG9lc24ndCAiYW55IiBpbmNsdWRlIHBlbmRpbmcgd29yayBvbiBhbGwg
dkNQVS1zIG9mIHRoZSBndWVzdCwgbm90DQo+Pj4ganVzdCBjdXJyZW50PyBJcyBjdXJyZW50IGV2
ZW4gcmVsZXZhbnQgKGFzIGluOiBwYXJ0IG9mIHRoZSBjb3JyZWN0DQo+Pj4gZG9tYWluKSwgY29u
c2lkZXJpbmcgLi4uDQo+Pj4NCj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+
Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4gQEAgLTUxLDYgKzUxLDggQEAg
dm9pZCB2cGNpX3JlbW92ZV9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICAgICAg
ICAgICAgeGZyZWUocik7DQo+Pj4+ICAgICAgICB9DQo+Pj4+ICAgICAgICBzcGluX3VubG9jaygm
cGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+ICsNCj4+Pj4gKyAgICB2cGNpX2NhbmNlbF9wZW5kaW5n
KHBkZXYpOw0KPj4+IC4uLiB0aGlzIGNvZGUgcGF0aCwgd2hlbiBjb21pbmcgaGVyZSBmcm9tIHBj
aV97YWRkLHJlbW92ZX1fZGV2aWNlKCk/DQo+Pj4NCj4+PiBJIGNhbiBhZ3JlZSB0aGF0IHRoZXJl
J3MgYSBwcm9ibGVtIGhlcmUsIGJ1dCBJIHRoaW5rIHlvdSBuZWVkIHRvDQo+Pj4gcHJvcGVybHkg
KGkuZS4gaW4gYSByYWNlIGZyZWUgbWFubmVyKSBkcmFpbiBwZW5kaW5nIHdvcmsuDQo+PiBZZXMs
IHRoZSBjb2RlIGlzIGluY29uc2lzdGVudCB3aXRoIHRoaXMgcmVzcGVjdC4gSSBhbSB0aGlua2lu
ZyBhYm91dDoNCj4+DQo+PiB2b2lkIHZwY2lfY2FuY2VsX3BlbmRpbmcoY29uc3Qgc3RydWN0IHBj
aV9kZXYgKnBkZXYpDQo+PiB7DQo+PiAgIMKgwqDCoCBzdHJ1Y3QgZG9tYWluICpkID0gcGRldi0+
ZG9tYWluOw0KPj4gICDCoMKgwqAgc3RydWN0IHZjcHUgKnY7DQo+Pg0KPj4gICDCoMKgwqAgLyog
Q2FuY2VsIGFueSBwZW5kaW5nIHdvcmsgbm93LiAqLw0KPj4gICDCoMKgwqAgZG9tYWluX2xvY2so
ZCk7DQo+PiAgIMKgwqDCoCBmb3JfZWFjaF92Y3B1ICggZCwgdiApDQo+PiAgIMKgwqDCoCB7DQo+
PiAgIMKgwqDCoMKgwqDCoMKgIHZjcHVfcGF1c2Uodik7DQo+PiAgIMKgwqDCoMKgwqDCoMKgIGlm
ICggdi0+dnBjaS5tZW0gJiYgdi0+dnBjaS5wZGV2ID09IHBkZXYpDQo+IE5pdDogU2FtZSBzdHls
ZSBpc3N1ZSBhcyBpbiB0aGUgb3JpZ2luYWwgcGF0Y2guDQpXaWxsIGZpeA0KPg0KPj4gICDCoMKg
wqDCoMKgwqDCoCB7DQo+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmFuZ2VzZXRfZGVzdHJv
eSh2LT52cGNpLm1lbSk7DQo+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdi0+dnBjaS5tZW0g
PSBOVUxMOw0KPj4gICDCoMKgwqDCoMKgwqDCoCB9DQo+PiAgIMKgwqDCoMKgwqDCoMKgIHZjcHVf
dW5wYXVzZSh2KTsNCj4+ICAgwqDCoMKgIH0NCj4+ICAgwqDCoMKgIGRvbWFpbl91bmxvY2soZCk7
DQo+PiB9DQo+Pg0KPj4gd2hpY2ggc2VlbXMgdG8gc29sdmUgYWxsIHRoZSBjb25jZXJucy4gSXMg
dGhpcyB3aGF0IHlvdSBtZWFuPw0KPiBTb21ldGhpbmcgYWxvbmcgdGhlc2UgbGluZXMuIEkgZXhw
ZWN0IHlvdSB3aWxsIHdhbnQgdG8gbWFrZSB1c2Ugb2YNCj4gZG9tYWluX3BhdXNlX2V4Y2VwdF9z
ZWxmKCksDQpZZXMsIHRoaXMgaXMgd2hhdCBpcyBuZWVkZWQgaGVyZSwgdGhhbmtzLiBUaGUgb25s
eSBxdWVzdGlvbiBpcyB0aGF0DQoNCmludCBkb21haW5fcGF1c2VfZXhjZXB0X3NlbGYoc3RydWN0
IGRvbWFpbiAqZCkNCnsNCltzbmlwXQ0KIMKgwqDCoMKgwqDCoMKgIC8qIEF2b2lkIHJhY2luZyB3
aXRoIG90aGVyIHZjcHVzIHdoaWNoIG1heSB3YW50IHRvIGJlIHBhdXNpbmcgdXMgKi8NCiDCoMKg
wqDCoMKgwqDCoCBpZiAoICFzcGluX3RyeWxvY2soJmQtPmh5cGVyY2FsbF9kZWFkbG9ja19tdXRl
eCkgKQ0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FUkVTVEFSVDsNCg0Kc28gaXQg
aXMgbm90IGNsZWFyIHdoYXQgZG8gd2UgZG8gaW4gY2FzZSBvZiAtRVJFU1RBUlQ6IGRvIHdlIHdh
bnQgdG8gc3Bpbj8NCk90aGVyd2lzZSB3ZSB3aWxsIGxlYXZlIHRoZSBqb2Igbm90IGRvbmUgZWZm
ZWN0aXZlbHkgbm90IGNhbmNlbGluZyB0aGUNCnBlbmRpbmcgd29yay4gQW55IGlkZWEgb3RoZXIg
dGhlbiBzcGlubmluZz8NCj4gICBhbmQgSSBkb24ndCB1bmRlcnN0YW5kIHRoZSBwdXJwb3NlIG9m
DQo+IGFjcXVpcmluZyB0aGUgZG9tYWluIGxvY2suDQpZb3UgYXJlIHJpZ2h0LCBubyBuZWVkDQo+
DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

