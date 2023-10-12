Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316E7C794F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616072.957851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s7-0002zr-Od; Thu, 12 Oct 2023 22:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616072.957851; Thu, 12 Oct 2023 22:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s7-0002vD-Im; Thu, 12 Oct 2023 22:09:35 +0000
Received: by outflank-mailman (input) for mailman id 616072;
 Thu, 12 Oct 2023 22:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3s6-00016v-1s
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:34 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0568c859-694c-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:09:33 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqml2008371; Thu, 12 Oct 2023 22:09:18 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:17 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6376.eurprd03.prod.outlook.com (2603:10a6:10:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 22:09:14 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:14 +0000
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
X-Inumbo-ID: 0568c859-694c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJar0ktDK0Zr4Nusawcylt9N5IgEcz1ZPFFgTVOBLSeNsi5RVFls2X+Rr5TskutmMBKsTf/h1LfFmF61hxWsY4cAMniwEz8563BWIqZZOCcfLSc33/iphWVOcmOaEkXJL4uqHdhPkROV23ty11f+UR8nG56I+AecIyg7Es2FiDHJD7V12bqWEj4Jng3SKKdzfpVvv4Xoe03QYovQzehbH8PY6tAKKMS5PNEXiHtpaOl+d0K4u6NOuqsZr99028tWWU1eTJ8VXbsJW9xW3gDvR2oN5LOweo2pka2d54VDyN1UVBh5zQF0zMtXgvY6fkgFqDS8wtVcxrY849SqR9VGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhXyJHYlAPTYayr221weXq+AyrDZqJ1ahzFObJgSnxk=;
 b=Iq0ZmxRYu9RtIp1K79RvDKisYb+MygeuuZRx7yayXOCFqfPv+uN/yvyj0vjSPEdODnK22LWHRv+f9hHrMThf5Zo3SBeE+yF0/8CbmyJFwsS44Gr+UZUYV2jB7yFR150P79kF6731+tHoMaxJFqsT13+ZpWKZMo0l3k0RYWPj8ttfAQYuOvrvgPZ4hkPDfopgnONlxha0rAoVMA5MAnwjhuH7BWraqi1JYuoXA0H15ZvzLGQ9ZxQyF/CBC7HfXmRxPFT47jvIX4PgX71HXzOAtv0YukEAq55fsHO5lz0ImuEfy5Kq3kGBtyWYCpk4UxcqJTcfpDMxxcZwrFMvCxSfSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhXyJHYlAPTYayr221weXq+AyrDZqJ1ahzFObJgSnxk=;
 b=NWn3q7iUmybgUn2r0ktUns/JLOooMu4GZnKx8g/OL/bxip0VZujOQxJ7VBOqkXFeW1aHmqIqKWPshppzJyAtjfT9LDYrFHY7H/Qm04QRfOj5oYNde478fAYEPfLpNBmfnK1jMKx/7yvpT4G3IUq2sJr9zEkKEwkbjVqz+wcKmNvyirSCC/l7/npQ3o9xHgeriieifrQD0j1k8i00lHygK3n9UElTsUYjCwFvFakU6OlGwbxuGhFg4TmrewGskgDk19lYXkiLaVmta7q5A7YfjsbfR3xJ1FtEQc7qoLn/yB/H5zWSaczn/sj3CBwCc07f6pA1EZwIPXR+yPmPeIFRiw==
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
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 00/17] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v10 00/17] PCI devices passthrough on Arm, part 3
Thread-Index: AQHZ/Vi800FGBIOTr0uxo4jqDLR7uA==
Date: Thu, 12 Oct 2023 22:09:14 +0000
Message-ID: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6376:EE_
x-ms-office365-filtering-correlation-id: 2790b472-fa02-4918-8ab2-08dbcb6fdeca
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YoXTJlnmejxo++8LZP4k0hzc/kpXn5KoJCMFdXaYIAlToBUz/Y89eBjzv0bD06h+bhqPJqHhtR1cSTj6gwJTfcD+ysGfQNqZZaLlnyFCK0pDmOf7pMhbkh+WntxZX1eR71jsK+lMUpZsicKSf5mfBN8tnZha0jJwzy5ikJCnpT181mtmXCkg+jb+iOnHbkMe3wpY/tidL1ueUyaSCI9ITvzZi5ql7z/zsN1cdp61ucrYRic3p9RBPUX85AAy1sBsKPRzR3Wsq/wV1qq9ljtPznjd4+kVreTBM7n/6xew0e4miePMpPimgY4QJCNl7GpN9A0EL12wlBnmWE/wQv1t4GMibT153T4hVvVwPSHMNGWfOCDpn5so8rd9gX27OwZL7Aas6WkTBevVecfXi/AtkhRmkXGmNcKLl8W1BR+oyOiLaqJfhixiP3JB+JSWSpRsUuuTxn6Bo56PXSbxwuuezWYnnicS0Iv4q6VPyAMGU249n6gG/ERpiIP7leObP9eJwX+9SaPu7n3GaOgrAV95BdUEmYgXAfxqTtmqpASJcrmcsude1I2iKwlDECyVY+k1SrBbPVv+BKrAyKflqZ/Dh2SjkJwH1/1G1DyeOI6TJwRRQiT5WwkwrxQw5ze3l0o9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(107886003)(2616005)(71200400001)(26005)(6512007)(6506007)(55236004)(36756003)(86362001)(38100700002)(38070700005)(122000001)(1076003)(83380400001)(7416002)(91956017)(41300700001)(64756008)(316002)(76116006)(54906003)(66946007)(66446008)(6916009)(66556008)(66476007)(2906002)(8936002)(5660300002)(8676002)(4326008)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aHI0ajM3VU9mSGJPaUFmU045ZDYrTkh1eklZNXZpNFhocTJhV3QwaHdWTWtR?=
 =?utf-8?B?YXlSQXRkVGR2SE55aElxZmlWcHZsTnV2KytIdW5Ra2xSRTRwMDJDSjZETWZm?=
 =?utf-8?B?YzF1eG1xWUFPSVV6L0d0bWZwMEhRZHljZVRFcVRGb3RzaVU0bnVUWERSdkJZ?=
 =?utf-8?B?ZnlYQ2Z4QVZGaUFhN3JvMEpjVVVGVmRTaGpwSGdZSFA1ZVpnZ2ZYZUFHWTdR?=
 =?utf-8?B?OGJGa0ZYK1ZrL1VkdkFjRTlJNTR2bFEwdkYralMvNys0T0xIU3ltMDNIZThT?=
 =?utf-8?B?c3JoNXVhaXhPaFB0WGJTb1R5dVNWVVdBREQ4U0N1NHAzMDhaQnNnTEcwOU84?=
 =?utf-8?B?b2dENFFncGFGVmhYWmhHZFRYcjJ4V0RsS3J2OTByWktva2VZRUhnbjhjcnlr?=
 =?utf-8?B?bUFKSXM5OG03eE1qU29RZ3VwNTFRN3lQZVB5U0x3VFNtWDRQWFYycnR1TThh?=
 =?utf-8?B?dWsvTnBwUTc2REZ0dDZrOWVzQTlLVE9HdFMxVkg4UmhzZk1qRmFJTXVRWXhW?=
 =?utf-8?B?eXZHMW5FcnhzNEpaNFA0aGU2Z3hXT1pBS1I3MGo3UGNaTW85ZWJpQ0pLbEN5?=
 =?utf-8?B?UldtZ2NDM0RZa3R6UXlmVEpieUFJZW82bzQwVFRvR0ZhcHo5WiswcTRteU8w?=
 =?utf-8?B?V3ZKUlZ6MmpsbFVKcGprYVRnWGc3eWx0K2huK0didVgyYjd6MVRkeUV2elcx?=
 =?utf-8?B?My80aitxdExMTDdoUm95dGFrYW9HTkN1ejVFbnFRdElvcHN6bGkrRi9UVXR2?=
 =?utf-8?B?bjZPbC9pQU9INnZoem4raEVScjFQUWhuVm0yb2M0VkExWk05OExSSHZ5Qm5P?=
 =?utf-8?B?T0oza1lDSzIvVjNyRXF3N2ErY2JFQXVUS0J0VFl2QlE5VG43ZTd0QU0wWXZ6?=
 =?utf-8?B?TDlYZXVXR09HNXYyQ2pyQjlORVlDYlE0d1hLNXprcVRvNjNraVhtZDBOMCtl?=
 =?utf-8?B?YUNncUxjOGJXeERqcHJzV0haaXZiU1VmcXM4bWphUWdZTW1seTZsRnhyc1Z6?=
 =?utf-8?B?TDlyVUlTK1l3WlVxVUh0UnZaamFWUGNCYno2aGZWdE1LL1dZL0hVb3dKTjJQ?=
 =?utf-8?B?aUE5d0tVRm1VN0lMdllmS0RVSkg4eExDV2ZnT25NU1YvcGc4a3F5TGJxaEVY?=
 =?utf-8?B?NjdOaDFPM3ZsZ1Z6bXdqbVQvc1NnZjVaa3pwVE1NdUpFYk5iODljMlU5Q3Mv?=
 =?utf-8?B?d3F1R3pGOWZsSVpVeWRESzNRSmkzUHJ4cFdXRi8xTmpEd0N5UGV0dnF6Uytl?=
 =?utf-8?B?dkt5djR0NHRYRllVVjFuNXJUSHdvUWkvM1F1M1dMV0NjTCtkK2xwZm9xbTM2?=
 =?utf-8?B?SklvVFhnZTNoSVBZR2lRQ0duRnZKZloydmt4aHNpWVZyVzY5M1ZDVXFHVjEz?=
 =?utf-8?B?c0hTcHk2R1EvM25vWHdpank4MEgxNXRwQ2pvc3hBa2hXVEljWGZRcCsrY3pU?=
 =?utf-8?B?KzQ2OWhLd2ljenlac1puMFBybDFncC94cFE2RWhzYUYrblpnQVNibWFlaHgr?=
 =?utf-8?B?ai83WGxOMjQzeENreVV1YTByUWQ1YjZQT2EvTmtBcmJQNWRnT2xkVlhISFdL?=
 =?utf-8?B?cnRXMG1SUUxZL25EWkJlZE5Va2E3ZnFSUmFrRi9nQ0p2UUNWc0p1TE14Nlp5?=
 =?utf-8?B?UVFzZ0ZFRDEyR05wMy9VeHkwVHNYK29IcG9iTnRBdlhua2V3bWxzWk9UZFpa?=
 =?utf-8?B?elp0QUhYWXBMR2ZEQkN2Q2JhaXpKYmZFNC9TYjd0dm5PbklnU0xPVWl1emtz?=
 =?utf-8?B?UnVzajQvQ05PMWRKNkVZQXF1d25qRFE2eHBMZDFnVFJ0NjdvMkJKYWh6OEU5?=
 =?utf-8?B?TkhscE9vd2pEL1lkYlRJdmZIazhKQW96R0RkWmo1d3dlS3FnSGpZTjFQbW5S?=
 =?utf-8?B?Qno2WHJ4bTdTN1gxeS85VGxZUzdmS1RybTNaQmhzTEZjUXhiblZkd21VeVI4?=
 =?utf-8?B?bHBiTXVtOWxQSTFHcmt0RldJU2o4djUydmxFNktnR2pqeUJMdy9adFJ3QVR5?=
 =?utf-8?B?VkNSZTJBeGM1bW5IYmZidUZLWFBqeU5RRmtCOGN5cExPaDhSK3JXZDJFbWxO?=
 =?utf-8?B?YnhtV0VYQ3ExM1VWVmZBVmRwaGh3dWIzYnR2aG9VRis2NTFGNXczZTdtbFIv?=
 =?utf-8?B?MklScTlKY0V3L2lBTWtyTW40QWN0L21yc2ZJcGlZNXlmWXhyeWcrcDN0U1Vj?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1CECFAFFC8ABC44BD533542D14886B4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2790b472-fa02-4918-8ab2-08dbcb6fdeca
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:14.2177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8wpWODMTcvSaWDI0ayhJ/5PGYnAWJtENFEk7kXaGF/zsgOYo/ZzSIZ2E4/aE/tHCQGh0mrh3QxjRV6QGs6p3/CP+3fxqcwJKJjwW1rMnR2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6376
X-Proofpoint-GUID: pYxa6fu9qz-NA_deBcOPhgRr-52qJx6J
X-Proofpoint-ORIG-GUID: pYxa6fu9qz-NA_deBcOPhgRr-52qJx6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

