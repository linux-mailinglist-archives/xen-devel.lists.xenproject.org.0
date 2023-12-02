Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53076801974
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645842.1008362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En6-0005bn-Fv; Sat, 02 Dec 2023 01:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645842.1008362; Sat, 02 Dec 2023 01:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En5-0005Mc-VL; Sat, 02 Dec 2023 01:27:31 +0000
Received: by outflank-mailman (input) for mailman id 645842;
 Sat, 02 Dec 2023 01:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9En2-000272-KO
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:28 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f25d04f0-90b1-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:27:25 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1NLGut008549; Sat, 2 Dec 2023 01:27:08 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uqfjgj05q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:07 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:02 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:02 +0000
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
X-Inumbo-ID: f25d04f0-90b1-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIqBCiNYoGhG/BlDqcA6mrjYkL019QzzNWF/XwrWndnDqavoj8v6LF0RBbNxoNytTsHKeZ0J9QwBFNXuFtVEpWTt/TxnX26ps9UefBMzVKLjy+znJEzZWaRvr6QO31bwy3BO/XmaIUJLXy+uJrJ3AQHywj7jPFqhGHUE8ESdzq7u7PyCC7Ybvq/2kY/NPT+6OSlontyXylEBqgljTJrs+SwDNzsTCm5/347Zt2XmC3WpLY2RB/EkVK+IH8Il+0eP4efPG1H9Swm8FU9ryhtkTk82oClmIAjtSxFaQ1ojrYGmgbwDQIQiThF9kf+6xCMlQECEgH+kyTUHNl1LRkZ2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8REnoszUXW5wdC5BqFWoMkuaC9Yq6ifN4ZAzhjkY6U=;
 b=ayvET9LAl41JH6VNmuztqeCLydjMI3OuZDs61K+IP5ufREXvdsVuZW7cnKRZS0DYUQXksDYK1Mhguk7hAV0eovqgiKMurmaQ0WdgVmyQjN818FszpDf8uOTV1mgEhuzWQPx6BBS4yl9IEJkFPtrDtQ/kIrKDxP1Xj72enzZx+qLO7QWkmEB7ZQAR2P3b9NMkE7u+NKIOgCPvcD0mNblheJZ3LmoqBypZKtujCa4znisFnXGJYbDxYZ3lBGTyqwCwvv9ubK8PPfUtNtHwsNUjMRZmeyCMv/lFtBeXELnmxJ3cJXjfIvOkHkrJX7sZLiKM2rSQxAxwSZUhEBUnddizkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8REnoszUXW5wdC5BqFWoMkuaC9Yq6ifN4ZAzhjkY6U=;
 b=m3UP1Jk7+MAZo88/BJftbssBvUlEKkXny74VF8bTLE9MRzarL/+lvJjBpWxF/M+TmbsU8m0pvTgojjNalNdjruf4yewj7e5RaVtKdEzFl5kLLbMttBMS1Bky7owLCYUS3WzUodsjk/DOcUOtnathqBIuYrIWe/nsrJS9AiEJT1w6tMn3PRN22YGVg0+DSWwLdS6BK/qedEKXUy1jpv92qHLfOjxx4kgsMR5VfI9IwcSPpf98jEUW3m0Lc2l7KhGIfOAERxpRWD50Bn0pIruJnwnGEB7TVNr6FSNk32Fg0ZSoyXs2DZZ+peep8MuNfzJsJY6YABTk0+lAmh8Yyl55aQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>,
        Jun Nakajima <jun.nakajima@intel.com>,
        "Daniel P.
 Smith" <dpsmith@apertussolutions.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 00/17] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v11 00/17] PCI devices passthrough on Arm, part 3
