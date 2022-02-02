Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582514A6DF9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:39:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263905.456779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFC5t-0003Ff-3o; Wed, 02 Feb 2022 09:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263905.456779; Wed, 02 Feb 2022 09:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFC5s-0003Dp-Vy; Wed, 02 Feb 2022 09:38:28 +0000
Received: by outflank-mailman (input) for mailman id 263905;
 Wed, 02 Feb 2022 09:38:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFC5r-0003Dj-55
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:38:27 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcf03928-840b-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 10:38:24 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2129EEWG005986;
 Wed, 2 Feb 2022 09:38:14 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dyq55g43c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 09:38:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PR3PR03MB6652.eurprd03.prod.outlook.com (2603:10a6:102:5f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 09:38:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 09:38:08 +0000
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
X-Inumbo-ID: dcf03928-840b-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDMTBMUsNmafXnOXFrQdpDyKOMCM0Mmd0BwWF+tZp4F29Cgnr7RYSxJWZ+neXNmmW+XRIkzQMednmEeyfBTdrdRigFhzD8FR7+F/iqd9PlFWzS4/eFF02Qb8VBVt1VnMTocumCv4X0ou1Le8PbyS9/vFsT8nzudymwaSINQytdq+y7b9PZgUPr4QU3ovIoZXWkYMNsrk1eXaVtVVKNnboYazBvJ6+DbDamQXM9SJ841KU0QrOjJ+9/foYmq7syjzMBjuoVmtxuffzC0nfdAT4Jlh+gFn9lnpfoxpw4cZEWAtaJ++k+q9Dd1EM8vccjoYBgmgTHnc+EBV4Xfad1IxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBRvPtEtgxqSu2mxwcRM/E8VUzwcld2hq0NFrRgnua8=;
 b=NOz3gULKQ3jzLHN981PbpOE0qEpyXRziD+MvpBUdpbDFKtjUK0Jm4sauQQtyZ6UoPWd1feOUc8fli7aUTxUKJ6He2F4inAnXQ3StFG8vUks/fkLuNUCweSAYrrdvn5KpsMr1nST4YzANcuNMYhspe/u2waqd8OZhD8afXss+CXPw6aM2aYpYKMMg2l0V6zpNf07jsxpCVKFKA9xfpJVcUbOcFc8Fg7+Yt2sUPbChIw4Ws/EIz3JVNNmcsbyvecrzvx4slAzQi9wdeSixmkQAcjVvbiKGckzzw+oUykj8SNdM4WIGoZX4vB2lYTScntO4zIjfT25J+Ot+Feul24wyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBRvPtEtgxqSu2mxwcRM/E8VUzwcld2hq0NFrRgnua8=;
 b=JRUFQ6GlGwzHRZ6TqWFDpzyULTbtEzDTsEvD79Hz+GcgJPiBrHLOfENDrbjkbfstSvTZ7JiPHfIOvyTSZP8kr3c2GHgTgxHH12o1Mo1vEOtxXjsllAKQ1opYD1dw9ASYz7KiZXeaLhPRwCMrEUyuFaImZkmWdVx0KMU/tNNA8N8t0tNO8+NM+E+XBxXeZ+PEywE/76iyqvg+qBDHW37NSHhJXK+KIafy/EO0BHR075OwkA72EW9Jkm80WoacYFFgnID8i81zu2UPUU8lIp2wOjijtf+FOpkDrmyNjwO8g4KG7+mpySFgr2Klpj1S0rFpOeBkWCUzvR1AJxmzZbo6fg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 3/4] vpci: shrink critical section in vpci_{read/write}
Thread-Topic: [PATCH 3/4] vpci: shrink critical section in vpci_{read/write}
Thread-Index: AQHYF4hObbqxIjaQNUeSdaSEPmZTi6x/8z+AgAAF24CAAAj/gA==
Date: Wed, 2 Feb 2022 09:38:08 +0000
Message-ID: <5ec87648-2783-d21a-ca7d-dc59180543d9@epam.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-4-andr2000@gmail.com> <YfpEiWT0NpYNSAks@Air-de-Roger>
 <5ed821ac-0a38-3c1a-a28a-c46295c2ffb4@suse.com>