SGVsbG8gYWxsLA0KDQpUaGlzIGlzIG5leHQgdmVyc2lvbiBvZiB2UENJIHJld29yay4gQWltIG9m
IHRoaXMgc2VyaWVzIGlzIHRvIHByZXBhcmUNCmdyb3VuZCBmb3IgaW50cm9kdWNpbmcgUENJIHN1
cHBvcnQgb24gQVJNIHBsYXRmb3JtLg0KDQppbiB2MTA6DQoNCiAtIFJlbW92ZWQgcGF0Y2ggKCJ4
ZW4vYXJtOiB2cGNpOiBjaGVjayBndWVzdCByYW5nZSIpLCBwcm9wZXIgZml4DQogICBmb3IgdGhl
IGlzc3VlIGlzIHBhcnQgb2YgKCJ2cGNpL2hlYWRlcjogZW11bGF0ZSBQQ0lfQ09NTUFORA0KICAg
cmVnaXN0ZXIgZm9yIGd1ZXN0cyIpDQogLSBSZW1vdmVkIHBhdGNoICgicGNpL2hlYWRlcjogcmVz
ZXQgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2hlbiBhZGRpbmcNCiAgIGRldmljZXMiKQ0KIC0gQWRk
ZWQgcGF0Y2ggKCJyYW5nZXNldDogYWRkIHJhbmdlc2V0X2VtcHR5KCkgZnVuY3Rpb24iKSBiZWNh
dXNlDQogICB0aGlzIGZ1bmN0aW9uIGlzIG5lZWRlZCBpbiAoInZwY2kvaGVhZGVyOiBoYW5kbGUg
cDJtIHJhbmdlIHNldHMNCiAgIHBlciBCQVIiKQ0KIC0gQWRkZWQgKCJ2cGNpL2hlYWRlcjogaGFu
ZGxlIHAybSByYW5nZSBzZXRzIHBlciBCQVIiKSB3aGljaCBhZGRyZXNzZWQNCiAgIGFuIGlzc3Vl
IGRpc2NvdmVyZWQgYnkgQW5kcmlpIENoZXB1cm55aSBkdXJpbmcgdmlydGlvIGludGVncmF0aW9u
DQogLSBBZGRlZCAoInBjaTogbXNpOiBwYXNzIHBkZXYgdG8gcGNpX2VuYWJsZV9tc2koKSBmdW5j
dGlvbiIpLCB3aGljaCBpcw0KICAgcHJlcmVxIGZvciAoInBjaTogaW50cm9kdWNlIHBlci1kb21h
aW4gUENJIHJ3bG9jayIpDQogLSBGaXhlZCAiU2luY2UgdjkvdjgvLi4uICIgY29tbWVudHMgaW4g
Y2hhbmdlbG9ncyB0byByZWR1Y2UgY29uZnVzaW9uLg0KICAgSSBsZWZ0ICJTaW5jZSIgZW50cmll
cyBmb3Igb2xkZXIgdmVyc2lvbnMsIGJlY2F1c2UgdGhleSB3ZXJlIGFkZGVkDQogICBieSBvcmln
aW5hbCBhdXRob3Igb2YgdGhlIHBhdGNoZXMuDQoNCmluIHY5Og0KDQp2OSBpbmNsdWRlcyBhZGRy
ZXNzZWQgY29tbWVudGVzIGZyb20gYSBwcmV2aW91cyBvbmUuIEFsc28gaXQNCmludHJvZHVjZXMg
YSBjb3VwbGUgcGF0Y2hlcyBmcm9tIFN0ZXdhcnQuIFRoaXMgcGF0Y2hlcyBhcmUgcmVsYXRlZCB0
bw0KdlBDSSB1c2Ugb24gQVJNLiBQYXRjaCAidnBjaS9oZWFkZXI6IHJld29yayBleGl0IHBhdGgg
aW4gaW5pdF9iYXJzIg0Kd2FzIGZhY3RvcmVkLW91dCBmcm9tICJ2cGNpL2hlYWRlcjogaGFuZGxl
IHAybSByYW5nZSBzZXRzIHBlciBCQVIiLg0KDQppbiB2ODoNCg0KVGhlIGJpZ2dlc3QgY2hhbmdl
IGZyb20gcHJldmlvdXMsIG1pc3Rha2VubHkgbmFtZWQsIHY3IHNlcmllcyBpcyBob3cNCmxvY2tp
bmcgaXMgaW1wbGVtZW50ZWQuIEluc3RlYWQgb2YgZC0+dnBjaV9yd2xvY2sgd2UgaW50cm9kdWNl
DQpkLT5wY2lfbG9jayB3aGljaCBoYXMgYnJvYWRlciBzY29wZSwgYXMgaXQgcHJvdGVjdHMgbm90
IG9ubHkgZG9tYWluJ3MNCnZwY2kgc3RhdGUsIGJ1dCBkb21haW4ncyBsaXN0IG9mIFBDSSBkZXZp
Y2VzIGFzIHdlbGwuDQoNCkFzIHdlIGRpc2N1c3NlZCBpbiBJUkMgd2l0aCBSb2dlciwgaXQgaXMg
bm90IGZlYXNpYmxlIHRvIHJld29yayBhbGwNCnRoZSBleGlzdGluZyBjb2RlIHRvIHVzZSB0aGUg
bmV3IGxvY2sgcmlnaHQgYXdheS4gSXQgd2FzIGFncmVlZCB0aGF0DQphbnkgd3JpdGUgYWNjZXNz
IHRvIGQtPnBkZXZfbGlzdCB3aWxsIGJlIHByb3RlY3RlZCBieSAqKmJvdGgqKg0KZC0+cGNpX2xv
Y2sgaW4gd3JpdGUgbW9kZSBhbmQgcGNpZGV2c19sb2NrKCkuIFJlYWQgYWNjZXNzIG9uIG90aGVy
DQpoYW5kIHNob3VsZCBiZSBwcm90ZWN0ZWQgYnkgZWl0aGVyIGQtPnBjaV9sb2NrIGluIHJlYWQg
bW9kZSBvcg0KcGNpZGV2c19sb2NrKCkuIEl0IGlzIGV4cGVjdGVkIHRoYXQgZXhpc3RpbmcgY29k
ZSB3aWxsIHVzZQ0KcGNpZGV2c19sb2NrKCkgYW5kIG5ldyB1c2VycyB3aWxsIHVzZSBuZXcgcncg
bG9jay4gT2YgY291cnNlLCB0aGlzDQpkb2VzIG5vdCBtZWFuIHRoYXQgbmV3IHVzZXJzIHNoYWxs
IG5vdCB1c2UgcGNpZGV2c19sb2NrKCkgd2hlbiBpdCBpcw0KYXBwcm9wcmlhdGUuDQoNCg0KDQpD
aGFuZ2VzIGZyb20gcHJldmlvdXMgdmVyc2lvbnMgYXJlIGRlc2NyaWJlZCBpbiBlYWNoIHNlcGFy
YXRlIHBhdGNoLg0KDQoNCk9sZWtzYW5kciBBbmRydXNoY2hlbmtvICgxMSk6DQogIHZwY2k6IHVz
ZSBwZXItZG9tYWluIFBDSSBsb2NrIHRvIHByb3RlY3QgdnBjaSBzdHJ1Y3R1cmUNCiAgdnBjaTog
cmVzdHJpY3QgdW5oYW5kbGVkIHJlYWQvd3JpdGUgb3BlcmF0aW9ucyBmb3IgZ3Vlc3RzDQogIHZw
Y2k6IGFkZCBob29rcyBmb3IgUENJIGRldmljZSBhc3NpZ24vZGUtYXNzaWduDQogIHZwY2kvaGVh
ZGVyOiBpbXBsZW1lbnQgZ3Vlc3QgQkFSIHJlZ2lzdGVyIGhhbmRsZXJzDQogIHJhbmdlc2V0OiBh
ZGQgUkFOR0VTRVRGX25vX3ByaW50IGZsYWcNCiAgdnBjaS9oZWFkZXI6IGhhbmRsZSBwMm0gcmFu
Z2Ugc2V0cyBwZXIgQkFSDQogIHZwY2kvaGVhZGVyOiBwcm9ncmFtIHAybSB3aXRoIGd1ZXN0IEJB
UiB2aWV3DQogIHZwY2kvaGVhZGVyOiBlbXVsYXRlIFBDSV9DT01NQU5EIHJlZ2lzdGVyIGZvciBn
dWVzdHMNCiAgdnBjaTogYWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdmlydHVhbCBQQ0kgYnVzIHRv
cG9sb2d5DQogIHhlbi9hcm06IHRyYW5zbGF0ZSB2aXJ0dWFsIFBDSSBidXMgdG9wb2xvZ3kgZm9y
IGd1ZXN0cw0KICB4ZW4vYXJtOiBhY2NvdW50IElPIGhhbmRsZXJzIGZvciBlbXVsYXRlZCBQQ0kg
TVNJLVgNCg0KU3Rld2FydCBIaWxkZWJyYW5kICgxKToNCiAgeGVuL2FybTogdnBjaTogcGVybWl0
IGFjY2VzcyB0byBndWVzdCB2cGNpIHNwYWNlDQoNClZvbG9keW15ciBCYWJjaHVrICg1KToNCiAg
cGNpOiBtc2k6IHBhc3MgcGRldiB0byBwY2lfZW5hYmxlX21zaSgpIGZ1bmN0aW9uDQogIHBjaTog
aW50cm9kdWNlIHBlci1kb21haW4gUENJIHJ3bG9jaw0KICB2cGNpL2hlYWRlcjogcmV3b3JrIGV4
aXQgcGF0aCBpbiBpbml0X2JhcnMNCiAgcmFuZ2VzZXQ6IGFkZCByYW5nZXNldF9lbXB0eSgpIGZ1
bmN0aW9uDQogIGFybS92cGNpOiBob25vciBhY2Nlc3Mgc2l6ZSB3aGVuIHJldHVybmluZyBhbiBl
cnJvcg0KDQogeGVuL2FyY2gvYXJtL3ZwY2kuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3
OCArKystDQogeGVuL2FyY2gveDg2L2h2bS92bXNpLmMgICAgICAgICAgICAgICAgICAgICB8ICAy
NiArLQ0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICAgICAgICAgICAgICAgfCAgIDIg
LQ0KIHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pcnEuaCAgICAgICAgICAgICAgfCAgIDMgKy0N
CiB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbXNpLmggICAgICAgICAgICAgIHwgICAzICstDQog
eGVuL2FyY2gveDg2L2lycS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArLQ0KIHhl
bi9hcmNoL3g4Ni9tc2kuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjUgKy0NCiB4ZW4v
YXJjaC94ODYvcGh5c2Rldi5jICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQogeGVuL2Nv
bW1vbi9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQ0KIHhlbi9jb21t
b24vcmFuZ2VzZXQuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKy0NCiB4ZW4vZHJpdmVy
cy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsNCiB4ZW4vZHJpdmVycy9j
aGFyL25zMTY1NTAuYyAgICAgICAgICAgICAgICAgIHwgICA0ICstDQogeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYyB8ICAgOSArLQ0KIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3BjaS5jICAgICAgICAgICAgICAgfCAgOTQgKysrLQ0KIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3Z0ZC9pb21tdS5jICAgICAgICAgfCAgIDkgKy0NCiB4ZW4vZHJpdmVycy92cGNpL2hl
YWRlci5jICAgICAgICAgICAgICAgICAgIHwgNDgyICsrKysrKysrKysrKysrKy0tLS0tDQogeGVu
L2RyaXZlcnMvdnBjaS9tc2kuYyAgICAgICAgICAgICAgICAgICAgICB8ICAzNCArLQ0KIHhlbi9k
cml2ZXJzL3ZwY2kvbXNpeC5jICAgICAgICAgICAgICAgICAgICAgfCAgNTYgKystDQogeGVuL2Ry
aXZlcnMvdnBjaS92cGNpLmMgICAgICAgICAgICAgICAgICAgICB8IDE1NyArKysrKystDQogeGVu
L2luY2x1ZGUveGVuL3Jhbmdlc2V0LmggICAgICAgICAgICAgICAgICB8ICAgOCArLQ0KIHhlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKw0KIHhlbi9pbmNs
dWRlL3hlbi92cGNpLmggICAgICAgICAgICAgICAgICAgICAgfCAgNDIgKy0NCiAyMiBmaWxlcyBj
aGFuZ2VkLCA4NzUgaW5zZXJ0aW9ucygrKSwgMjA1IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuNDIu
MA0K

