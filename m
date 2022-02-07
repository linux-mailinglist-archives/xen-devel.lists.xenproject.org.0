Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5284AC11C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267020.460728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4zZ-0003eN-2A; Mon, 07 Feb 2022 14:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267020.460728; Mon, 07 Feb 2022 14:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4zY-0003aZ-Ue; Mon, 07 Feb 2022 14:27:44 +0000
Received: by outflank-mailman (input) for mailman id 267020;
 Mon, 07 Feb 2022 14:27:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH4zX-0003ZU-IL
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:27:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b4bfc75-8822-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 15:27:42 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217EEgIk023707;
 Mon, 7 Feb 2022 14:27:38 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e350ur22y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 14:27:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3181.eurprd03.prod.outlook.com (2603:10a6:803:20::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 14:27:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 14:27:34 +0000
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
X-Inumbo-ID: 1b4bfc75-8822-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Og7NKwuYM1RS0ElTfeuVX+L+YIFRnUJC+Lk7oPq/KXYHBmuiSkFLDAuT9ZSGd+0N39HnONOs4ehBxcjLKnclFESLgzG9RgdL0A4Pv9jwycCWaZhl//0+13AijQCQYCBU/6llfF7X+ZKj749ys6snOql1YtDA/D7CiPgftnumu51FJw9wxzzQDpEczgV236LQ/pkjH3uVYQaGtwxSqljYTPjdGtSrnXKXYSJOaYGVH16TJU4QvdVARu+kaszeIj5EhGyQb0aQ/PdvOU7WYjHya2bvjW2/ucQ7jX1BCbW6myyMca8FsUuoR3/geeUVnJEdTBG9cN6kOeyP6F//jl0AtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFitlRpoEQ6qy5DSpWUWar+1P+kUxJFK6CfNp+aMM/8=;
 b=WZvDmZy1DEl2jxhlqLy+tklxXeQv2Q7rlvhz1BliNwpS00A0PDzndxrP3Sv9uOC3VKvyqcx9qV20dhh8FQhLwadcBsUEF7E5/17zmtllYcepjHJKxpyLtV563p0u2o8imeEq7PUawwJYFRKRCN9mWE8vEhkfgD4X7hANNgCTNaUVU39U/F/W+kzqoXbtJU+XzUDxima9VLO4sqbfoOZj6B+MWJkVjuyuTfg2v+oYvbOLRvg4QDWuArNVZyf/Bsmz2/0Af1n9o8pyqr4BCAlMAtJn6rLSO74zpCPKkIWW73UBYJooN4+WHnMfLlxcbjJu3AmHi6pW1UhylfXg09/AIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFitlRpoEQ6qy5DSpWUWar+1P+kUxJFK6CfNp+aMM/8=;
 b=O0bsJWzLygw7OEAjK2OqlHSwNJaZ9us0QXiKtdMkw11DeeL7MtxPQXKRAiEHLVkNIa/wx4dVoRnXYYrqEE6pqGoN4wyXWiCSxJUSKbT79I2V1jfGYi4UfczQaHSjt+gKypdaMRkkELW/JsehBgl79Pc+KAuZfGsacYPGUHg8yREEYMskOa242SUFaLLo/2jBWetEDPwBZKunsSZlOVpjwL3gy7m7lDUsL3mdqtLLT4wLm3/l8rrbBMPHDzMsCRLwa/WNc8+aU0T8y7jj2NGeDRh0bV7qsVHJwzDQIhzStJONONBharpwb/xlka5fdELA653TDdnwLjRLRexPl7zUPw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAHKQCAAAJXgA==
Date: Mon, 7 Feb 2022 14:27:33 +0000
Message-ID: <38b779e6-94fc-b54f-39e2-f97739b6846a@epam.com>
References: <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <YgEqXhxOqKq92+Xn@Air-de-Roger>
In-Reply-To: <YgEqXhxOqKq92+Xn@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f2b7f17-7183-4228-fbde-08d9ea45fb5f
x-ms-traffictypediagnostic: VI1PR0302MB3181:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3181DB54B5986333B746C768E72C9@VI1PR0302MB3181.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lWWVC6Anryf7sz5P3OmBcLnk4TkizX62QHSTz1X+yE7CuVBpwr6wQA6gSwDNF/7JJleVFL1GD5ewTnGN0ExCjFQ7QsO/pTzcYoJ3e+O43rWiwZBD9CISvPMRz0RLtz6BtGfa3qWeh7SbX8sX434m/I6eA2+IDy/TeUUtjbHYNBmCWpvosvlFKevih31z7A/73oBt1+18SmsVEV5RAAcJXdQg+1CtvrTaUUhXqQdTSXFM2YifXSSqVP9/vWCpbkuTgZcRPqv2W8lRDi8XUS4qiA8//+XvyesXC7gelZEJXKrVleewfpaQHMzbJz8P61SVt7x5SZkBIwmvlznDpcPX+gIvv27k9XX22/qpzdGr8fnmxDNYQBJG1CKUOz8I+xqn4sHKRv287p+3yXauq5MNXJovKjKLH3z3O8hjfUIKb/RhB0iy9+pLEeOtyVL/WsTDgZOLPHfV/8uv1GvAzn2VKPVwUCwPynlU3RRpEYIWPhkpxMX3zZl0dp17emE640uN0ZpAn934iusc+ao1GDEnjXnFTME8FiAZOujPOEuXi7wo5YfgwL10s9ofut2/hYopLjP/IEvHVJhs6aRqdoJcQn9N8nY8p5sffVnUFvmUqyDnyUKTZVHkgM7hlvcTKqlpOzjiDz+Wb6Wi3M9r1EDqNWRHrbbQgZJ5MvU8nw+eq/NigdVE36Yr/RtLNUPa2JLKXuaix7wfCyia23cZhfg7CUazEMd/EmRwvhur1oJby7wOVCdA9Sn0dy9ZsGX2Zk4L
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6506007)(2906002)(122000001)(53546011)(66446008)(6486002)(76116006)(66946007)(8936002)(66476007)(66556008)(8676002)(64756008)(4326008)(86362001)(91956017)(71200400001)(38100700002)(55236004)(38070700005)(31686004)(5660300002)(7416002)(6512007)(2616005)(6916009)(26005)(186003)(83380400001)(316002)(31696002)(36756003)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YzY4SzB2bDN4RTRaWDcvbDYxaHI4YU5UL1pXWmRXY3BHN3UyZVZiR3dTMDhK?=
 =?utf-8?B?bVRvK0FGSmRyUW5tU0JsZEJtekF4S0p3SkhBNG1ORG1XeSszTlZBRGRNQ3Fv?=
 =?utf-8?B?Y2ZLKzBwYUF6d2NQMFZIYXZSME9XMFMwcGRub2JHdStBWTR5dTUwa1pvQk52?=
 =?utf-8?B?b0xhWUtFa3FPanc4dDZGenlPdUVTNytBcUtQK3crNUdoVVJpcDNYSXZRRS9t?=
 =?utf-8?B?ODFIb0tMTlByQk5hYXdQNlc2WVkyb2Vza01TMmtDa3ZKU3VxYUdwVXZFWnpY?=
 =?utf-8?B?dmNHTHEySnlYaU1lQkxpb3daT0xjbFlYdDc2TEVVeVFPS3RpakdZTXBWZkRP?=
 =?utf-8?B?a0F2ME5Ca3VuVjJxMVdPaU9xRFYzL1lOdS84NDZVTExwU2YwcGZqV3NkblQw?=
 =?utf-8?B?bEhoMVFxSnVpUEJhM1ZpU2FEM04zdHJRSWVzcVZCVGkwUlY1b3lwWG9HeDlD?=
 =?utf-8?B?d251N1VlcEs3cTh0ZUFCYVBQa3BxWExXUkI5ZVhBU1FlRW1iYlJTUkpIRUJJ?=
 =?utf-8?B?WjhuUDAwSjlsekF1bnNpUkVib3crYXB1dUVKazl4OU9rN0RmN3BoV1BnMTRR?=
 =?utf-8?B?R2wwZXBpMzlnenJXYlFWcGRlTjU1bDZIblQvSXpTYy92eXVNMjlNNnU4TU9a?=
 =?utf-8?B?RTVEUklKbTdGc1FwNFdWMjcyejJPdVJvckx2V055S29WbmRRYW9jUFpGM1Y4?=
 =?utf-8?B?QkJvcGt3eVAvQTgyY0NHZk4vMzdmYnVEcmNKekY1UHRDci94S3BvOTM4c2p1?=
 =?utf-8?B?U1FqdDRkM0xrQWFOZHNkQ3dLWmx0VEFWVVZwdlJiWFZuY0Q2UnltMzhFVDYv?=
 =?utf-8?B?c0NpVnNqOFJCWVJ6T1VNbmI3eEhJdnJWQncxQ2dMak83R2ROUWZlcHFBMGFB?=
 =?utf-8?B?dlFCR0Z4cVBmOHF4OTUreXpjR1VQZlBPbER6MjBNV2Z0WkRnQ2NaQ3p3ODZ1?=
 =?utf-8?B?TnlKSGV5NzdUYTk2SVlEZ1ZReVFJeHdxdXE0YmZUNVFjbWcrWUI0QkRPd05K?=
 =?utf-8?B?VlhNOUNJc1d6MGlqdm52Y0dHWVU3bDFUeXZEMHQva21LWTJOZk1yYzR6aFo4?=
 =?utf-8?B?L0ZXelNPVWU4MGVGL3djU0dPek5uTlBSaFRCQ292THA4NUt1YjJaaHBvUy94?=
 =?utf-8?B?dm1UbTl6Q1FtbDdTV25EaDRRajYwVzBMUWxaeGVWa29uRi9JNHFHVjhIQWJ5?=
 =?utf-8?B?ZHQyRjZwbWxVRnFpbHVJQyt1amc1dXlUQUhDT2xqNmZFOFNOTmN1YVFib2pX?=
 =?utf-8?B?c3lRVEQyM05wZGtYQjdNTFlhNWE0NnZlZ2VGUTJoUnNPNDEwYzdPTlNBSXlx?=
 =?utf-8?B?aWtuSjc5M21kWi9XdTRZWTc2UzFjQWpvQTF0WTBLL2c0clRaaDBlMEdaVExr?=
 =?utf-8?B?RnJLb3hmZ2ZOVStpell2YjkwM3V2dzNRVXVYbVV2bFI2Szdxbk1pMkVsRHVW?=
 =?utf-8?B?RFJPODYrK1NIUkRnUXV1dEhZZmkrOVE1OUZ1enhiL2lTaUwyckFaVjJycG5q?=
 =?utf-8?B?U1A4QW5xa0YrS0pGc3UwcXM0SnRKM2RJd25CdXFaWUtiakk5U3oyQjNPeGg2?=
 =?utf-8?B?WHdnVXo5UXdYSjNTaTU1QTN5YWNRNlZiVTR2WDBkYjNMeHlhNytZektLRHp3?=
 =?utf-8?B?MTYxM2lQV21MNkh5d2lzZ2gzODd1OG83Q0xpdXM3UFpDV2tWbStNU0JMUW5x?=
 =?utf-8?B?MmYyaThUbUgxZ1UyV3ozeGt0MlREemdpK0ZtQnRsUXA4R0pmbTNMdVBEL1N3?=
 =?utf-8?B?SGdHTFo3bnhkUXhmeHFncjg5SlBtQ2xlMVUyK1RKRFNiT3dhbHdGUnBWZCtZ?=
 =?utf-8?B?eEFTVmtqbjFJQkxQZWhYZGVKZUdweTFvZUtNZXlwVWhqMHpnSkNkZ2t4V1dl?=
 =?utf-8?B?aE5sVHQwcU9oNmlHb1NWa3MrQ2pwWTR5ZkZoakVPT2xVNmp6ZXM4TWdGTzNh?=
 =?utf-8?B?ZW1XR0RJS0ozMkFzUzNYVWZNcVZ0b1cvZFhPZW5mWk9WR21JM3NJSXMyemF2?=
 =?utf-8?B?VFB4QTNZVDRWRmQycVFhdUJodE54bTNXTEZHclY4MkljWGJrMEo4NjZHTE1k?=
 =?utf-8?B?aDFtR291WkkydkErbmJaUzNQaitRR0FDRlR4Z3F4eWlZTjVhOWtReGUreWZ4?=
 =?utf-8?B?Z2tpM3M2dkR0TkJNeDdxdzRVTU0rSVh5dXc3Tm5yaFpOUmJxWjFPUXlaK1Ir?=
 =?utf-8?B?QXFtNUFZUUEyMHNDNE1wRXVraGpwcytZWDZKZjhVQ1VJcVlLTlZwdTFZUDNy?=
 =?utf-8?B?S0pyRDFSc0w3dC80TzN6N3lGQUYvbjNLMHVQNGhjV2E4cEw1czRWRUdMQVMv?=
 =?utf-8?B?dlFhbExwaW9BTUpZV1RxK1ljRWVTNzZ2RUMzcnpVK05rODRvYzJMZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF34A2A5E5FD12408B0CD5CFDF202B56@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2b7f17-7183-4228-fbde-08d9ea45fb5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 14:27:33.9556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OLIDV3CujGp/+OEPXiNlNdEkflYbfWwyIr1Ff8qWzuMAvc52l2KU4qQyuBZe30XUMc2G5/ay7kiGnZqGtyL+J3lbVVDCw1DMTZaYLUniraz9YpABhOvsObWQjM6RwxX7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3181
