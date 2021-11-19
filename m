Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B11D456F73
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:17:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227901.394300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3lo-0000lL-Hg; Fri, 19 Nov 2021 13:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227901.394300; Fri, 19 Nov 2021 13:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3lo-0000hf-DI; Fri, 19 Nov 2021 13:17:36 +0000
Received: by outflank-mailman (input) for mailman id 227901;
 Fri, 19 Nov 2021 13:17:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo3lm-0000et-5Z
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:17:34 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d347ebc-493b-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 14:17:32 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJAxads008615;
 Fri, 19 Nov 2021 13:17:29 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ceanc8gsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:17:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6243.eurprd03.prod.outlook.com (2603:10a6:20b:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Fri, 19 Nov
 2021 13:16:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:16:09 +0000
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
X-Inumbo-ID: 0d347ebc-493b-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7fHcmVtZdVYLMTFibJZmGA5YIspP68z4iyvSOPYAA+pMS0BOq2kg7U/IaY4I3l0iq3ZnFNonTvwd2keqbOCLT6KhrNK/ii0ooikwOKQ7WutD2UZvIDyEVDcluMHxj39MltNMir2ai80wneTZ4PvS8DuNJoQMsxF0pJM0n+ceIg08hsyq91H/SlGS4juaE+00+RrhondzuuonHSNYipUs6CYiQhMusVoZD/5brZIm/O6lBNO6hbz6xJu+XpJ+l+eziDPKjp6JbJcDcOeRLMdGBRP0ghu04RNXyGRkkZPLe8XT21EF60M0bEjdo9tlYY9TFQ99txaQaPFwBQ4fu2DMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPQWGU7qPDNln0u34h2VZS/vtSsEAXSlCZS78ula56U=;
 b=c0uPXTG9xTtGSYxNrni4L2EgT3RDBBwHovrhBnZKPvUiXQkjLlaZaZz+c9rVrKe1m/vAic68fM6ujI1jm1AV+H8URjFd9wt6FoTb132/Nxw4UwEhdpUgfKOPmkuMVwaUZ4wNvi7fNg/aqN9z9UF6qTQ1ehTMG0gUjmbCtVG7mU9YhQQ1cgMZrBNdxZUDJJw1VcUdxaLN3+9PKwxbS1sBw8MP2oimBC0KWjNUudeTOGh/qCAO+y1AFyrA+lIuXR3WI3VO3oItVtGM73Bd6wzkgJ/+HFgsSvHlPAGH8jY6rsZ3Fdq54gOBvK8JjLB5Pi3nOjLPVJ4Wgm+w7csB4vApPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPQWGU7qPDNln0u34h2VZS/vtSsEAXSlCZS78ula56U=;
 b=dot7WrgapwIxe1FBoReHDz2L0GbtnRcMmhci82rKf4nIOQD2BWSLyNiaJCzztP7BTQPghZcPh6Ey5BsCJk8DTeH0vhs1RGNvepV4pFY2lPFH+F/CHzUZiVGwpPG6VRwUo/IW345UBXrMIJueTcAhfevCj+2l/La34yOnh5iXkW5NRN04k9+7GgLKxprAahHIp53R5NpmqQ7P9jJHmLpy8NS6SI5TbbePsOO2tp2MCUO6xmkgEBi2FGolznULLZ6+v95qbzOjXvV+1ZKoj4a8Ty+dY6O0rzzDsgDhjYOfAqs42R2FYrsPBdT+MQHoEovtw3IgaJOs7SKSOaFXd6ugng==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        "julien@xen.org"
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAIAAQRQAgAAGPgCAAAR1gIAAAvIAgAAFxACAAAoGAIAAAXMAgAABgYCAAAVtAIAAAX+AgAAB1wCAAVryAIAAB06AgAAEPgA=
Date: Fri, 19 Nov 2021 13:16:09 +0000
Message-ID: <5baf1199-e12d-cc41-4520-e32ed29a0436@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
 <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
 <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
 <ac0cc710-05b9-bdae-c31c-d159b4de0105@suse.com>
 <00e78d11-8e7b-84d2-5aa0-0a7f82f13af6@epam.com>
 <7dd919b8-0e3d-30dc-302a-9964f9d94ad2@suse.com>
 <fec02ac4-1ecf-18e1-7ed6-3b1094d60890@epam.com>
 <126a2864-e7e3-b887-43ff-55b1e59151b4@suse.com>
In-Reply-To: <126a2864-e7e3-b887-43ff-55b1e59151b4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdcd9f90-9fc6-49c6-c25c-08d9ab5ec0b0
x-ms-traffictypediagnostic: AM0PR03MB6243:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6243356771D943703492C14FE79C9@AM0PR03MB6243.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eK0Q8i0PbGNXT7Tl7fbFf5F1Z2cLu7JwEoKLf3uoD0jmAG/XOWyiclQD7hyB3QPB5ACaTdYo3oiqWnxNOQEKtpMwe75p8dzTKNsC53f2DXMWt2EaZwdzQQ7YxZhSsVzMrodNZbbd2SFlHC4WvOqmKv7rOH6ECeYL5Sc+I6bHEDIyCiZoFunyr1hnfOqIgGiwD0Bd/J8yIDo/cGZik7Oi2hpSZv3lJ9os6Yj3/FcNcHfZ+nv9Bk6r8RTH23Gq2v/uTkJg7Q7v9NRTPtY6mVJxWBrGYLYjnEosP7BIol46Qk2p527k8wNs7P6NeP4RpbN9qmOUxHsxVAJEyWGKpzTM3kNe/JIoZUOR1cCOiPWIeC5QlImUPRU4JZPEtWArQmGYg0N8RwwGWBjQ2KcLghL12VZj0uuQ+CzOaphM9b8AZzM9Cm8IVBHumIw9YWqjUVT66HNhrHppfT42zWKKKQHyx2F/QkzdqPQThuN3pKXuTXxKwIvfiGqGQqt3/rcWSMfEhcSfpXne1SIOAMSWtnvPb9NRFpGASqfYd8kyB0aiu+xta4mEhr6dzf/GSDuagbdCEXX1mcWiIW3pZ0FCXSbEE405z/xFe5meXwHwFa47Vg7GSOngTEcd9Id45b5miUo1f1xjiICzwMwQO8Ma7qxcXZidU8XOpXfJ9PgQhVXS7zyg0MRjWfRSlDC3G/QxGWXcNZY+UnSgw4JQuV+yAuL+MnlgWdBeq3pCE/u5qUj/zotdtN1JuoNthAQgN1jOaCZL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(86362001)(186003)(53546011)(6916009)(66946007)(4326008)(508600001)(66476007)(7416002)(26005)(31686004)(6506007)(54906003)(316002)(6512007)(31696002)(5660300002)(8676002)(2906002)(66446008)(2616005)(64756008)(76116006)(91956017)(122000001)(66556008)(38070700005)(71200400001)(83380400001)(8936002)(36756003)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cm5uSzlIV2lDRUE4WFl4RnpEMGRjL2Rna2RaKzN1T1ZkemhRdEIrOWNMOXNZ?=
 =?utf-8?B?amlHbkRrZzIrRXV1THlXeXRWN3FuemhtZWMybWFOYVpwdzV3SlpmUXZ0MmF3?=
 =?utf-8?B?MXd5NTQ4NDJBcm5RUmtMYzJiY2lnZGJUWkU2TFFyOSs3RHJQQTlnNERjUVNE?=
 =?utf-8?B?c1FGMlRTU0JHa0xld3RkQmRrcndZMUd6Z2F3WTB2c0d6OHJGMi9QNmtrQ2VQ?=
 =?utf-8?B?SEovMUdLZHBiRzA0ekpkZGFJK2VMMzZEbWw3U0d0eUp4QmFYUFoxeXYxdklz?=
 =?utf-8?B?T1dIeVhUTG5vRDVBKy9vMEJPYmMreDZZaHdKcUZtS3Q4b1ZpTzFacmdxelBN?=
 =?utf-8?B?SmMvclp1M1ljdm5lWlAwRG8rZEVtMCtHc2NWS2JLSG9RM0YrNllBOVVETUww?=
 =?utf-8?B?dStKTnRNMStnZW1NZEdOQXA5NUhKSitnOG5LaHpLZEQ0RkNYZXVoV1JNVWZw?=
 =?utf-8?B?L0hsSVcxU3RUN2x4L25jSjlUaGF2Mm5ENGRBT0tVWThQaUNSNkVla1RRM3Mw?=
 =?utf-8?B?TzVlTENtZmphM0c5WGRMeVVQUHRZVjY1VHlPakRoSjVmZVAydkljaEhBMi9y?=
 =?utf-8?B?OGdmZXVOM0VIY29PeFRYMDg5Y3BJLzJlelNndzRzN3VxMzdHK2ZVekFubzA2?=
 =?utf-8?B?YlcwM1o5ZTM2SHREQWo1WDlBbW93a2IrQ1pUT2lBSXNJWlN4ZldvNkE1OEhK?=
 =?utf-8?B?WHJoT3BPTHh1c0hSMmtROTNKTDhBM09nU1oybG9odlBXTXZVQ1VEb0tiTU5y?=
 =?utf-8?B?RG04UjF5TnR2UThPaGJ0OVM5VFBKNkFKbTdEWTk2V0ZPZ05aN1F6M2gwOWxj?=
 =?utf-8?B?Z0V1dytDcEl6VnZXamNKY0V5NndtMG9SZ3hSb2tDa3VzNXVwNHdKRUxWejIw?=
 =?utf-8?B?NHVXQnNjN3dFM25BZ002RlMxWmNOdnExY0tMRDJOeWZzNng2bjZOazdCWm5J?=
 =?utf-8?B?dWN5TDNpbU9WL252YWp5UlZlTzJ1dnMvdXQrRm1JNmorRUt2V0hDdytOQVlH?=
 =?utf-8?B?ZW1jWWF1T2paZzgydFFuYTF6dzJ2MFFIV0RkcUUwTjFUbGJZd25RQ2V3N21U?=
 =?utf-8?B?ZUdNQkJwK0FrM0UvamRKUXlUa1dTLzVtSDA4ZlNiUkgrRGtZMFZjWVRFbFkv?=
 =?utf-8?B?QUQ4VXhlcmFoU2FrNXV2VGJROFpJTENzTEJnSzBQTmt5OHYvN0JOR2Z2NThX?=
 =?utf-8?B?VjdhTDhyQTZMdmVpRmg4dFVCdmd2WXVMb0RyaDVVZU5uRFRJWmpGOWkxRXlo?=
 =?utf-8?B?bEdRdy9SZktxRnRsb1IweUFmL0E3WDQ2MTY3Zytlek8rSU1Jd3poZnFYLzBq?=
 =?utf-8?B?VzdKQWZIdEtYUW5qVFJxREwvcWY3M20vdUswSHpVMGIvTWljVXE4RitqUVdD?=
 =?utf-8?B?RDZMbVQxeDNnNnlONVhOOTI4d1lBWE9aMVI3VmxZanpLdmpoeHRTTFEzYWlr?=
 =?utf-8?B?R2VWRDh5bFB4MDBqejU3bnZoYmxnNXA4TXhQeXR6aCtaaER4U3VXUkd4ZERV?=
 =?utf-8?B?TkRnUTIxeVBhNzN0b0FOT0NyeHF5RURiK2pNa3l6S3hWUkFWQTFMcnoxOUVp?=
 =?utf-8?B?ekMxMmlFV081MWlCVWg4UnkwM0NkTU0xZGhzRzNlTE5PUG9HOElQRHAxVlg4?=
 =?utf-8?B?ejJvOGw0MXJJLzZmcVF0cEF4aEo0QnhxUEY1YnFVWEpZNXQrYytSTEI1ZVg0?=
 =?utf-8?B?OHBnOFZxbTljczU4cTcwRzVqaTNJY0ZlNjZiS0pCSEhmeEFxbmFsMTltTTE5?=
 =?utf-8?B?L2pKcnNwSHVZbTBUbGd3dFlOb0lZblY1SURpSHZIaXVtTzlQdDkzSnpyOGZj?=
 =?utf-8?B?Q0F0THVLL2drK0ZNNk9aMmg1eEZEcndMSHltQ0cybUdZNzFpV2dVYmwzK2NN?=
 =?utf-8?B?bmszWTU1dldYUU0vOFA4UGlwRllHQ0pUYkFYUmV4aHhOakhZZld1WUNLVjBr?=
 =?utf-8?B?cHpnbEJ0QkU3bTF2RWxUWmVpM2FOVjhhKzhkM3BHOXJhbm12a0F1UitHT0RE?=
 =?utf-8?B?UW9lZHBScWxTN2pLMTMzRXRDQzJLczZ3WnpRRjhsbnk4eUxoTTA5T3VNa0dW?=
 =?utf-8?B?OUhVc1E4dk9UU1hidVU5ZlorSkRZdHRkUWhKdkFYQ2RwckxzaWFReWdGWUt3?=
 =?utf-8?B?aHN2dFBraXQ4aDRXUnF2RlcxTHpnRXRFOUdsRDZzdEI0bWREb1NWY2h0R2lY?=
 =?utf-8?B?cjlFTjNoeUtTTmljQkNvczN2bmpKdC9Hai9RR1kxOTROQ0htSUZUTEc3TUNq?=
 =?utf-8?B?ai9EZ0NRTmx3M05IN3pIcHYrQzZ0eEorWHlSYTBWUXIxWTdpb3luRk9oQ09y?=
 =?utf-8?B?V2t2bFRXRzVmdkxKWXFsWDNHLzhKWC9rMktpNmJPck0wcWxaQ1Fhdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AC77DBC3F90D946B8DEFCD14ACC4EB1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcd9f90-9fc6-49c6-c25c-08d9ab5ec0b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 13:16:09.6585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9eU7b4qzcAT1mxeNR957ykrUH5+5lhOJ7ACj6zEd1jaOY99FvswmTdfPFeZtYq5IJeeg7SSNKzg45nRYGU50XAGDDPB2jEFmxa0vIQZBz4Ca9zwBtfaHbWzEIiciNAQH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6243
X-Proofpoint-ORIG-GUID: ja5GJwD51gLsHpD23ceB5JeFFaA5Qy4o
X-Proofpoint-GUID: ja5GJwD51gLsHpD23ceB5JeFFaA5Qy4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190074

DQoNCk9uIDE5LjExLjIxIDE1OjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxMzozNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBQb3NzaWJsZSBsb2Nr
aW5nIGFuZCBvdGhlciB3b3JrIG5lZWRlZDoNCj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQ0KPj4NCj4+IDEuIHBjaWRldnNfe2xvY2t8dW5sb2NrfSBpcyB0b28gaGVh
dnkgYW5kIGlzIHBlci1ob3N0DQo+PiAyLiBwZGV2LT52cGNpLT5sb2NrIGNhbm5vdCBiZSB1c2Vk
IGFzIHZwY2kgaXMgZnJlZWQgYnkgdnBjaV9yZW1vdmVfZGV2aWNlDQo+PiAzLiBXZSBtYXkgd2Fu
dCBhIGRlZGljYXRlZCBwZXItZG9tYWluIHJ3IGxvY2sgdG8gYmUgaW1wbGVtZW50ZWQ6DQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLmgNCj4+IGluZGV4IDI4MTQ2ZWU0MDRlNi4uZWJmMDcxODkzYjIxIDEwMDY0NA0KPj4g
LS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oDQo+PiBAQCAtNDQ0LDYgKzQ0NCw3IEBAIHN0cnVjdCBkb21haW4NCj4+DQo+PiAgIMKg
I2lmZGVmIENPTkZJR19IQVNfUENJDQo+PiAgIMKgwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgcGRl
dl9saXN0Ow0KPj4gK8KgwqDCoCByd2xvY2tfdCB2cGNpX3J3bG9jazsNCj4+ICvCoMKgwqAgYm9v
bCB2cGNpX3Rlcm1pbmF0aW5nOyA8LSBhdG9taWM/DQo+PiAgIMKgI2VuZGlmDQo+PiB0aGVuIHZw
Y2lfcmVtb3ZlX2RldmljZSBpcyBhIHdyaXRlciAoY29sZCBwYXRoKSBhbmQgdnBjaV9wcm9jZXNz
X3BlbmRpbmcgYW5kDQo+PiB2cGNpX21taW9fe3JlYWR8d3JpdGV9IGFyZSByZWFkZXJzIChob3Qg
cGF0aCkuDQo+IFJpZ2h0IC0geW91IG5lZWQgc3VjaCBhIGxvY2sgZm9yIG90aGVyIHB1cnBvc2Vz
IGFueXdheSwgYXMgcGVyIHRoZQ0KPiBkaXNjdXNzaW9uIHdpdGggSnVsaWVuLg0KV2hhdCBhYm91
dCBib29sIHZwY2lfdGVybWluYXRpbmc/IERvIHlvdSBzZWUgaXQgYXMgYW4gYXRvbWljIHR5cGUg
b3IganVzdCBib29sPw0KPg0KPj4gZG9fcGh5c2Rldl9vcChQSFlTREVWT1BfcGNpX2RldmljZV9y
ZW1vdmUpIHdpbGwgbmVlZCBoeXBlcmNhbGxfY3JlYXRlX2NvbnRpbnVhdGlvbg0KPj4gdG8gYmUg
aW1wbGVtZW50ZWQsIHNvIHdoZW4gcmUtc3RhcnQgcmVtb3ZhbCBpZiBuZWVkIGJlOg0KPj4NCj4+
IHZwY2lfcmVtb3ZlX2RldmljZSgpDQo+PiB7DQo+PiAgIMKgIGQtPnZwY2lfdGVybWluYXRpbmcg
PSB0cnVlOw0KPj4gICDCoCByZW1vdmUgdlBDSSByZWdpc3RlciBoYW5kbGVycyA8LSB0aGlzIHdp
bGwgY3V0IG9mZiBQQ0lfQ09NTUFORCBlbXVsYXRpb24gYW1vbmcgb3RoZXJzDQo+PiAgIMKgIGlm
ICggIXdyaXRlX3RyeWxvY2soZC0+dnBjaV9yd2xvY2spICkNCj4+ICAgwqDCoMKgIHJldHVybiAt
RVJFU1RBUlQ7DQo+PiAgIMKgIHhmcmVlKHBkZXYtPnZwY2kpOw0KPj4gICDCoCBwZGV2LT52cGNp
ID0gTlVMTDsNCj4+IH0NCj4+DQo+PiBUaGVuIHRoaXMgZC0+dnBjaV9yd2xvY2sgYmVjb21lcyBh
IGRlZGljYXRlZCB2cGNpIHBlci1kb21haW4gbG9jayBmb3INCj4+IG90aGVyIG9wZXJhdGlvbnMg
d2hpY2ggbWF5IHJlcXVpcmUgaXQsIGUuZy4gdmlydHVhbCBidXMgdG9wb2xvZ3kgY2FuDQo+PiB1
c2UgaXQgd2hlbiBhc3NpZ25pbmcgdlNCREYgZXRjLg0KPj4NCj4+IDQuIHZwY2lfcmVtb3ZlX2Rl
dmljZSBuZWVkcyB0byBiZSByZW1vdmVkIGZyb20gdnBjaV9wcm9jZXNzX3BlbmRpbmcNCj4+IGFu
ZCBkbyBub3RoaW5nIGZvciBEb20wIGFuZCBjcmFzaCBEb21VIG90aGVyd2lzZToNCj4gV2h5IGlz
IHRoaXM/IEknbSBub3Qgb3V0cmlnaHQgb3Bwb3NlZCwgYnV0IEkgZG9uJ3QgaW1tZWRpYXRlbHkg
c2VlIHdoeQ0KPiB0cnlpbmcgdG8gcmVtb3ZlIHRoZSBwcm9ibGVtYXRpYyBkZXZpY2Ugd291bGRu
J3QgYmUgYSByZWFzb25hYmxlIGNvdXJzZQ0KPiBvZiBhY3Rpb24gYW55bW9yZS4gdnBjaV9yZW1v
dmVfZGV2aWNlKCkgbWF5IG5lZWQgdG8gYmVjb21lIG1vcmUgY2FyZWZ1bA0KPiBhcyB0byBub3Qg
Y3Jhc2hpbmcsDQp2cGNpX3JlbW92ZV9kZXZpY2UgZG9lcyBub3QgY3Jhc2gsIHZwY2lfcHJvY2Vz
c19wZW5kaW5nIGRvZXMNCj4gICB0aG91Z2guDQpBc3N1bWUgd2UgYXJlIGluIGFuIGVycm9yIHN0
YXRlIGluIHZwY2lfcHJvY2Vzc19wZW5kaW5nICpvbiBvbmUgb2YgdGhlIHZDUFVzKg0KYW5kIHdl
IGNhbGwgdnBjaV9yZW1vdmVfZGV2aWNlLiB2cGNpX3JlbW92ZV9kZXZpY2UgdHJpZXMgdG8gYWNx
dWlyZSB0aGUNCmxvY2sgYW5kIGl0IGNhbid0IGp1c3QgYmVjYXVzZSB0aGVyZSBhcmUgc29tZSBv
dGhlciB2cGNpIGNvZGUgaXMgcnVubmluZyBvbiBvdGhlciB2Q1BVLg0KVGhlbiB3aGF0IGRvIHdl
IGRvIGhlcmU/IFdlIGFyZSBpbiBTb2Z0SVJRIGNvbnRleHQgbm93IGFuZCB3ZSBjYW4ndCBzcGlu
DQp0cnlpbmcgdG8gYWNxdWlyZSBkLT52cGNpX3J3bG9jayBmb3JldmVyLiBOZWl0aGVyIHdlIGNh
biBibGluZGx5IGZyZWUgdnBjaQ0Kc3RydWN0dXJlIGJlY2F1c2UgaXQgaXMgc2VlbiBieSBhbGwg
dkNQVXMgYW5kIG1heSBjcmFzaCB0aGVtLg0KDQpJZiB2cGNpX3JlbW92ZV9kZXZpY2UgaXMgaW4g
aHlwZXJjYWxsIGNvbnRleHQgaXQganVzdCByZXR1cm5zIC1FUkVTVEFSVCBhbmQNCmh5cGVyY2Fs
bCBjb250aW51YXRpb24gaGVscHMgaGVyZS4gQnV0IG5vdCBpbiBTb2Z0SVJRIGNvbnRleHQuDQoN
ClRodXMsIEkgdGhpbmsgd2UgbmVlZCB0byByZW1vdmUgdnBjaV9yZW1vdmVfZGV2aWNlIGNhbGwg
ZnJvbSB2cGNpX3Byb2Nlc3NfcGVuZGluZw0KYW5kIGNyYXNoIHRoZSBkb21haW4gaWYgaXQgaXMg
YSBndWVzdCBkb21haW4uIExlYXZlIHdpdGggcGFydGlhbGx5IGRvbmUgbWFwL3VubWFwIGlmDQpp
dCBpcyB0aGUgaGFyZHdhcmUgZG9tYWluIGFzIHBlciBSb2dlcidzIGNvbW1lbnQgaW4gdGhlIGNv
ZGUuDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

