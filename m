Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CC54A72FC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 15:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264240.457265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGam-0003nf-SS; Wed, 02 Feb 2022 14:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264240.457265; Wed, 02 Feb 2022 14:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGam-0003l8-PG; Wed, 02 Feb 2022 14:26:40 +0000
Received: by outflank-mailman (input) for mailman id 264240;
 Wed, 02 Feb 2022 14:26:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFGam-0003kz-03
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 14:26:40 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 219286d1-8434-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 15:26:38 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212EPgO5007516;
 Wed, 2 Feb 2022 14:26:33 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dyu8f06ha-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 14:26:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB4472.eurprd03.prod.outlook.com (2603:10a6:20b:7::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Wed, 2 Feb
 2022 14:26:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:26:28 +0000
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
X-Inumbo-ID: 219286d1-8434-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBRNT6xorAXLxlhuA+daPF0dGeVxmTXjyzMoW3F4iQhtS78EfBcMO0HgyE3xmMwemE+AdH7lHAY9R6izVNoD9a/qjkFQjCDcdHT0HU395sItrrVQVIewbicVJ+bLUgfIKF1TEDm91DDEIfO2K7rwlMoWPtZG6K4dPniSbhFxWLBKJqZfN8QA1b81/XNClgrOiQmijRpZWE4sa1qLgJQJkZ1ctahU1ScdWRBWrWpMZJSiammYNBXBuj6EtJ8MlmmQK2kbQBVItwgGPtVfP3FnLz6ESDKKNjpbMlc3LCKbEX0lOJyweBXhY6feF99aakgnGMN50bzmH1lMrHo2ESWYZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/X+1QhiN0fdyjex7rVdhD1GO2tIRkk5nPQlaePxIvQ=;
 b=bmKHQA4heBAHSgZLswkNAlKwSBN4IoqF4I4xrz6Evb2kT975h5mtFo2L4RYdJ/I/0gPyvtFOYrqHsXmX05UYHwQbKc7xD++B5dcoB4g6MKqizf+i+/HtrucX+k8vY/Cggk7Sfg5moyc5BArWenzPPg806kQbiNg07SkNMIHwgPpjon0kG+Jl3qB18FtIFoCAYWrinYlQ9NJ733ig2xqi6/xVIJWjoxI0Viqm8auOSauMssTQZs9XjalP6OeGsanns0gzRySqgcfjj6JTgp6qO/h4XIQspDnSjJS95GTrxDgNJu9I6EZia4eGpvP80Zji44gg7cgj2bjjiIqB4eVEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/X+1QhiN0fdyjex7rVdhD1GO2tIRkk5nPQlaePxIvQ=;
 b=jfYkx7FkizDQcFJBbpV7eb+0LbNSegMQJ2VEzHMxB1nFbpLWgKRmSgEXxPOOSdHccrx6sUNHpM+ApQm72BULi3D2G9PLilwSldsafT1jcM8v/0mPiYpERWlEtsBRlJTgWCBYndTRZDWG9yEvFl/KlcX+ezdXVx5QOESDlq7FQBAmmdLZd+iZeCtTikzOBJQGq2YopX9aYg89QbZiv8NTjeq2syAx1nm/H7K3LT+zPTt7EWUr+aijIDihb96kEhAFYuwRXYaOYAa8sDVzsWCrCSvkrIVaynr7AIevSsiJV1jD16M3poyU2uhm8MTpzj+w43l4lZyKkcYGgc3x7SVV/A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHX4ewK3mPSKCsK30iVfRQpWoVIB6xhEugAgB+P6YCAAAvvAIAABD6AgAAIlwCAAAJMgA==
Date: Wed, 2 Feb 2022 14:26:28 +0000
Message-ID: <37313b25-ccbe-fbfd-8306-7a96ce83c818@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-10-andr2000@gmail.com>
 <YeAD9PH9o65o+M+w@Air-de-Roger>
 <6a31eb29-81b6-7553-897f-2e5e54bab9b8@epam.com>
 <d527740a-4d90-4155-13dc-5888e8acfa72@suse.com>
 <b9661d86-f084-9ad1-59d5-538113000393@epam.com>
 <ab68568c-461e-bef5-4218-07db8e837bcc@suse.com>
In-Reply-To: <ab68568c-461e-bef5-4218-07db8e837bcc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b39e1197-5dda-4f2e-fcc5-08d9e6580044
x-ms-traffictypediagnostic: AM6PR03MB4472:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB44727709E8D0104E213017EAE7279@AM6PR03MB4472.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qoqsXE3+izKsKWWCjTalywr7Cx+SF6PTRVEUKZ7nK4krTjskyiTIwwIXww9It7IWeJwQVgFCS3LsGNe7VjPCV7fusZwrxW6SuqS7a8M26AwlMi0BrZZjAYS/O7L3QgdK+w2zgoJ3iFaedFb6gxZkRQyZffniYGUg56j7SPf1oa1AiMqoDS1YtjKUBJS0i5I+dVO5sDMCV8Xs+yQ/AGPT3W2NUZMIuLtya/XZzfvZfh2IkhMPwsSTgrkWStp/ho3h4gOtjaj8bqPm+qIgtV5zsc+CcbZ4MWulptK9lwXpUX6nrgFn+GO2gC5zl4+O48UXfPDL+u+nMNB9lttXRI7VSeo7oDPf8Tc7yPgPG7VyzgkaYDXvv/s4cHf763AopuG5nJrhT8gKOeB15dlbSQnxRe6MEePSR8R8Pc6tTXDdz9/DrDQJXeicGEpoSdLgAdc+v8QldYOkwSP2IR4yyAGIU1Kh1KS9R+MTvDyM/6lZFAPexw/UYt4ahJk9iLFvClJDbU1VFEHL1su91c0TvqjUbrCneOc6LjBY8PxyE5X/zxR500m6lvboOfczdcyRc2Ta5O+FEirCxNB2PRGCFK58y8PBbVn40hnOxhgoyw76FyKengY7UN/IP5yHcucNazjC7iA7uLSMmlgjnd40VXnXK3iREqNF2nfwjS7/400mM1QBeqEuKltmNZCDExn2g17o2lBs14R0ITKaob5rO/RKnUv+rQhnA3oQKBPCnueyo8CDQ4O9u5w4rLgOoRYJscyo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(76116006)(4326008)(8936002)(8676002)(26005)(6486002)(64756008)(186003)(54906003)(66946007)(66476007)(2616005)(86362001)(2906002)(91956017)(31696002)(6916009)(66446008)(107886003)(53546011)(508600001)(71200400001)(316002)(7416002)(6506007)(6512007)(36756003)(122000001)(31686004)(83380400001)(5660300002)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SWZZYkZmcXVmNi9vZ0wyZ250aGJrWGptcXhnVEFRUjBlclhKU1NTd2xrZDVI?=
 =?utf-8?B?ak9MY0piM0kwQTlWMG5hS01UR3ozUGw0OXpyZlpBWlgwZStKR3BRZGxia1R4?=
 =?utf-8?B?cWRSaDZwaENYNFh5QlFId1h2RFFudS9xbnJvcnBybEY2YTd4dDFreHh1RWV3?=
 =?utf-8?B?VjNkR1BiQmM5OWQ1clozVXpCaGp5RUNGaHoxN2JBWXM1R3UrQnJXeGUrYmNU?=
 =?utf-8?B?aUs0TnJCV2pqOWlwcnNxUlVGekNSQnlTbmdDK0tITFVJYW5IN3NZeEQ0NTB5?=
 =?utf-8?B?bnFSWFJRY0lyb0dSd0ZFVERNU0JEZ1p0cnFVSkVuS29Na3ZYb0c2TTEwVVA2?=
 =?utf-8?B?Z015Q3gwdnVPRzNzQjVaY0xBLy9TVTAvV3NVcGFhYnNxR1NUOG5PZllqckJO?=
 =?utf-8?B?YkRHL3pKbU1VeGo0czlQN0dwMnJ3YW9oNnVFaDUrUjV2N3hVcUZBZEs2d0lH?=
 =?utf-8?B?VXJTd2FWdFlGekpHMjZ2aUVkVUE3VXNlYUQ2bUJjZWJpbWRLT2dkWEh3TGRu?=
 =?utf-8?B?NkEzK3k0WVk0UnpQRE53Y3BkSm04cVJBZnhDT2xuWUNKYVA0d0crS3pMZjl3?=
 =?utf-8?B?d0RwSTZuVWNna3g5Um93cm10QXd5VjhKMEVjdmxuaDFFTC9XVFVUMUp0UTM2?=
 =?utf-8?B?VGh2VzBKUVdHUENqWUFQL1N3dFNTY3pxa0FLUGd1eDExWmh0am43UnliRWlC?=
 =?utf-8?B?ZXhhSmdtUkFpRzVaaGJxNFFmYnNXSlhQTnltTEpMUjRTMWRpWGIyeHViZTFQ?=
 =?utf-8?B?a2lTVkJJUlhZV3UxcncyN1d1YllvY1QvTGRFd1c4ajYwUmIxdGQrWDVIMWps?=
 =?utf-8?B?YlQwRDlpcU1iOXl1aXZ0cUpRcWRBRlY4SFNvd1NmYTA2WlhXKzJMckc4UEp4?=
 =?utf-8?B?SGFjYWdXYmU0alU3c1JrNlBoLzZ2c3ZEREV6QXdmU2VVc1dFWHFSb1VORm5Z?=
 =?utf-8?B?ejFLWXBQOGRrZ0FZN3NpQmZWejBlVXVZeUllOTdic2w2UlBrNVRzMlVxK0FU?=
 =?utf-8?B?N0NuRHJNZkNFZlJUc3Buckd4RXhKYkc2cC9FdDBxMHkwbTMzc1k5alVVbVJj?=
 =?utf-8?B?bisyUTN1VmN2Tm1WMjJFVjUvQUhHZnFPUFBrZitBMSs1MHk2NWRObnhlZGdP?=
 =?utf-8?B?UDVSa204K0JTWko2UlEzWWxDU3djZjNVZStmQ1dqa0JRUTgzUGFnWW92czdM?=
 =?utf-8?B?S3NYWURiWkJvRG1SbmFGb1o3OEUvNEh3blJHcHVqT3lUbkQ0Q3pIdk1NTDc3?=
 =?utf-8?B?ZVB3cHVKT1RaZU55cjBsVWlyeEx1d25qdkliY3ZLRm9McWM1MDZ6Q1pmc01w?=
 =?utf-8?B?OXcvS0w1NFNCV3lmT2pTcG9WN01iT3F1c0R2VmpHS0I3T3JiQTIwQ3YwNUtD?=
 =?utf-8?B?dFB1UjZCVWdFOHJXVkhRMEFZQk1sUmRBTlZmYWVzWStuMkJ2aGZsY3B1SU9s?=
 =?utf-8?B?WGxPdHNmQzRmQmlnbzN3KytMMnEzNzlsY3gvSDhFc2JoZ1lXSGhVNXQxMExD?=
 =?utf-8?B?RUt1NzIrcm9wT1NNWGtBa2RXNnVuMnVaZDVtVVEybk80VmhQeUR6QnFNNG5u?=
 =?utf-8?B?MWxOdUdsSmVWaUtIdDBlZnIzanR2V0JjS0ZZaURUeXU5cDN3MXpDUXBTalA1?=
 =?utf-8?B?eTVzMkNpalVhVFdrS3RjZlg2UXRQYXBzaTZLOTJLamJBWjB5Y0lRSlkyVFov?=
 =?utf-8?B?WE8yTTBQczlBVHJFalpQblBTQ3V4NlNReHhtY1BQQ2swNTNmdjZNRTJBb0lx?=
 =?utf-8?B?dGJ0ODJuU0VaT015amZYUVRoYkNxNHd1RlJMKzB6TGx1bWh1SE5ab1lrZC9E?=
 =?utf-8?B?RXJ4Uk5WWUtEKzV3QnVxTWkwczRCMWlJbm16KzArVTNOZC9majBiTkxJb2o5?=
 =?utf-8?B?SGVJNDFhYWwwTUtBRmFiU2FCbnFra2xHUVZTeUl1ME43WkR6UWZoUUtTRlA5?=
 =?utf-8?B?Q2VVc1lwOG9EQ1lCOGZQd0UwNE1GQ1FIQ2ZncE5qVXNaOUV2Sk5zRm5wY1N5?=
 =?utf-8?B?azZtMzZ4dHoxMEhINHdBZXkwQklmTTNCN09TZlI2UllNd0wyZVJtR3lSWVhm?=
 =?utf-8?B?VjljMlZkdkhIUHhxY2RkNTBCS2dOc0lsOWxncnRmVTdKQWh2SHhxS3pERU15?=
 =?utf-8?B?eStJNDNIL05NVERPQ1N0QUZPNVVSU3RCd3JkaVVxbjZ5ZDA0RFlQbWlpVW14?=
 =?utf-8?B?ZXQyVU52R01vNysrT2k1STlCcmhPbjVWMklkZFNRMlpXdE5kZTdHVjg4M29p?=
 =?utf-8?B?S1pSL24vaVZuaHhSV0g3MUtRSVl1YXY0VzljekZpR3JkTmV0VDVSYmIxcE1j?=
 =?utf-8?B?USs1OTdrY3F1QVZkOUsyQW1rL3dMS0U2UmNRRlJ3M2VBbVBTK0lsZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <294577FC709F0B448A282BE835E64043@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39e1197-5dda-4f2e-fcc5-08d9e6580044
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 14:26:28.4730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btw2DWS83V9EiG6J38y8hIU26FjH/C2b7A4N5KjPIvuLlg+tvJHWJn6CFz4k6/bLdyOx64Da3RXFjLCwiVV+7cepTUp0yKKudrAvGQvZxFise3KrlIlTCVQcCUNkKazf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4472
X-Proofpoint-GUID: ybQD3JNRZHLoIJUCV91O9oNqpInG41mE
X-Proofpoint-ORIG-GUID: ybQD3JNRZHLoIJUCV91O9oNqpInG41mE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_07,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=941 impostorscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020079

DQoNCk9uIDAyLjAyLjIyIDE2OjE4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDIuMDIuMjAy
MiAxNDo0NywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gT24gMDIuMDIuMjAy
MiAxMzo0OSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDEzLjAxLjIy
IDEyOjUwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4gT24gVGh1LCBOb3YgMjUsIDIw
MjEgYXQgMDE6MDI6NDZQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+ICsrKyBiL3hlbi9k
cml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4+PiBAQCAtNDkxLDYgKzQ5MSwyMiBAQCBzdGF0aWMg
dm9pZCBjbWRfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCBy
ZWcsDQo+Pj4+Pj4gICAgICAgICAgICAgcGNpX2NvbmZfd3JpdGUxNihwZGV2LT5zYmRmLCByZWcs
IGNtZCk7DQo+Pj4+Pj4gICAgIH0NCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gK3N0YXRpYyB2b2lkIGd1
ZXN0X2NtZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJl
ZywNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGNtZCwgdm9p
ZCAqZGF0YSkNCj4+Pj4+PiArew0KPj4+Pj4+ICsgICAgLyogVE9ETzogQWRkIHByb3BlciBlbXVs
YXRpb24gZm9yIGFsbCBiaXRzIG9mIHRoZSBjb21tYW5kIHJlZ2lzdGVyLiAqLw0KPj4+Pj4+ICsN
Cj4+Pj4+PiArI2lmZGVmIENPTkZJR19IQVNfUENJX01TSQ0KPj4+Pj4+ICsgICAgaWYgKCBwZGV2
LT52cGNpLT5tc2ktPmVuYWJsZWQgKQ0KPj4+Pj4gWW91IG5lZWQgdG8gY2hlY2sgZm9yIE1TSS1Y
IGFsc28sIHBkZXYtPnZwY2ktPm1zaXgtPmVuYWJsZWQuDQo+Pj4+IEluZGVlZCwgdGhhbmsgeW91
DQo+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4gKyAgICAgICAgLyogR3Vlc3Qgd2FudHMgdG8gZW5hYmxl
IElOVHguIEl0IGNhbid0IGJlIGVuYWJsZWQgaWYgTVNJL01TSS1YIGVuYWJsZWQuICovDQo+Pj4+
Pj4gKyAgICAgICAgY21kIHw9IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRTsNCj4+Pj4+IFlvdSB3
aWxsIGFsc28gbmVlZCB0byBtYWtlIHN1cmUgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFIGlzIHNl
dCBpbiB0aGUNCj4+Pj4+IGNvbW1hbmQgcmVnaXN0ZXIgd2hlbiBhdHRlbXB0aW5nIHRvIGVuYWJs
ZSBNU0kgb3IgTVNJWCBjYXBhYmlsaXRpZXMuDQo+Pj4+IElzbid0IGl0IGVub3VnaCB0aGF0IHdl
IGp1c3QgY2hlY2sgYWJvdmUgaWYgTVNJL01TSS1YIGVuYWJsZWQgdGhlbiBtYWtlDQo+Pj4+IHN1
cmUgSU5UWCBkaXNhYmxlZD8gSSBhbSBub3QgZm9sbG93aW5nIHlvdSBoZXJlIG9uIHdoYXQgZWxz
ZSBuZWVkcyB0bw0KPj4+PiBiZSBkb25lLg0KPj4+IE5vLCB5b3UgbmVlZCB0byBkZWFsIHdpdGgg
dGhlIHBvdGVudGlhbGx5IGJhZCBjb21iaW5hdGlvbiBvbiBib3RoDQo+Pj4gcGF0aHMgLSBjb21t
YW5kIHJlZ2lzdGVyIHdyaXRlcyAoaGVyZSkgYW5kIE1TSS9NU0ktWCBjb250cm9sIHJlZ2lzdGVy
DQo+Pj4gd3JpdGVzICh3aGljaCBpcyB3aGF0IFJvZ2VyIHBvaW50cyB5b3UgYXQpLiBJIHdvdWxk
IGxpa2UgdG8gc3VnZ2VzdA0KPj4+IHRvIGNvbnNpZGVyIHNpbXBseSBmb3JjaW5nIElOVFhfRElT
QUJMRSBvbiBiZWhpbmQgdGhlIGd1ZXN0J3MgYmFjaw0KPj4+IGZvciB0aG9zZSBvdGhlciB0d28g
cGF0aHMuDQo+PiBEbyB5b3Ugc3VnZ2VzdCB0aGF0IHdlIG5lZWQgdG8gaGF2ZSBzb21lIGNvZGUg
d2hpY2ggd2lsbA0KPj4gd3JpdGUgUENJX0NPTU1BTkQgd2hpbGUgd2Ugd3JpdGUgTVNJL01TSS1Y
IGNvbnRyb2wgcmVnaXN0ZXINCj4+IGZvciB0aGF0IGtpbmQgb2YgY29uc2lzdGVuY3k/IEUuZy4g
Y29udHJvbCByZWdpc3RlciBoYW5kbGVyIHdpbGwNCj4+IG5lZWQgdG8gd3JpdGUgdG8gUENJX0NP
TU1BTkQgYW5kIGdvIHRocm91Z2ggZW11bGF0aW9uIGZvcg0KPj4gZ3Vlc3RzPw0KPiBFaXRoZXIg
Y2hlY2sgb3Igd3JpdGUsIHllcy4gU2luY2UgeW91J3JlIHNldHRpbmcgdGhlIGJpdCBoZXJlIGJl
aGluZA0KPiB0aGUgZ3Vlc3QncyBiYWNrLCBzZXR0aW5nIGl0IG9uIHRoZSBvdGhlciBwYXRocyBh
cyB3ZWxsIHdvdWxkIG9ubHkNCj4gbG9vayBjb25zaXN0ZW50IHRvIG1lLg0KSSBjYW4ndCBmaW5k
IGFueSBhY2Nlc3MgdG8gUENJX0NPTU1BTkQgcmVnaXN0ZXIgZnJvbSB2TVNJL3ZNU0ktWA0KY29k
ZSwgc28gd2hhdCdzIHRoZSBjb25jZXJuPyBUaGlzIHNlZW1zIHRvIGJlIHRoZSBvbmx5IHBsYWNl
IGluIHZQQ0kNCndoaWNoIHRvdWNoZXMgUENJX0NPTU1BTkQgcmVnaXN0ZXIuDQo+DQo+PiBJZiBz
bywgd2h5IGRpZG4ndCB3ZSBoYXZlIHRoYXQgYmVmb3JlPw0KPiBCZWNhdXNlIHdlIGFzc3VtZSBE
b20wIHRvIGJlIGJlaGF2aW5nIGl0c2VsZi4NCm9rLi4uDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91
LA0KT2xla3NhbmRy