In-Reply-To: <5ed821ac-0a38-3c1a-a28a-c46295c2ffb4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f0d8cf8-169b-40b3-8543-08d9e62fb87f
x-ms-traffictypediagnostic: PR3PR03MB6652:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR3PR03MB6652EF3FA9786A6D2DF22926E7279@PR3PR03MB6652.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2AWrG5sOwpPurVHpSTuNKL9qApiETJZ03icTtcsfg2VNGa3AQG7xIP5+SM8lKkdKzvKNR7kzITajRKIdhAa0NilWDpo32B1Ef1+BUCI1j4OdoXPybHJOMkJe3ULvRgJP788kmTrWocTEQF3Zys92M8537Jhmj3wJ7IuA6IGNSC2E/8v4sdhfOqWcxwGtCf/rojqFme5TR2RT/TfXNurZ2u22XEWB28GUaYrphFwotDZMNG5QVNAGhzN3J5iulAvokDgwXb/xVdok2ioNdbyp4n3BNXcu+FDoANx5T/XkjemZdKX+wv0WdYvs3HhFByFPuQ/r0+1QYUcE7Zm5TzTQzT73JltXbgY9iE3xVN1/IVyJU52MQMNnCISFBeFwXAgvYf99qeHjbIdYOfepPaP0HfJW+52LpAFof05Nrtd0zmF0xCVw/LPZfHpr/UZbQfY4zXzGo+Av9rcoYO5FXfCv+E4r3bpEQW0MgcRXTPOhmjSHIveSjcCdaEGzjdPRy1Y54Mr4UY2l/emv2dw2dVIRFENOwLGRRqlXs31D7D7wLQ62iroI0m7d/faO67aKt89T7ieJsKKapMEMqlSFbU2eSn/lI0Ab51esuzlFAi2imr6AETXhnIOZkZVPk74YimNaWA606an7QIvImCv7TWxs52HG6hUce1ggFFJ6RVEmK8dUwNLMXCSjbIcxSN378lV197VubBhOT6JVl1ZfSY5Z6zU262LLYR54ciaVXsYxlpvVBtW4SJSLvMtVGJUzSnc3cCHGVYy/IftYT1jcc53y/TXa1XET/Sv4A67Arvz3GuA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(83380400001)(26005)(2906002)(31686004)(5660300002)(36756003)(8936002)(8676002)(53546011)(31696002)(38070700005)(122000001)(110136005)(316002)(64756008)(66946007)(91956017)(71200400001)(4326008)(2616005)(107886003)(66556008)(66476007)(76116006)(66446008)(508600001)(6506007)(86362001)(6512007)(38100700002)(54906003)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cURIVVlQRy91NWVReTA2eEVRYWNZWXM3T2xKTzZKMHo1bVUxSk52RDRBQjZ6?=
 =?utf-8?B?dDRuZkNzOHlsM3NYZENUWkRSQVpIUXZRRlpjcmpEc0piUnoyMCtRYmNubDFw?=
 =?utf-8?B?bXpnbFlVZkwxbjlYK24xbE9lYzFtaHVMdTBlMk9ZN1prc1JQSm5GRUsrRkhG?=
 =?utf-8?B?R3QwWGYvTnpwanhvV1hrMVplZUZRQlJjWnkrRFc3TWVZZ2pVWTA2NS9JWU1U?=
 =?utf-8?B?c25tN2lzWjZtTTRaZkN1MURidlJlKzVoQlhraWpGdGFEejNQK29WWGVwRGsw?=
 =?utf-8?B?T0JBaXJReTVTaVlxVWt4Q2ZocXFTa1RwUjYzdk1WODQ5STRPZm9CZVpVbXpO?=
 =?utf-8?B?UExBOGM1OWhZYlFWdnRFQTgrcWpCUjROVGZFQVlkMDR2Q2dQc3F1NnlWVGVD?=
 =?utf-8?B?Qis0NnpYTHdGdzdLeDc4N1pUUUpJTm10czdIMmExMzZlQ1NGSUZvb243OGox?=
 =?utf-8?B?MWl1WDF4ZVhvQVNkdndEdHcyTHpVTjdMQTcyeldwb2xxUmlUYXBQQTBtZHo1?=
 =?utf-8?B?ekZweG5ZS3dJUVVmTWgzVzU4ckZ2QjZ4VEsvdTNGVm90Y0pkS1JkSUtrSUVL?=
 =?utf-8?B?TEhwbEdwSlB2ZitjRUROU0FKSGo5bkVNQ2R5SzMybFd5S3Brb2pIU2piT1VV?=
 =?utf-8?B?RWR3akI5VkMxcmNLbnl6UkxKNWZqWUdUQyswY3RLRzBOeUhZc2lxQXRXbk9a?=
 =?utf-8?B?a3pBQXUvRVNjNDZiVEljQStjY0EvWHNEd0VVL2xRTjcwTEJKLzdua1A3MURs?=
 =?utf-8?B?ekZwNGtHU3NuVXU4R1VYUkJOb0FTSkpteHQ3UkJVOHFLaUZIOGUwOUZWd01q?=
 =?utf-8?B?NU01SFNzTEFuTk5WMFR5emdBY0RJYmxXWkEwUnl6ZDVNVDBaVGJodlMrdTVo?=
 =?utf-8?B?ZUZRZTRJQ1lCcW1qemgrUnVCbmlacTJ1QkhWS2Npc3I4dHJqTnl6NUFiRlA2?=
 =?utf-8?B?eVdmaUxvUmxOT0hZZEdOSFVMSXJoWFB5bDFMc010cEg2RGtUOUxZdUVocXJK?=
 =?utf-8?B?V1BDYmNZVXp2SnRWNWt0Zytxc1Z6ZlJWblRWMFJYb2psZyt1NkhoWmRGN29V?=
 =?utf-8?B?Njk1NGhBQnNiUklUTk1ydlJYVTlFVXFRSmlYd1ZWN21FWGJZQlFHeitLNUV2?=
 =?utf-8?B?bmZNWEtOMTZhdVQyRkFyZzJJS1Z1Q25vSTJ2TkNuRXNlWmloR1JvSzNtakQ4?=
 =?utf-8?B?cHJCSCs0eHhncENDQnYxaVUyY0pOa2JycEhGZFFYZzRYOTBRck5CK0swRWkr?=
 =?utf-8?B?TjBmUE5BRUZWdDJUcHBwdTlqdWZPTzhuRTRCUjNRZDFlN0pIdnEyeFlKTXl6?=
 =?utf-8?B?SWl1a1dSLzRPWHlPV25mSXdYcG1KVldCWkxUdnZHd0N3cUx6SjI2VC9qUlJ4?=
 =?utf-8?B?REV0STRDMCsvRXg4a0FyK3FKVG5EV1ZuWFBrRlpBMFhkN0ZWVGJ1OUZtV1dS?=
 =?utf-8?B?Z3pVM1dwZUxqTW5aVDRaQXJlcXl6cnR5eURCcXQxKzVJSEpMbnFtMGJUMUxQ?=
 =?utf-8?B?SjhxQ3VHb0dNOTdYVGljcldNaS9IOHdBbDlMUWVLK08zYWI2T3EyMUdZUXk2?=
 =?utf-8?B?NTdBWmxZcjFIZHQ4RllOTyt5SDNsYjB5ZzJNb1pQNy9SR3BFbG9FQVJYYnp2?=
 =?utf-8?B?YjZFVG9tVXNURlJpUndJK2ZMcmVvaVhMTmYvUnh5QWtjNnhOQTBsMXpLczdt?=
 =?utf-8?B?cys3M0pzZkpWblVXZEhLQjZoVlJZR1dZa0xUNUFJV3VTNEJCV0Rsazdqa0d1?=
 =?utf-8?B?eHplRDlxNjQzUDI0WmJwblBrVWFSazlKSndwajJlbTZpZi9qcHZoTUhQMnZY?=
 =?utf-8?B?R05aOXNlQll2c01GTmF4cjY4MldWUVo4SXo1MmU4QjB1b2FtYmxhcEtGUHJn?=
 =?utf-8?B?dzMzZ21iNmlPVVh3Ym82b2N6MWpLZ1VLM201bW9lSkZ1a0FIaEFRMU1lUEpE?=
 =?utf-8?B?WEl6ck5xekF3VExrcXN2T2VOOHRMT1NGQlEwbEpGWjVaNzhLNVNCSmVBVWlE?=
 =?utf-8?B?MWFvUUtwQU9Wa1lOSTZaSVJCOGFSYkZxTU1KTFNHMk82d2pHdUlRdWNoR29q?=
 =?utf-8?B?a3hUcUtUWktwSmoxTVBvYnd1MlBQM3Exa1lxWWJLdnpsMm1zejRaS3RNMThW?=
 =?utf-8?B?b2V4b2ZzOXRZUW9LckZKTlppUGRtTnRJcmQrSEJjT244K2x6RnpDS20wdEwv?=
 =?utf-8?B?UWVIUkdZNk9YMlhSR3FoUFVYYVFlUU04T01NZlQ0T1o0dm95TlhqTW85ZUlJ?=
 =?utf-8?B?M3U1QTZEMW53VFErT3VtWkl2K2RycUtGaHJEL1NhbXd2czFQNkFTaElZQUt0?=
 =?utf-8?B?Z09PaXhrSkJjaVg2blNsWDJxbGdZSjB2MG5QZ3NYT1o5akdocnJpQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FC12A04115EBF458D1B11F6D39712DA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0d8cf8-169b-40b3-8543-08d9e62fb87f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 09:38:08.1602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PNGbC+wJtzYojUuZmII4UCevhWyAsBu38Jj/Q1wx2fkO4l4tSucx4GkfagMxJPGoeoSPNojL0HYpvMl0hbfJyTF1Cleo9jPktarfAkUXfePfLtyNJh4wOrEwCYGvsNmN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6652