X-Proofpoint-GUID: RkYBYeFL5wma1lLtUb55Z7nqssqN37br
X-Proofpoint-ORIG-GUID: RkYBYeFL5wma1lLtUb55Z7nqssqN37br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=411 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070092

DQoNCk9uIDA3LjAyLjIyIDE2OjE5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEZlYiAwNywgMjAyMiBhdCAwMTo1MzozNFBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAwNy4wMi4yMiAxNDo0NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBNb24sIEZlYiAwNywgMjAyMiBhdCAxMTowODozOUFNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCj4+Pj4NCj4+Pj4gQm90dG9tIGxpbmU6DQo+Pj4+ID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09DQo+Pj4+DQo+Pj4+IDEuIHZwY2lfe3JlYWR8d3JpdGV9
IGFyZSBub3QgcHJvdGVjdGVkIHdpdGggcGNpZGV2c19sb2NrIGFuZCBjYW4gcnVuIGluDQo+Pj4+
IHBhcmFsbGVsIHdpdGggcGNpX3JlbW92ZV9kZXZpY2Ugd2hpY2ggY2FuIHJlbW92ZSBwZGV2IGFm
dGVyIHZwY2lfe3JlYWR8d3JpdGV9DQo+Pj4+IGFjcXVpcmVkIHRoZSBwZGV2IHBvaW50ZXIuIFRo
aXMgbWF5IGxlYWQgdG8gYSBmYWlsIGR1ZSB0byBwZGV2IGRlcmVmZXJlbmNlLg0KPj4+Pg0KPj4+
PiBTbywgdG8gcHJvdGVjdCBwZGV2IGRlcmVmZXJlbmNlIHZwY2lfe3JlYWR8d3JpdGV9IG11c3Qg
YWxzbyB1c2UgcGRldnNfbG9jay4NCj4+PiBXZSB3b3VsZCBsaWtlIHRvIHRha2UgdGhlIHBjaWRl
dnNfbG9jayBvbmx5IHdoaWxlIGZldGNoaW5nIHRoZSBkZXZpY2UNCj4+PiAoaWU6IHBjaV9nZXRf
cGRldl9ieV9kb21haW4pLCBhZnRlcndhcmRzIGl0IHNob3VsZCBiZSBmaW5lIHRvIGxvY2sgdGhl
DQo+Pj4gZGV2aWNlIHVzaW5nIGEgdnBjaSBzcGVjaWZpYyBsb2NrIHNvIGNhbGxzIHRvIHZwY2lf
e3JlYWQsd3JpdGV9IGNhbiBiZQ0KPj4+IHBhcnRpYWxseSBjb25jdXJyZW50IGFjcm9zcyBtdWx0
aXBsZSBkb21haW5zLg0KPj4gVGhpcyBtZWFucyB0aGlzIGNhbid0IGJlIGRvbmUgYSBwcmUtcmVx
IHBhdGNoLCBidXQgYXMgYSBwYXJ0IG9mIHRoZQ0KPj4gcGF0Y2ggd2hpY2ggY2hhbmdlcyBsb2Nr
aW5nLg0KPj4+IEluIGZhY3QgSSB0aGluayBKYW4gaGFkIGFscmVhZHkgcG9pbnRlZCBvdXQgdGhh
dCB0aGUgcGNpIGxvY2sgd291bGQNCj4+PiBuZWVkIHRha2luZyB3aGlsZSBzZWFyY2hpbmcgZm9y
IHRoZSBkZXZpY2UgaW4gdnBjaV97cmVhZCx3cml0ZX0uDQo+PiBJIHdhcyByZWZlcnJpbmcgdG8g
dGhlIHRpbWUgYWZ0ZXIgd2UgZm91bmQgcGRldiBhbmQgaXQgaXMgY3VycmVudGx5DQo+PiBwb3Nz
aWJsZSB0byBmcmVlIHBkZXYgd2hpbGUgdXNpbmcgaXQgYWZ0ZXIgdGhlIHNlYXJjaA0KPj4+IEl0
IHNlZW1zIHRvIG1lIHRoYXQgaWYgeW91IGltcGxlbWVudCBvcHRpb24gMyBiZWxvdyB0YWtpbmcg
dGhlDQo+Pj4gcGVyLWRvbWFpbiByd2xvY2sgaW4gcmVhZCBtb2RlIGluIHZwY2lfe3JlYWR8d3Jp
dGV9IHdpbGwgYWxyZWFkeQ0KPj4+IHByb3RlY3QgeW91IGZyb20gdGhlIGRldmljZSBiZWluZyBy
ZW1vdmVkIGlmIHRoZSBzYW1lIHBlci1kb21haW4gbG9jaw0KPj4+IGlzIHRha2VuIGluIHdyaXRl
IG1vZGUgaW4gdnBjaV9yZW1vdmVfZGV2aWNlLg0KPj4gWWVzLCBpdCBzaG91bGQuIEFnYWluIHRo
aXMgY2FuJ3QgYmUgZG9uZSBhcyBhIHByZS1yZXEgcGF0Y2ggYmVjYXVzZQ0KPj4gdGhpcyByZWxp
ZXMgb24gcGRldi0+dnBjaV9sb2NrDQo+IEhtLCBubywgSSBkb24ndCB0aGluayBzby4gWW91IGNv
dWxkIGludHJvZHVjZSB0aGlzIHBlci1kb21haW4gcndsb2NrDQo+IGluIGEgcHJlcGF0Y2gsIGFu
ZCB0aGVuIG1vdmUgdGhlIHZwY2kgbG9jayBvdXRzaWRlIG9mIHRoZSB2cGNpIHN0cnVjdC4NCj4g
SSBzZWUgbm8gcHJvYmxlbSB3aXRoIHRoYXQuDQo+DQo+Pj4+IDIuIFRoZSBvbmx5IG9mZmVuZGlu
ZyBwbGFjZSB3aGljaCBpcyBpbiB0aGUgd2F5IG9mIHBjaV9kZXYtPnZwY2lfbG9jayBpcw0KPj4+
PiBtb2RpZnlfYmFycy4gSWYgaXQgY2FuIGJlIHJlLXdvcmtlZCB0byB0cmFjayBhbHJlYWR5IG1h
cHBlZCBhbmQgdW5tYXBwZWQNCj4+Pj4gcmVnaW9ucyB0aGVuIHdlIGNhbiBhdm9pZCBoYXZpbmcg
YSBwb3NzaWJsZSBkZWFkbG9jayBhbmQgY2FuIHVzZQ0KPj4+PiBwY2lfZGV2LT52cGNpX2xvY2sg
KHJhbmdlc2V0cyB3b24ndCBoZWxwIGhlcmUgYXMgd2UgYWxzbyBuZWVkIHJlZmNvdW50aW5nIGJl
DQo+Pj4+IGltcGxlbWVudGVkKS4NCj4+PiBJIHRoaW5rIGEgcmVmY291bnRpbmcgYmFzZWQgc29s
dXRpb24gd2lsbCBiZSB2ZXJ5IGNvbXBsZXggdG8NCj4+PiBpbXBsZW1lbnQuIEknbSBob3dldmVy
IGhhcHB5IHRvIGJlIHByb3ZlbiB3cm9uZy4NCj4+IEkgY2FuJ3QgZXN0aW1hdGUsIGJ1dCBJIGhh
dmUgYSBmZWVsaW5nIHRoYXQgYWxsIHRoZXNlIHBsYXlzIGFyb3VuZCBsb2NraW5nDQo+PiBpcyBq
dXN0IGJlY2F1c2Ugb2YgdGhpcyBzaW5nbGUgcGllY2Ugb2YgY29kZS4gTm8gb3RoZXIgcGxhY2Ug
c3VmZmVyIGZyb20NCj4+IHBkZXYtPnZwY2lfbG9jayBhbmQgbm8gZC0+bG9jaw0KPj4+PiBJZiBw
Y2lkZXZzX2xvY2sgaXMgdXNlZCBmb3IgdnBjaV97cmVhZHx3cml0ZX0gdGhlbiBubyBkZWFkbG9j
ayBpcyBwb3NzaWJsZSwNCj4+Pj4gYnV0IG1vZGlmeV9iYXJzIGNvZGUgbXVzdCBiZSByZS13b3Jr
ZWQgbm90IHRvIGxvY2sgaXRzZWxmIChwZGV2LT52cGNpX2xvY2sgYW5kDQo+Pj4+IHRtcC0+dnBj
aV9sb2NrIHdoZW4gcGRldiA9PSB0bXAsIHRoaXMgaXMgbWlub3IpLg0KPj4+IFRha2luZyB0aGUg
cGNpZGV2cyBsb2NrIChhIGdsb2JhbCBsb2NrKSBpcyBvdXQgb2YgdGhlIHBpY3R1cmUgSU1PLCBh
cw0KPj4+IGl0J3MgZ29pbmcgdG8gc2VyaWFsaXplIGFsbCBjYWxscyBvZiB2cGNpX3tyZWFkfHdy
aXRlfSwgYW5kIHdvdWxkDQo+Pj4gY3JlYXRlIHRvbyBtdWNoIGNvbnRlbnRpb24gb24gdGhlIHBj
aWRldnMgbG9jay4NCj4+IEkgdW5kZXJzdGFuZCB0aGF0LiBCdXQgaWYgd2Ugd291bGQgbGlrZSB0
byBmaXggdGhlIGV4aXN0aW5nIGNvZGUgSSBzZWUNCj4+IG5vIG90aGVyIGFsdGVybmF0aXZlLg0K
Pj4+PiAzLiBXZSBtYXkgdGhpbmsgYWJvdXQgYSBwZXItZG9tYWluIHJ3bG9jayBhbmQgcGRldi0+
dnBjaV9sb2NrLCBzbyB0aGlzIHNvbHZlcw0KPj4+PiBtb2RpZnlfYmFycydzIHR3byBwZGV2cyBh
Y2Nlc3MuIEJ1dCB0aGlzIGRvZXNuJ3Qgc29sdmUgcG9zc2libGUgcGRldg0KPj4+PiBkZS1yZWZl
cmVuY2UgaW4gdnBjaV97cmVhZHx3cml0ZX0gdnMgcGNpX3JlbW92ZV9kZXZpY2UuDQo+Pj4gcGNp
X3JlbW92ZSBkZXZpY2Ugd2lsbCBjYWxsIHZwY2lfcmVtb3ZlX2RldmljZSwgc28gYXMgbG9uZyBh
cw0KPj4+IHZwY2lfcmVtb3ZlX2RldmljZSB0YWtlbiB0aGUgcGVyLWRvbWFpbiBsb2NrIGluIHdy
aXRlIChleGNsdXNpdmUpIG1vZGUNCj4+PiBpdCBzaG91bGQgYmUgZmluZS4NCj4+IEkgdGhpbmsg
SSBuZWVkIHRvIHNlZSBpZiB0aGVyZSBhcmUgYW55IG90aGVyIHBsYWNlcyB3aGljaCBzaW1pbGFy
bHkNCj4+IHJlcXVpcmUgdGhlIHdyaXRlIGxvY2sNCj4+Pj4gQFJvZ2VyLCBASmFuLCBJIHdvdWxk
IGxpa2UgdG8gaGVhciB3aGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGUgYWJvdmUgYW5hbHlzaXMN
Cj4+Pj4gYW5kIGhvdyBjYW4gd2UgcHJvY2VlZCB3aXRoIGxvY2tpbmcgcmUtd29yaz8NCj4+PiBJ
IHRoaW5rIHRoZSBwZXItZG9tYWluIHJ3bG9jayBzZWVtcyBsaWtlIGEgZ29vZCBvcHRpb24uIEkg
d291bGQgZG8NCj4+PiB0aGF0IGFzIGEgcHJlLXBhdGNoLg0KPj4gSXQgaXMuIEJ1dCBpdCBzZWVt
cyBpdCB3b24ndCBzb2x2ZSB0aGUgdGhpbmcgd2Ugc3RhcnRlZCB0aGlzIGFkdmVudHVyZSBmb3I6
DQo+Pg0KPj4gV2l0aCBwZXItZG9tYWluIHJlYWQgbG9jayBhbmQgc3RpbGwgQUJCQSBpbiBtb2Rp
ZnlfYmFycyAoaG9wZSB0aGUgYmVsb3cNCj4+IGlzIGNvcnJlY3RseSBzZWVuIHdpdGggYSBtb25v
c3BhY2UgZm9udCk6DQo+Pg0KPj4gY3B1MDogdnBjaV93cml0ZS0+IGQtPlJMb2NrIC0+IHBkZXYx
LT5sb2NrIC0+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcm9tX3dy
aXRlIC0+IG1vZGlmeV9iYXJzOiB0bXAgKHBkZXYyKSAtPmxvY2sNCj4+IGNwdTE6wqDCoMKgwqDC
oMKgwqAgdnBjaV93cml0ZS0+IGQtPlJMb2NrIHBkZXYyLT5sb2NrIC0+IGNtZF93cml0ZSAtPiBt
b2RpZnlfYmFyczogdG1wIChwZGV2MSkgLT5sb2NrDQo+Pg0KPj4gVGhlcmUgaXMgbm8gQVBJIHRv
IHVwZ3JhZGUgcmVhZCBsb2NrIHRvIHdyaXRlIGxvY2sgaW4gbW9kaWZ5X2JhcnMgd2hpY2ggY291
bGQgaGVscCwNCj4+IHNvIGluIGJvdGggY2FzZXMgdnBjaV93cml0ZSBzaG91bGQgdGFrZSB3cml0
ZSBsb2NrLg0KPiBJJ3ZlIHRob3VnaHQgbW9yZSB0aGFuIG9uY2UgdGhhdCBpdCB3b3VsZCBiZSBu
aWNlIHRvIGhhdmUgYQ0KPiB3cml0ZV97dXBncmFkZSxkb3duZ3JhZGV9IChyZWFkX2Rvd25ncmFk
ZSBtYXliZT8pIG9yIHNpbWlsYXIgaGVscGVyLg0KWWVzLCB0aGlzIGlzIHRoZSByZWFsIHVzZS1j
YXNlIGZvciB0aGF0DQo+DQo+IEkgdGhpbmsgeW91IGNvdWxkIGFsc28gZHJvcCB0aGUgcmVhZCBs
b2NrLCB0YWtlIHRoZSB3cml0ZSBsb2NrIGFuZA0KPiBjaGVjayB0aGF0ICZwZGV2LT52cGNpLT5o
ZWFkZXIgPT0gaGVhZGVyIGluIG9yZGVyIHRvIGJlIHN1cmUNCj4gcGRldi0+dnBjaSBoYXNuJ3Qg
YmVlbiByZWNyZWF0ZWQuDQpBbmQgaGF2ZSBwZGV2IGZyZWVkIGluIGJldHdlZW4uLi4uDQo+ICAg
WW91IHdvdWxkIGhhdmUgdG8gZG8gc2ltaWxhciBpbg0KPiBvcmRlciB0byBnZXQgYmFjayBhZ2Fp
biBmcm9tIGEgd3JpdGUgbG9jayBpbnRvIGEgcmVhZCBvbmUuDQpOb3Qgc3VyZSB0aGlzIGlzIHJl
bGlhYmxlLg0KPg0KPiBXZSBzaG91bGQgYXZvaWQgdGFraW5nIHRoZSByd2xvY2sgaW4gd3JpdGUg
bW9kZSBpbiB2cGNpX3dyaXRlDQo+IHVuY29uZGl0aW9uYWxseS4NClllcywgYnV0IHdpdGhvdXQg
dXBncmFkaW5nIHRoZSByZWFkIGxvY2sgSSBzZWUgbm8gd2F5IGl0IGNhbiBiZSBkb25lDQo+DQo+
IFRoYW5rcywgUm9nZXIuDQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