Thread-Index: AQHaJL6myOgOEzRKR0O0HH5CmIGjcw==
Date: Sat, 2 Dec 2023 01:27:02 +0000
Message-ID: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: 912774a1-66b4-4982-4653-08dbf2d5c93f
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 H2NgLWBk3jq92rGbZMnfcC0nK4F07GEbnlaQIT7yMkqzy+j/K09U2pun+578v6KWpaWLQOi/xZ+SBn0U9JPp8MGixfF1hwrgaSb4ughpoliRTT6jS4kr3/g3dWaQJMm75NIny/NhO+ecomvsNNJExjeG3GQ6u4WRuvh2zljmUpnn0uQkWhwrxkRBG2bX6viY5b1AhlQR5vmYDXSENkfqM7JeNfPUud8cKoqL/jqIPEi6y26R1jmDHTuFkeArapG0jQMIKq9C0alaURJfRjv/6/O4ys0FaY+f1rP/GXGmwRVgRqrcjlazi/Tx6Hcb7B8XkaABwjV801UvBZk0g0GJD64O659Or4D36IOrwI9s6HJwnYeo+nHZDi5kwjdTRZ1Bwh7n7tgxRsgBrM/W2F6M8Zsy7foXPJL5DojrfbNHHlbr+5GVKPWX62IWhBWSjdz3d2wJsVmv0Y1uK5U5r7f8YqglXoMxeSBEv0ynG7r5T9iEp1vYlc6vRcSDHc7WDSindLCUorn3iw1KYUSEnpVmLWwLM2+rH+3TD3DEiZC5u7a0Epq0KaH+saZ/pR2pbYE99U7JNCWMlkYFnxXsp/Crqd/DoqNtLKCLzoO6f0KixQqNmYcse/MUo7sS+0wGqNlx
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(7416002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K25YMUMvUzl5bUNTYmFzZTQ5L2NSVkxRMkIreHFhNWNCNitFa2pLQUZtK3Nt?=
 =?utf-8?B?RVFWUVphR0pUZ3hCZXprTlZxRE1paWJoMCtOWGo2RG5hVGtMMFBWQ29PMjZ2?=
 =?utf-8?B?dEs0RXYrb2Q4K1FRa1FtanlTMzloOWMwSUtzZEcydFZwU2FIRERPakdNVTVx?=
 =?utf-8?B?RDNCMEl5ZnYrc2hZQnB5QzQ1UytWZ1RRRGNtY25QeEhqYVgyUndkSnlRaVpS?=
 =?utf-8?B?anlveXE4VHFyMU15ZmxNTndoRXdTSFhLbWprUFVkUkxZODZRMG1PdWJ6blJE?=
 =?utf-8?B?VzJPblI3UzhhWk03UG40WnpIOXZuOGtnZ0U4RmprenFId0YwbkI3Z1pJc0NI?=
 =?utf-8?B?VkJjUEN4bFdqdFN6dDF3RDI1QmlHTU5pNWlzQWRrdU1sR0d0cTVRVTlONk81?=
 =?utf-8?B?MVhldkhYNFZvYWZlZXVoUUJ2UE96YUVOV3k0N01WUE02NWRIdUhweTJ3MDJH?=
 =?utf-8?B?bStjcVdSMkFwb1FENy9JTnhQS3QxL1poSStTb0dSb0xYQUxIS2RBNWFRL09Q?=
 =?utf-8?B?Vlh0L0g1eUpFU2VzcXppbjNhMUV5cDBvY2Jjbld5elBHTHpFN0kva3VkU0d4?=
 =?utf-8?B?a0h6RFVNUzZGU0w4bGZTdTNZOFdveCs1NC9aT2N6V2l5a3RmbnpCYVZMWEZy?=
 =?utf-8?B?NUtSaDRoMVFtc3RKVElya1FIdlpKQ3dPZ3J2RWowZEttOTRlNDJySytjZHF4?=
 =?utf-8?B?VGg2TEp1djV2RE9DOTREcndxL2trLzVDdnBCRGEvdGxMNWthbUxPNDZMUUZH?=
 =?utf-8?B?L3NrSEo4UVlGQ2ZHN0p3SUpGUi90OUw5MlJ3a0VQbkd0Mlo5VFlVVHdIbXF6?=
 =?utf-8?B?RDE0aTlMcWxHMEdIWHRueHVqUU1kMCtjcUN2RHMwaU9Qb3NzdmdOMHo5aFFO?=
 =?utf-8?B?emcwM0VBcGlDYXFaSjd3d3BxOXBmTW8wSW83RU42VlFKUXBZdmd5MGFtZ0Rr?=
 =?utf-8?B?Q0NtSTBkc1BkOEtDc0pZQk1vcHVYUjVMR3gxOEpDYnlEaVdwQ1hJZ0xWRnpp?=
 =?utf-8?B?MGxkdGp4MVFxOVBmN1FxR1JUY1VxeTBhcmVUb1R4RWNnWnFUT0JWcmp6cTUy?=
 =?utf-8?B?UzNyNmVrNURvKzcyZFpHdmFrdTcxbTNCWDRZUVM0dFBoU2pvdVZEOENsK1V6?=
 =?utf-8?B?TERpWDk0ZGh4V1Q1amM1cks5MmNOL1ZSOWhWM3pmVGJ6NlZvMXNQc0tjVTNE?=
 =?utf-8?B?eTBoTS96VFZJTEwvRDRVOWpsR0s5M2lYM2RWUGpvaU1pK0xWUDZZWUJIdEZs?=
 =?utf-8?B?MlFIVnVUNjA3RUY0RFJOc1VpcVFRNXNwMWdmaW10UVg3WEg3ZWI4TE9pOFR6?=
 =?utf-8?B?WE0xZTE4cU9JS1JYZk94dXl0RmNQWlNVS0NQQnZvNEd5TVRhMzl4VUhSSGp5?=
 =?utf-8?B?emtDZy9RelBpS3FxVDZqT25VQVhyMEVCOWcyenBNV2RzYk4vZ3NXYzFkakJ4?=
 =?utf-8?B?eTZweXNWYTBZdTlVSS9FS3MzU3c0VlBPaWhLRko3M0lSMEtTMHV4STdJMWJH?=
 =?utf-8?B?STY2WkFsdFYvL1NiTGs0VEZKcC92ckFUOTMxQk5uK0FEOFVOQlh5ZldieW1x?=
 =?utf-8?B?V0ZQeWRDK1dEVHJLaFZGZkthVzNLU0hYY3hVV2FzcmFlWHN0b0loZlg4SjNp?=
 =?utf-8?B?VTJxQTBMeTdhalBhSGovRDZSOW1kUUtjMWEvemQyMGkvakYxS05hNTcvZVpw?=
 =?utf-8?B?ZkUxRTVZUWpGSDNqcU9SdlZXT1NsWGxhZzRHcFdZSC9DdTBIQTFvN2s5dlZ6?=
 =?utf-8?B?dFFlNENIeDdaMVE0d0NrcTFrc2hqdzR2dGRCMWFuakpzbGcrY21TTnJSRUh3?=
 =?utf-8?B?dEhXOE8za3BjUnV1Y3FqQ0tkWGZmK2ViY3A1QU4vcUNSaDAvYWx5OFpBR1Y0?=
 =?utf-8?B?MzNwN2ZZOUlST1JHU25BZURyM1l4bWhXQ2pWMm1DbTdiLzE1SXJ5cTJrdzhl?=
 =?utf-8?B?dXp0TGJrTm85VnFpU2NHSGsxdlM1d1pwSzRQRzRTT0pTVzU4bGhVb1hzUWJL?=
 =?utf-8?B?NlRPYjlTdi9MNGU5UXJCYUFneU5QcmZOQVJ3L1dJYXVtaThjSVp4Qy9qeW5n?=
 =?utf-8?B?YmdoelNTVGQySWpsK0x2N3M2MXBLV2hJaWF3TG9qclAxV3FJZjQ3VTRMSWpT?=
 =?utf-8?B?d0cxdFlPT1JYL3I3NXFDZnhYWUsveUJFaXR5NnB2UXhJZVlrdmdFTWJRZDFJ?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BF1220A4C9618489C236B32BB61BDCC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912774a1-66b4-4982-4653-08dbf2d5c93f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:02.1276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ExMgDjOZIDHt/Wau8GTG2MXZUtaPoJo37TeYL8X4n+C9lZjBzvwzUYuQcMO5y7juYfDismga5irDfv6060WKno1nkZPUR1B/5h/iu8fm4kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-GUID: v6lXct2_OViYMeufBpgk_jBtWo6kngv-
X-Proofpoint-ORIG-GUID: v6lXct2_OViYMeufBpgk_jBtWo6kngv-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

VGhpcyBpcyBuZXh0IHZlcnNpb24gb2YgdlBDSSByZXdvcmsuIEFpbSBvZiB0aGlzIHNlcmllcyBp
cyB0byBwcmVwYXJlDQpncm91bmQgZm9yIGludHJvZHVjaW5nIFBDSSBzdXBwb3J0IG9uIEFSTSBw
bGF0Zm9ybS4NCg0KaW4gdjExOg0KIC0gQWRkZWQgbXkgU2lnbmVkLW9mZi1ieSB0YWcgdG8gYWxs
IHBhdGNoZXMNCiAtIFBhdGNoICJ2cGNpL2hlYWRlcjogZW11bGF0ZSBQQ0lfQ09NTUFORCByZWdp
c3RlciBmb3IgZ3Vlc3RzIiBpcyBpbg0KICAgaW50ZXJtZWRpYXRlIHN0YXRlLCBiZWNhdXNlIGl0
IHdhcyBhZ3JlZWQgdG8gcmV3b3JrIGl0IG9uY2UgU3Rld2FydCdzDQogICBzZXJpZXMgb24gcmVn
aXN0ZXIgaGFuZGxpbmcgYXJlIGluLg0KIC0gQWRkcmVzc2VkIGNvbW1lbnRzLCBwbGVhc2Ugc2Vl
IHBhdGNoIGRlc2NyaXB0aW9ucyBmb3IgZGV0YWlscy4NCg0KaW4gdjEwOg0KDQogLSBSZW1vdmVk
IHBhdGNoICgieGVuL2FybTogdnBjaTogY2hlY2sgZ3Vlc3QgcmFuZ2UiKSwgcHJvcGVyIGZpeA0K
ICAgZm9yIHRoZSBpc3N1ZSBpcyBwYXJ0IG9mICgidnBjaS9oZWFkZXI6IGVtdWxhdGUgUENJX0NP
TU1BTkQNCiAgIHJlZ2lzdGVyIGZvciBndWVzdHMiKQ0KIC0gUmVtb3ZlZCBwYXRjaCAoInBjaS9o
ZWFkZXI6IHJlc2V0IHRoZSBjb21tYW5kIHJlZ2lzdGVyIHdoZW4gYWRkaW5nDQogICBkZXZpY2Vz
IikNCiAtIEFkZGVkIHBhdGNoICgicmFuZ2VzZXQ6IGFkZCByYW5nZXNldF9lbXB0eSgpIGZ1bmN0
aW9uIikgYmVjYXVzZQ0KICAgdGhpcyBmdW5jdGlvbiBpcyBuZWVkZWQgaW4gKCJ2cGNpL2hlYWRl
cjogaGFuZGxlIHAybSByYW5nZSBzZXRzDQogICBwZXIgQkFSIikNCiAtIEFkZGVkICgidnBjaS9o
ZWFkZXI6IGhhbmRsZSBwMm0gcmFuZ2Ugc2V0cyBwZXIgQkFSIikgd2hpY2ggYWRkcmVzc2VkDQog
ICBhbiBpc3N1ZSBkaXNjb3ZlcmVkIGJ5IEFuZHJpaSBDaGVwdXJueWkgZHVyaW5nIHZpcnRpbyBp
bnRlZ3JhdGlvbg0KIC0gQWRkZWQgKCJwY2k6IG1zaTogcGFzcyBwZGV2IHRvIHBjaV9lbmFibGVf
bXNpKCkgZnVuY3Rpb24iKSwgd2hpY2ggaXMNCiAgIHByZXJlcSBmb3IgKCJwY2k6IGludHJvZHVj
ZSBwZXItZG9tYWluIFBDSSByd2xvY2siKQ0KIC0gRml4ZWQgIlNpbmNlIHY5L3Y4Ly4uLiAiIGNv
bW1lbnRzIGluIGNoYW5nZWxvZ3MgdG8gcmVkdWNlIGNvbmZ1c2lvbi4NCiAgIEkgbGVmdCAiU2lu
Y2UiIGVudHJpZXMgZm9yIG9sZGVyIHZlcnNpb25zLCBiZWNhdXNlIHRoZXkgd2VyZSBhZGRlZA0K
ICAgYnkgb3JpZ2luYWwgYXV0aG9yIG9mIHRoZSBwYXRjaGVzLg0KDQppbiB2OToNCg0KdjkgaW5j
bHVkZXMgYWRkcmVzc2VkIGNvbW1lbnRlcyBmcm9tIGEgcHJldmlvdXMgb25lLiBBbHNvIGl0DQpp
bnRyb2R1Y2VzIGEgY291cGxlIHBhdGNoZXMgZnJvbSBTdGV3YXJ0LiBUaGlzIHBhdGNoZXMgYXJl
IHJlbGF0ZWQgdG8NCnZQQ0kgdXNlIG9uIEFSTS4gUGF0Y2ggInZwY2kvaGVhZGVyOiByZXdvcmsg
ZXhpdCBwYXRoIGluIGluaXRfYmFycyINCndhcyBmYWN0b3JlZC1vdXQgZnJvbSAidnBjaS9oZWFk
ZXI6IGhhbmRsZSBwMm0gcmFuZ2Ugc2V0cyBwZXIgQkFSIi4NCg0KaW4gdjg6DQoNClRoZSBiaWdn
ZXN0IGNoYW5nZSBmcm9tIHByZXZpb3VzLCBtaXN0YWtlbmx5IG5hbWVkLCB2NyBzZXJpZXMgaXMg
aG93DQpsb2NraW5nIGlzIGltcGxlbWVudGVkLiBJbnN0ZWFkIG9mIGQtPnZwY2lfcndsb2NrIHdl
IGludHJvZHVjZQ0KZC0+cGNpX2xvY2sgd2hpY2ggaGFzIGJyb2FkZXIgc2NvcGUsIGFzIGl0IHBy
b3RlY3RzIG5vdCBvbmx5IGRvbWFpbidzDQp2cGNpIHN0YXRlLCBidXQgZG9tYWluJ3MgbGlzdCBv
ZiBQQ0kgZGV2aWNlcyBhcyB3ZWxsLg0KDQpBcyB3ZSBkaXNjdXNzZWQgaW4gSVJDIHdpdGggUm9n
ZXIsIGl0IGlzIG5vdCBmZWFzaWJsZSB0byByZXdvcmsgYWxsDQp0aGUgZXhpc3RpbmcgY29kZSB0
byB1c2UgdGhlIG5ldyBsb2NrIHJpZ2h0IGF3YXkuIEl0IHdhcyBhZ3JlZWQgdGhhdA0KYW55IHdy
aXRlIGFjY2VzcyB0byBkLT5wZGV2X2xpc3Qgd2lsbCBiZSBwcm90ZWN0ZWQgYnkgKipib3RoKioN
CmQtPnBjaV9sb2NrIGluIHdyaXRlIG1vZGUgYW5kIHBjaWRldnNfbG9jaygpLiBSZWFkIGFjY2Vz
cyBvbiBvdGhlcg0KaGFuZCBzaG91bGQgYmUgcHJvdGVjdGVkIGJ5IGVpdGhlciBkLT5wY2lfbG9j
ayBpbiByZWFkIG1vZGUgb3INCnBjaWRldnNfbG9jaygpLiBJdCBpcyBleHBlY3RlZCB0aGF0IGV4
aXN0aW5nIGNvZGUgd2lsbCB1c2UNCnBjaWRldnNfbG9jaygpIGFuZCBuZXcgdXNlcnMgd2lsbCB1
c2UgbmV3IHJ3IGxvY2suIE9mIGNvdXJzZSwgdGhpcw0KZG9lcyBub3QgbWVhbiB0aGF0IG5ldyB1
c2VycyBzaGFsbCBub3QgdXNlIHBjaWRldnNfbG9jaygpIHdoZW4gaXQgaXMNCmFwcHJvcHJpYXRl
Lg0KDQoNCg0KQ2hhbmdlcyBmcm9tIHByZXZpb3VzIHZlcnNpb25zIGFyZSBkZXNjcmliZWQgaW4g
ZWFjaCBzZXBhcmF0ZSBwYXRjaC4NCg0KSGVsbG8gYWxsLA0KDQpUaGlzIGlzIG5leHQgdmVyc2lv
biBvZiB2UENJIHJld29yay4gQWltIG9mIHRoaXMgc2VyaWVzIGlzIHRvIHByZXBhcmUNCmdyb3Vu
ZCBmb3IgaW50cm9kdWNpbmcgUENJIHN1cHBvcnQgb24gQVJNIHBsYXRmb3JtLg0KDQppbiB2MTA6
DQoNCiAtIFJlbW92ZWQgcGF0Y2ggKCJ4ZW4vYXJtOiB2cGNpOiBjaGVjayBndWVzdCByYW5nZSIp
LCBwcm9wZXIgZml4DQogICBmb3IgdGhlIGlzc3VlIGlzIHBhcnQgb2YgKCJ2cGNpL2hlYWRlcjog
ZW11bGF0ZSBQQ0lfQ09NTUFORA0KICAgcmVnaXN0ZXIgZm9yIGd1ZXN0cyIpDQogLSBSZW1vdmVk
IHBhdGNoICgicGNpL2hlYWRlcjogcmVzZXQgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2hlbiBhZGRp
bmcNCiAgIGRldmljZXMiKQ0KIC0gQWRkZWQgcGF0Y2ggKCJyYW5nZXNldDogYWRkIHJhbmdlc2V0
X2VtcHR5KCkgZnVuY3Rpb24iKSBiZWNhdXNlDQogICB0aGlzIGZ1bmN0aW9uIGlzIG5lZWRlZCBp
biAoInZwY2kvaGVhZGVyOiBoYW5kbGUgcDJtIHJhbmdlIHNldHMNCiAgIHBlciBCQVIiKQ0KIC0g
QWRkZWQgKCJ2cGNpL2hlYWRlcjogaGFuZGxlIHAybSByYW5nZSBzZXRzIHBlciBCQVIiKSB3aGlj
aCBhZGRyZXNzZWQNCiAgIGFuIGlzc3VlIGRpc2NvdmVyZWQgYnkgQW5kcmlpIENoZXB1cm55aSBk
dXJpbmcgdmlydGlvIGludGVncmF0aW9uDQogLSBBZGRlZCAoInBjaTogbXNpOiBwYXNzIHBkZXYg
dG8gcGNpX2VuYWJsZV9tc2koKSBmdW5jdGlvbiIpLCB3aGljaCBpcw0KICAgcHJlcmVxIGZvciAo
InBjaTogaW50cm9kdWNlIHBlci1kb21haW4gUENJIHJ3bG9jayIpDQogLSBGaXhlZCAiU2luY2Ug
djkvdjgvLi4uICIgY29tbWVudHMgaW4gY2hhbmdlbG9ncyB0byByZWR1Y2UgY29uZnVzaW9uLg0K
ICAgSSBsZWZ0ICJTaW5jZSIgZW50cmllcyBmb3Igb2xkZXIgdmVyc2lvbnMsIGJlY2F1c2UgdGhl
eSB3ZXJlIGFkZGVkDQogICBieSBvcmlnaW5hbCBhdXRob3Igb2YgdGhlIHBhdGNoZXMuDQoNCmlu
IHY5Og0KDQp2OSBpbmNsdWRlcyBhZGRyZXNzZWQgY29tbWVudGVzIGZyb20gYSBwcmV2aW91cyBv
bmUuIEFsc28gaXQNCmludHJvZHVjZXMgYSBjb3VwbGUgcGF0Y2hlcyBmcm9tIFN0ZXdhcnQuIFRo
aXMgcGF0Y2hlcyBhcmUgcmVsYXRlZCB0bw0KdlBDSSB1c2Ugb24gQVJNLiBQYXRjaCAidnBjaS9o
ZWFkZXI6IHJld29yayBleGl0IHBhdGggaW4gaW5pdF9iYXJzIg0Kd2FzIGZhY3RvcmVkLW91dCBm
cm9tICJ2cGNpL2hlYWRlcjogaGFuZGxlIHAybSByYW5nZSBzZXRzIHBlciBCQVIiLg0KDQppbiB2
ODoNCg0KVGhlIGJpZ2dlc3QgY2hhbmdlIGZyb20gcHJldmlvdXMsIG1pc3Rha2VubHkgbmFtZWQs
IHY3IHNlcmllcyBpcyBob3cNCmxvY2tpbmcgaXMgaW1wbGVtZW50ZWQuIEluc3RlYWQgb2YgZC0+
dnBjaV9yd2xvY2sgd2UgaW50cm9kdWNlDQpkLT5wY2lfbG9jayB3aGljaCBoYXMgYnJvYWRlciBz
Y29wZSwgYXMgaXQgcHJvdGVjdHMgbm90IG9ubHkgZG9tYWluJ3MNCnZwY2kgc3RhdGUsIGJ1dCBk
b21haW4ncyBsaXN0IG9mIFBDSSBkZXZpY2VzIGFzIHdlbGwuDQoNCkFzIHdlIGRpc2N1c3NlZCBp
biBJUkMgd2l0aCBSb2dlciwgaXQgaXMgbm90IGZlYXNpYmxlIHRvIHJld29yayBhbGwNCnRoZSBl
eGlzdGluZyBjb2RlIHRvIHVzZSB0aGUgbmV3IGxvY2sgcmlnaHQgYXdheS4gSXQgd2FzIGFncmVl
ZCB0aGF0DQphbnkgd3JpdGUgYWNjZXNzIHRvIGQtPnBkZXZfbGlzdCB3aWxsIGJlIHByb3RlY3Rl
ZCBieSAqKmJvdGgqKg0KZC0+cGNpX2xvY2sgaW4gd3JpdGUgbW9kZSBhbmQgcGNpZGV2c19sb2Nr
KCkuIFJlYWQgYWNjZXNzIG9uIG90aGVyDQpoYW5kIHNob3VsZCBiZSBwcm90ZWN0ZWQgYnkgZWl0
aGVyIGQtPnBjaV9sb2NrIGluIHJlYWQgbW9kZSBvcg0KcGNpZGV2c19sb2NrKCkuIEl0IGlzIGV4
cGVjdGVkIHRoYXQgZXhpc3RpbmcgY29kZSB3aWxsIHVzZQ0KcGNpZGV2c19sb2NrKCkgYW5kIG5l
dyB1c2VycyB3aWxsIHVzZSBuZXcgcncgbG9jay4gT2YgY291cnNlLCB0aGlzDQpkb2VzIG5vdCBt
ZWFuIHRoYXQgbmV3IHVzZXJzIHNoYWxsIG5vdCB1c2UgcGNpZGV2c19sb2NrKCkgd2hlbiBpdCBp
cw0KYXBwcm9wcmlhdGUuDQoNCg0KDQpDaGFuZ2VzIGZyb20gcHJldmlvdXMgdmVyc2lvbnMgYXJl
IGRlc2NyaWJlZCBpbiBlYWNoIHNlcGFyYXRlIHBhdGNoLg0KDQoNCk9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvICgxMSk6DQogIHZwY2k6IHVzZSBwZXItZG9tYWluIFBDSSBsb2NrIHRvIHByb3RlY3Qg
dnBjaSBzdHJ1Y3R1cmUNCiAgdnBjaTogcmVzdHJpY3QgdW5oYW5kbGVkIHJlYWQvd3JpdGUgb3Bl
cmF0aW9ucyBmb3IgZ3Vlc3RzDQogIHZwY2k6IGFkZCBob29rcyBmb3IgUENJIGRldmljZSBhc3Np
Z24vZGUtYXNzaWduDQogIHZwY2kvaGVhZGVyOiBpbXBsZW1lbnQgZ3Vlc3QgQkFSIHJlZ2lzdGVy
IGhhbmRsZXJzDQogIHJhbmdlc2V0OiBhZGQgUkFOR0VTRVRGX25vX3ByaW50IGZsYWcNCiAgdnBj
aS9oZWFkZXI6IGhhbmRsZSBwMm0gcmFuZ2Ugc2V0cyBwZXIgQkFSDQogIHZwY2kvaGVhZGVyOiBw
cm9ncmFtIHAybSB3aXRoIGd1ZXN0IEJBUiB2aWV3DQogIHZwY2kvaGVhZGVyOiBlbXVsYXRlIFBD
SV9DT01NQU5EIHJlZ2lzdGVyIGZvciBndWVzdHMNCiAgdnBjaTogYWRkIGluaXRpYWwgc3VwcG9y
dCBmb3IgdmlydHVhbCBQQ0kgYnVzIHRvcG9sb2d5DQogIHhlbi9hcm06IHRyYW5zbGF0ZSB2aXJ0
dWFsIFBDSSBidXMgdG9wb2xvZ3kgZm9yIGd1ZXN0cw0KICB4ZW4vYXJtOiBhY2NvdW50IElPIGhh
bmRsZXJzIGZvciBlbXVsYXRlZCBQQ0kgTVNJLVgNCg0KU3Rld2FydCBIaWxkZWJyYW5kICgxKToN
CiAgeGVuL2FybTogdnBjaTogcGVybWl0IGFjY2VzcyB0byBndWVzdCB2cGNpIHNwYWNlDQoNClZv
bG9keW15ciBCYWJjaHVrICg1KToNCiAgcGNpOiBtc2k6IHBhc3MgcGRldiB0byBwY2lfZW5hYmxl
X21zaSgpIGZ1bmN0aW9uDQogIHBjaTogaW50cm9kdWNlIHBlci1kb21haW4gUENJIHJ3bG9jaw0K
ICB2cGNpL2hlYWRlcjogcmV3b3JrIGV4aXQgcGF0aCBpbiBpbml0X2JhcnMNCiAgcmFuZ2VzZXQ6
IGFkZCByYW5nZXNldF9lbXB0eSgpIGZ1bmN0aW9uDQogIGFybS92cGNpOiBob25vciBhY2Nlc3Mg
c2l6ZSB3aGVuIHJldHVybmluZyBhbiBlcnJvcg0KDQogeGVuL2FyY2gvYXJtL3ZwY2kuYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA3MiArKy0NCiB4ZW4vYXJjaC94ODYvaHZtL3Ztc2kuYyAg
ICAgICAgICAgICAgICAgICAgIHwgIDIyICstDQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMg
ICAgICAgICAgICAgICAgICB8ICAgMiAtDQogeGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zaS5o
ICAgICAgICAgICAgICB8ICAgNSArLQ0KIHhlbi9hcmNoL3g4Ni9pcnEuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMTAgKy0NCiB4ZW4vYXJjaC94ODYvbXNpLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDI1ICstDQogeGVuL2FyY2gveDg2L3BoeXNkZXYuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArDQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgNSArLQ0KIHhlbi9jb21tb24vcmFuZ2VzZXQuYyAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMjEgKy0NCiB4ZW4vZHJpdmVycy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA0ICsNCiB4ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYyAgICAgICAgICAgICAgICAgIHwg
IDI4ICstDQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYyB8ICAg
OSArLQ0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jICAgICAgICAgICAgICAgfCAgOTgg
KysrLQ0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAgICAgICAgfCAgIDkg
Ky0NCiB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jICAgICAgICAgICAgICAgICAgIHwgNTEzICsr
KysrKysrKysrKysrKystLS0tDQogeGVuL2RyaXZlcnMvdnBjaS9tc2kuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAzNCArLQ0KIHhlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jICAgICAgICAgICAgICAg
ICAgICAgfCAgNTcgKystDQogeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAgICAgICAgICAgICAg
ICAgICB8IDE1MSArKysrKy0NCiB4ZW4vaW5jbHVkZS94ZW4vcmFuZ2VzZXQuaCAgICAgICAgICAg
ICAgICAgIHwgICA4ICstDQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAgICAgICAg
ICAgICB8ICAgOSArDQogeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAgICAgICAgICAgICAgICAgICAg
ICB8ICA1NCArKy0NCiAyMSBmaWxlcyBjaGFuZ2VkLCA5MjggaW5zZXJ0aW9ucygrKSwgMjEwIGRl
bGV0aW9ucygtKQ0KDQotLSANCjIuNDIuMA0K