X-Proofpoint-GUID: Ix54LoGBQsHGCW7CHnVOb3-Yezd1uS89
X-Proofpoint-ORIG-GUID: Ix54LoGBQsHGCW7CHnVOb3-Yezd1uS89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_03,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202020049

SGksIEphbiENCg0KT24gMDIuMDIuMjIgMTE6MDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
Mi4wMi4yMDIyIDA5OjQ0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4gT24gVHVlLCBGZWIg
MDEsIDIwMjIgYXQgMDY6MjU6MDdQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3Jv
dGU6DQo+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KPiBPbGVrc2FuZHIsIGNhbiB5b3UgcGxlYXNlIGNsYXJpZnkgYXV0
aG9yc2hpcCBoZXJlPyBUaGUgcnVsZSBvZiB0aHVtYiBpcw0KPiB0aGF0IEZyb206IG1hdGNoZXMg
Li4uDQo+DQo+Pj4gU2hyaW5rIGNyaXRpY2FsIHNlY3Rpb24gaW4gdnBjaV97cmVhZC93cml0ZX0g
YXMgcmFjaW5nIGNhbGxzIHRvDQo+Pj4gdnBjaV97cmVhZCx3cml0ZX1faHcoKSBzaG91bGRuJ3Qg
YmUgYSBwcm9ibGVtLiBUaG9zZSBhcmUganVzdCB3cmFwcGVycw0KPj4+IGFyb3VuZCBwY2lfY29u
Zl97cmVhZCx3cml0ZX0gZnVuY3Rpb25zLCBhbmQgdGhlIHJlcXVpcmVkIGxvY2tpbmcgKGluDQo+
Pj4gY2FzZSBvZiB1c2luZyB0aGUgSU8gcG9ydHMpIGlzIGFscmVhZHkgdGFrZW4gY2FyZSBpbiBw
Y2lfY29uZl97cmVhZCx3cml0ZX0uDQo+Pj4NCj4+PiBQbGVhc2Ugbm90ZSwgdGhhdCB3ZSBhbnl3
YXlzIHNwbGl0IDY0Yml0IHdyaXRlcyBpbnRvIHR3byAzMmJpdCBvbmVzDQo+Pj4gd2l0aG91dCB0
YWtpbmcgdGhlIGxvY2sgZm9yIHRoZSB3aG9sZSBkdXJhdGlvbiBvZiB0aGUgYWNjZXNzLCBzbyBp
dCBpcw0KPj4+IHBvc3NpYmxlIHRvIHNlZSBhIHBhcnRpYWxseSB1cGRhdGVkIHN0YXRlIGFzIGEg
cmVzdWx0IG9mIGEgNjRiaXQgd3JpdGU6DQo+Pj4gdGhlIFBDSShlKSBzcGVjaWZpY2F0aW9uIGRv
bid0IHNlZW0gdG8gc3BlY2lmeSB3aGV0aGVyIHRoZSBFQ0FNIGlzIGFsbG93ZWQNCj4+PiB0byBz
cGxpdCBtZW1vcnkgdHJhbnNhY3Rpb25zIGludG8gbXVsdGlwbGUgQ29uZmlndXJhdGlvbiBSZXF1
ZXN0cyBhbmQNCj4+PiB3aGV0aGVyIHRob3NlIGNvdWxkIHRoZW4gaW50ZXJsZWF2ZSB3aXRoIHJl
cXVlc3RzIGZyb20gYSBkaWZmZXJlbnQgQ1BVLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTog
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29t
Pg0KPiAuLi4gdGhlIGZpcnN0IFMtby1iLCBhcyB0aGVzZSBhcmUgZXhwZWN0ZWQgdG8gYmUgaW4g
Y2hyb25vbG9naWNhbA0KPiBvcmRlci4NCldlbGwsIEkgd2FzIG5vdCBzdXJlIGhlcmU6IHRoZSBp
ZGVhIGFuZCB0aGUgb3JpZ2luYWwgY29kZSBiZWxvbmdzDQp0byBSb2dlciBhbmQgaXQgd2FzIGEg
cGFydCBvZiBhIGRlZGljYXRlZCBvdGhlciBwYXRjaC4gU28sIHRlY2huaWNhbGx5LA0KdGhpcyBw
YXRjaCBkaWRuJ3QgZXhpc3QgYmVmb3JlIGFuZCBSb2dlciBoYXNuJ3QgY3JlYXRlZCBpdCAodGhl
IHBhdGNoKS4NClNvLCB0aGlzIGlzIHdoeSBJJ20gaW4gZG91YnQgaGVyZTogc2hvdWxkIEkgY2hh
bmdlIHRoZSBhdXRob3JzaGlwDQp0byBSb2dlcidzPyBJIGhhZCBubyBtZWFucyB0byBvZmZlbmQg
YW55b25lIGhlcmUgbm9yIEkgcHJldGVuZA0KZm9yIHRoZSBhdXRob3JzaGlwIGluIGFueSBmb3Jt
Lg0KDQpJIHdvdWxkIGxpa2UgdG8gYXBvbG9naXplIGlmIGFueW9uZSBmZWVscyBvZmZlbmRlZCBi
ZWNhdXNlIG9mIHRoZSBhdXRob3JzaGlwDQoNClBsZWFzZSBoZWxwIG1lIHVuZGVyc3RhbmQgd2hh
dCBpcyB0aGUgcmlnaHQgYXBwcm9hY2ggaGVyZS4NCj4NCj4+IEFja2VkLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gSSdsbCB0YWtlIHlvdXIgdW5jb25zdHJh
aW5lZCBhY2sgdG8gaW5kaWNhdGUgdGhhdCB5b3UncmUgYWxzbyBmaW5lDQo+IHdpdGggdGhpcyBn
b2luZyBpbiByaWdodCBhd2F5OyBzZWUgbXkgcmVwbHkgdG8gMC80IGFzIHRvIHRoZSBlYXJsaWVy
DQo+IHR3byBwYXRjaGVzLiBQbGVhc2UgbGV0IG1lIGtub3cgKHNvb25pc2gpIGlmIEkgc2hvdWxk
bid0IG1ha2UgdGhpcw0KPiBpbXBsaWNhdGlvbiwgYnV0IEkgc2hhbGwgd2FpdCB3aXRoIGNvbW1p
dHRpbmcgZm9yIGNsYXJpZmljYXRpb24gb2YNCj4gdGhlIHF1ZXN0aW9uIGZ1cnRoZXIgdXAgYW55
d2F5Lg0KSSB3b3VsZCBwb3N0cG9uZSBwYXRjaGVzIFswOyAxXSBhbmQganVzdCBnbyB3aXRoIFsz
OyA0XSBpZiB5b3VyIHdpbGwNCklmIG5vdCwgdGhlbiB0aGUgd2hvbGUgc2VyaWVzIGNhbiBiZSBw
b3N0cG9uZWQgdW50aWwgSSBoYXZlIHRoZQ0KYmlnZ2VyIG9uZSByZWFkeS4NCj4NCj4+IFdvdWxk
IGxpa2UgdG8gbWFrZSBzdXJlIHdoZXRoZXIgSmFuIHN0aWxsIGhhdmUgY29uY2VybnMgYWJvdXQN
Cj4+IHNwbGl0dGluZyBhY2Nlc3NlcyB0aG91Z2guDQo+IEkgY29udGludWUgdG8gYmUgYSBsaXR0
bGUgY29uY2VybmVkLCBidXQgYXMgbG9uZyBhcyB0aGUgZGVjaXNpb24gaXMNCj4gdGFrZW4gY29u
c2Npb3VzbHkgKGFuZCB0aGlzIGlzIHJlY29yZGVkIGluIHRoZSBkZXNjcmlwdGlvbiksIHdoaWNo
DQo+IGNsZWFybHkgaXMgdGhlIGNhc2Ugbm93LCBJIGhhdmUgbm8gb2JqZWN0aW9ucy4gSW4gdGhl
IGVuZCB3ZWxsDQo+IGJlaGF2ZWQgT1NlcyB3aWxsIHN1aXRhYmx5IHNlcmlhbGl6ZSBhY2Nlc3Nl
cyB0byBjb25maWcgc3BhY2UgYW55d2F5Lg0KPg0KPj4gQWxzbyBzaW5jZSBJJ20gdGhlIG1haW50
YWluZXIgd2UgbmVlZCBhIFJldmlld2VkLWJ5IGZyb20gc29tZW9uZSBlbHNlLg0KPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPg0KPiBJJ20gbm90IHN1cmUg
dGhpcyBpcyBzdHJpY3RseSBuZWVkZWQgdGhvdWdoOiBJJ2QgZ2VuZXJhbGx5IGNvbnNpZGVyDQo+
IGEgMm5kIChsYXRlcikgUy1vLWIgYXMgdmFsaWQgc3RhbmQtaW4gZm9yIFItYiwgYXQgbGVhc3Qg
YXMgbG9uZyBhcw0KPiB0aGUgMm5kIGF1dGhvciBkb2Vzbid0IHNjb3BlLXJlc3RyaWN0IHRoZWly
IHRhZy4NCj4NCj4gT25lIGZ1cnRoZXIgcmVtYXJrIHRob3VnaDogVGhlIHJlc3VsdGluZyBhc3lt
bWV0cnkgb2YgdGhlIGxvY2tpbmcNCj4gKGNvdmVyaW5nIHRoZSAiaGVhZCIgaHcgcmVhZCBidXQg
bm90IHRoZSAidGFpbCIgb25lKSBsb29rcyBhIGxpdHRsZQ0KPiBvZGQsIGJ1dCBJIHdpbGwgYWRt
aXQgdGhhdCBJIGRvbid0IHNlZSBhIGdvb2Qgd2F5IHRvIHJlc3RvcmUgc3ltbWV0cnkuDQo+DQo+
IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

