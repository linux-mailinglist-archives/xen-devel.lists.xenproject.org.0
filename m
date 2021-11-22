Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4110745907C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:46:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228937.396206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAZd-0000yz-Gc; Mon, 22 Nov 2021 14:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228937.396206; Mon, 22 Nov 2021 14:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAZd-0000vn-CU; Mon, 22 Nov 2021 14:45:37 +0000
Received: by outflank-mailman (input) for mailman id 228937;
 Mon, 22 Nov 2021 14:45:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJrQ=QJ=epam.com=prvs=1960b635ba=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpAZc-0000vM-4B
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:45:36 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8cdb718-4ba2-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 15:45:34 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMEi5AT016622;
 Mon, 22 Nov 2021 14:45:30 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cgd7sg06u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 14:45:30 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR0302MB3237.eurprd03.prod.outlook.com (2603:10a6:209:1e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 14:45:27 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445%3]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 14:45:27 +0000
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
X-Inumbo-ID: d8cdb718-4ba2-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJdr4inmVe9z4p2rv/33Xq8+WVlCMnZEi3hK9M3I6R2xhugjJUwHHG0V94JDJsjA7pP3MeKMgwVvlGNVsvPXX8TYCAITBKYs1iR5rZbZEUFX6W3eLhLOLM1hjhPQqkoGt0CnRk9ZRmQl6rnz8yUkoRNc+LE8pe0HU1QXnPESLN/KyTLasLFyYbKI6WDE81z0+jwjClhN+mXT7rPcVsD7pyE7HlZN+PFKnN+mYqxzQZqJQxfTEpvkd9gVdwQMtOsavaD3RdQY8Bs5jEo5Yvhn5SkpnqrSP8hPR+ZhpNOxGk04JhLWHAbUq/+lppe9YAP1tBdFDqVGulYylcY5Hklcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhmmMzCHO1lGObZlagMptMusJBD+3LWdpoeDX28BPlg=;
 b=Vpmg3AZVbOAgM6FY5OWqI+wzkMeRVglnZB6I+YGtVUAyAvlC0MavTES0wDaRCjpGdnKa8K2W16TmNi2PNhYud6i/MejYwfhueXE0YGvx+Ud2EsR8bWTKjtxnp7Yp32QGjqviqfbkuzvRpGW2ukSrgDzZDt7ec44N5q8TQAaax7WjC93IUXhFW/n9CzzhRfXTKTaeFeJKu0MZtR3FQA9C3uggh8BNMoPMqXc6NmRNxTiG+dpyAG0JxyrSAiHmCIyVYJWlci/rL8i8P2R6jYQ7x1uoKjWoenlAIjeESkEb1655CR/BuwzKOIjPou4bSPc7mfmEwwyhVUD92WxF6dc1Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhmmMzCHO1lGObZlagMptMusJBD+3LWdpoeDX28BPlg=;
 b=ZJmQnoKVq8Pg7+eCLtDwpWtfa9hexVTUifeMHZG5Ojhqj8IITel+w8SQqBKz5Bzur7yllWK1TO+pglAkL1smex/wUIBrSoPDtGvUGMkgZnmyYmab6o0FJUoIELDlOR/aTNlUbxiHDYLVs8z+n8GD6sPwDE1WeO8T3u20h6ITk67F5Ys0mvVSxjmwUeU5L1K2qRjEnDGB82fVBtDXWqaNOWtAwKVi1NyMgRHPUdCrKgpZODMRw+q/NewuMq5IC+R0ITlDRu4hokwA9fyMX6C7SBdHkIf9S30tbbRG5/KkZ3VyDfaUTqPWgQas6g0gTzrM3mCT9a2UzXANCG6iH9Fmig==
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
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        "julien@xen.org" <julien@xen.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAIAAQRQAgAAGPgCAAAR1gIAAAvIAgAAFxACAAAoGAIAAAXMAgAABgYCAAAVtAIAAAX+AgAAB1wCAAVryAIAAB06AgAAEPgCAAAKhAIAAApkAgATD+4CAAARtgIAAAk+A
Date: Mon, 22 Nov 2021 14:45:26 +0000
Message-ID: <d8d6cbcb-478a-a5a7-4e93-036b0f75c6d0@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
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
 <5baf1199-e12d-cc41-4520-e32ed29a0436@epam.com>
 <fbc8a807-ea73-760f-8c75-df0930a5139e@suse.com>
 <4e74d5e1-f54e-3888-ada2-a38545571744@epam.com>
 <6be4e6c0-5b54-606e-1278-e97e143e23af@epam.com>
 <2363af0e-6435-485e-8906-16a6fca7885c@suse.com>
In-Reply-To: <2363af0e-6435-485e-8906-16a6fca7885c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec1cba95-7650-41b6-6945-08d9adc6b92d
x-ms-traffictypediagnostic: AM6PR0302MB3237:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR0302MB3237FE6BA9DCA13B42A6D89CE79F9@AM6PR0302MB3237.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 krlwj6F2QisSvvaKT3+DlYOEaxH5KoYOE7LSo173abrXBWdUJlj1GDNlq62eg8BqaSJnUdZiAMR+ojFrhOI+XU8eUhrw1ju8inLayt1iKys4W3TatD73HwOoGLrfYp6LPfdZLrGmNoFN7xTK/Q86i/xIgvtBlOfyLJtFIG7ELtFzasq54JGu4vJsYbNwVso/C07T5Bt2plrs8iW1U8Js0OF0Dqe2+CMWV+GOjoE7HnAlZ30f/MqlUKSnSLftqTa/UW84ilcpAzUwci8ZQBRuKuBJaaVELNYYNT4qeKgbhbTeTqyM69o68q4UY14+F9SoR0v7BhHCQO59cETdQnwPHZ4zkMc8hW3mrEfqaZZhJkNinZPzxqmVr4Xfbx2zSagxZrGu2uRQ3kCkI8CneEoQdN1fGs/6vNAmxn1OelkWEd6pGELy6ZcraL/MvmWYAaBCUJ1OMwuKDqYyQUIq1h7aS50yeUkMT6oG6QGgMJ3ss+RvgFnewuYxZBTbB/Gh6Td4cDUn4/bspiF0MaSp7c0CQEwf0nkoe20g23HkwzOir8GljtWv6zgBL06lCSRFMsTVZ+dPOuOPP3E50xMg+ZRtebo2VxbhRHgXCjwAhRC16X0MBU/CPhvVBr+fkEpdrvf4uvW7xWN8sF6HemxwnzIO0OVMnQE/JHhkOxftiWEKdjUlwtUgyuoGR4cZHdAOmtB1feErlm0ybwWEzsD158818D/yZzpJ8dZwsrOPfwyUrGcilvDP4q2czJP77g8G2tQ9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(122000001)(2616005)(4326008)(6486002)(54906003)(7416002)(316002)(107886003)(38100700002)(71200400001)(31696002)(6506007)(53546011)(508600001)(2906002)(5660300002)(83380400001)(38070700005)(66476007)(66446008)(31686004)(8676002)(66946007)(26005)(8936002)(6916009)(36756003)(6512007)(66556008)(64756008)(186003)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?czlCWkdGVThwRWdFM2c5YmZpamovVENFVktHbXMwQXgrZGZsMmV1SVFIbEFS?=
 =?utf-8?B?RjhBdUJlUW1yTjNCYVVlMmNPOGxKL2dQMlJuNTIzMW1CY2JMMlhLOE92NG00?=
 =?utf-8?B?a3BCSkZueHF6ZGhIR3BpVkJqYWN3empRMU5XTXh0RXFBUThTUjR4Uk5zSTli?=
 =?utf-8?B?bHVZQ0R5SG92aUMyeEo2dHZmaWxsMGkzUWQxU0hneDZNSjVCZ1kwYTNuVGMw?=
 =?utf-8?B?MHp2cHJnM1FidXFtNml4anZ3bFlyQ3VKTGFqNCt2dGNWOWhzZU8zZlZVSyts?=
 =?utf-8?B?SXJ2TDBMVEJ6OWR1MitoUGNHUnNGRkoyTDZadmhLMXcvc3AxR0oxQVZpTlBr?=
 =?utf-8?B?aktDazhUZ0d2Z2xoTXlaSkF3Y3BoYzZNbnAzaTFoS1V3Qmk1TGgwb0tBOGpV?=
 =?utf-8?B?NW10VnFJY1Q5OC9oZCtPblEraFZtbDJYTTBBeWNxcU9TaUtSaCtUZi8zWGdS?=
 =?utf-8?B?N3NaRUpLNzliL1hxMDE0OUNwQ0Jic1pDRTBMcFpPUmtrb2dNaHJtZGhmZkc3?=
 =?utf-8?B?SlVicFU2c3JkL2svbUFxV080QzIveHJKTzVFWjFRWW8zVjdmQXg0d3FORGFI?=
 =?utf-8?B?aTBOL2hFMzlFQm1RelpkQUh1L2ZZQzQvSnZXUUNLMnNQU25iUU9Bakl1QlVz?=
 =?utf-8?B?cnhyOXNES0U1RWZDc0RMTkY0N3p3bVdpOFR4cUZRRFFBL0t0UHFuWE5YRGR3?=
 =?utf-8?B?OHJ1SHhhOVZKc1VDa3g3SEZvWmF6Yk9DN29PMUYwcFE3Uk1sZVYxWGtsRmZZ?=
 =?utf-8?B?dXFVYk9GZWRBeGJSaDQ0MWFCbmdJMFBVRElvazZ2cVVWQzNWbEhNb1oxTG5W?=
 =?utf-8?B?dXdhaGdkUElOYU8xcWRYSUVieTdSQ1ByKzd6eHNqVTBpR0VqY2pEMDFxZ1FI?=
 =?utf-8?B?cGJDckVQcERtMmFDTW42QU5YMUpDOVJCQW5NdXFXT2RWUXpqTU92blN0aHZ2?=
 =?utf-8?B?djIzdkhBOURxZk5Kb2xNNEc5b0ZBMTlkWityemhoVzRrS1loZXVOQ3V4dGJO?=
 =?utf-8?B?VnBBY2NHTTd0QzROU2pOSjJSa1JBS3FsVDU0eWp2UlJBMmdHeGNVWEZkMk9D?=
 =?utf-8?B?RXJDVWhobnRmY1lpTnM4UUFVdGw2TEZudFcvVmlSeFhUT1BDK1JWcW5ERDZX?=
 =?utf-8?B?QmpOb2s3anByTFcvMVZESzlHQlZOd2UyUzk4V1lkNG9xL0JsbkhWV0llNy91?=
 =?utf-8?B?dE1kVExQbzRsWlNxVnM1bWtGWm1TM3pSRWFZaFJvUW9FK2QweEo1a0RVQy90?=
 =?utf-8?B?dE5CS25vM2E4UWVMcWlkdW8rS3F4czZoU1pPWGczUFlpdFBaNE8ya29PbWF0?=
 =?utf-8?B?RXVMZVd2azZ6b3VDcmZPMko2d01mYktXMGhtTzZBSlF4R3JCWktBNnIzdWRq?=
 =?utf-8?B?R3hQUitFUDIrRlNBVFo3cjdPUTNkUUViT0dac0hPU3I4SzhtaklLMUkxZTVk?=
 =?utf-8?B?Z0d0UnNDRDdjMEhCN3ZyMUdPd1o2ekNNaE5uelRkK2NDRmpGNXlGZk9QbmVj?=
 =?utf-8?B?V1B6YitoRGVpTlpRRVk2UDRWUWpGYkY5ekY5RXBxYXF1eFdaKzFPMWlzN3gv?=
 =?utf-8?B?L1BTOElMTHd5K2xmYUxlUGx4eVk4YXRUcFRGMjhnRWxLUHlneXVpbzdhKzJO?=
 =?utf-8?B?RlVnQk1Eb0ZEeTlMWmgyelFBZTBFMEF3c0NrbC95cTByZytDcHZuYzd3ZU1v?=
 =?utf-8?B?Rm5SNzRQZ3RUTy9IQnpXMkgxdFk2RmVyazJCNFZERDU2UnVaUkI1eHlUUE1T?=
 =?utf-8?B?K1RleW15SVNlQ283MGZaVzk5akdKamx6MU1IZlowWC91Y0Vhc0JjVVo3VXdn?=
 =?utf-8?B?Q0dIR0JMdi8vbUlidXdOYTRySDBtNDlNZFFVcFdKbjNCWFBrSG1raWU1VVN0?=
 =?utf-8?B?RTB5YjdWeTRLWmtWZ0svUGdBMHRBVmEvanBoamhnL3hhTktpbmRiOVIwWTgz?=
 =?utf-8?B?UmUyS0t4RFR5QnBSOFd2M2VpcjRZbTVxUDFWMzhlWEhBdWdIYXBLWFYvZjg1?=
 =?utf-8?B?ZEdGeTlxQkNXYTh6TEQ4TnZEbEJ2OXp4SnRBejllLzNxN0RMMjVTVmc1dlkz?=
 =?utf-8?B?QlE4R3VDc2FyMGNNaG56OU55TW1TRGo3TExhN2s0UTlRb09rWVhtOTFVZk1i?=
 =?utf-8?B?cmxjUkRZQ1ZYYi9hL0ZZR0pCa0N2YjVFb3NCTVM4TnRRTGtwdCsvZ280Ykxu?=
 =?utf-8?B?c0tKeG1XeGhiUCs3aXFWa1A2SWVkMDdiZ2cwSnFSRWhQeklHVU5Oczdyei83?=
 =?utf-8?B?Q1RvV1JVcWs3VFRxbXhGQW5qMU9DaWwycjREaFNuOFE1S2haQWNvL2YzUGo0?=
 =?utf-8?B?Q2hFV2RyelJTYlZQS2hkdmpQK0FoVklTbmRnOVg4K0l0QWxiTDhQZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6F340F9EAB94D49BCE5BE33AEEC494F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1cba95-7650-41b6-6945-08d9adc6b92d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 14:45:26.9515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRGZCXUV3lmbI2A9lngCMfc0l35B1VO+qvwHDVxdOkrGaW6sJlMx1JxJYaQ5aUmhqxBIxct5TsARlGCrFabH5Vdb7tsURxmQdfEk4LZk3T/dHn3JcahxQWQWMVQkyMkY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0302MB3237
X-Proofpoint-ORIG-GUID: _avlJeffkAWXZ3NsRin8pqvSRMyo27ZB
X-Proofpoint-GUID: _avlJeffkAWXZ3NsRin8pqvSRMyo27ZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_07,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220078

DQoNCk9uIDIyLjExLjIxIDE2OjM3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjIuMTEuMjAy
MSAxNToyMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOS4xMS4yMSAx
NTozNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gT24gMTkuMTEuMjEgMTU6
MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxOS4xMS4yMDIxIDE0OjE2LCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+IE9uIDE5LjExLjIxIDE1OjAwLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAxOS4xMS4yMDIxIDEzOjM0LCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+Pj4+Pj4gUG9zc2libGUgbG9ja2luZyBhbmQgb3RoZXIgd29yayBu
ZWVkZWQ6DQo+Pj4+Pj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
Pj4+Pj4+Pg0KPj4+Pj4+PiAxLiBwY2lkZXZzX3tsb2NrfHVubG9ja30gaXMgdG9vIGhlYXZ5IGFu
ZCBpcyBwZXItaG9zdA0KPj4+Pj4+PiAyLiBwZGV2LT52cGNpLT5sb2NrIGNhbm5vdCBiZSB1c2Vk
IGFzIHZwY2kgaXMgZnJlZWQgYnkgdnBjaV9yZW1vdmVfZGV2aWNlDQo+Pj4+Pj4+IDMuIFdlIG1h
eSB3YW50IGEgZGVkaWNhdGVkIHBlci1kb21haW4gcncgbG9jayB0byBiZSBpbXBsZW1lbnRlZDoN
Cj4+Pj4+Pj4NCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4+Pj4+Pj4gaW5kZXggMjgxNDZlZTQwNGU2Li5lYmYw
NzE4OTNiMjEgMTAwNjQ0DQo+Pj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+
Pj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+Pj4+Pj4+IEBAIC00NDQsNiAr
NDQ0LDcgQEAgc3RydWN0IGRvbWFpbg0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAgIMKgI2lmZGVmIENP
TkZJR19IQVNfUENJDQo+Pj4+Pj4+ICAgICAgwqDCoMKgwqAgc3RydWN0IGxpc3RfaGVhZCBwZGV2
X2xpc3Q7DQo+Pj4+Pj4+ICvCoMKgwqAgcndsb2NrX3QgdnBjaV9yd2xvY2s7DQo+Pj4+Pj4+ICvC
oMKgwqAgYm9vbCB2cGNpX3Rlcm1pbmF0aW5nOyA8LSBhdG9taWM/DQo+Pj4+Pj4+ICAgICAgwqAj
ZW5kaWYNCj4+Pj4+Pj4gdGhlbiB2cGNpX3JlbW92ZV9kZXZpY2UgaXMgYSB3cml0ZXIgKGNvbGQg
cGF0aCkgYW5kIHZwY2lfcHJvY2Vzc19wZW5kaW5nIGFuZA0KPj4+Pj4+PiB2cGNpX21taW9fe3Jl
YWR8d3JpdGV9IGFyZSByZWFkZXJzIChob3QgcGF0aCkuDQo+Pj4+Pj4gUmlnaHQgLSB5b3UgbmVl
ZCBzdWNoIGEgbG9jayBmb3Igb3RoZXIgcHVycG9zZXMgYW55d2F5LCBhcyBwZXIgdGhlDQo+Pj4+
Pj4gZGlzY3Vzc2lvbiB3aXRoIEp1bGllbi4NCj4+Pj4+IFdoYXQgYWJvdXQgYm9vbCB2cGNpX3Rl
cm1pbmF0aW5nPyBEbyB5b3Ugc2VlIGl0IGFzIGFuIGF0b21pYyB0eXBlIG9yIGp1c3QgYm9vbD8N
Cj4+Pj4gSGF2aW5nIHNlZW4gb25seSAuLi4NCj4+Pj4NCj4+Pj4+Pj4gZG9fcGh5c2Rldl9vcChQ
SFlTREVWT1BfcGNpX2RldmljZV9yZW1vdmUpIHdpbGwgbmVlZCBoeXBlcmNhbGxfY3JlYXRlX2Nv
bnRpbnVhdGlvbg0KPj4+Pj4+PiB0byBiZSBpbXBsZW1lbnRlZCwgc28gd2hlbiByZS1zdGFydCBy
ZW1vdmFsIGlmIG5lZWQgYmU6DQo+Pj4+Pj4+DQo+Pj4+Pj4+IHZwY2lfcmVtb3ZlX2RldmljZSgp
DQo+Pj4+Pj4+IHsNCj4+Pj4+Pj4gICAgICDCoCBkLT52cGNpX3Rlcm1pbmF0aW5nID0gdHJ1ZTsN
Cj4+Pj4gLi4uIHRoaXMgdXNlIHNvIGZhciwgSSBjYW4ndCB0ZWxsIHlldC4gQnV0IGF0IGEgZmly
c3QgZ2xhbmNlIGEgYm9vbGVhbg0KPj4+PiBsb29rcyB0byBiZSB3aGF0IHlvdSBuZWVkLg0KPj4+
Pg0KPj4+Pj4+PiAgICAgIMKgIHJlbW92ZSB2UENJIHJlZ2lzdGVyIGhhbmRsZXJzIDwtIHRoaXMg
d2lsbCBjdXQgb2ZmIFBDSV9DT01NQU5EIGVtdWxhdGlvbiBhbW9uZyBvdGhlcnMNCj4+Pj4+Pj4g
ICAgICDCoCBpZiAoICF3cml0ZV90cnlsb2NrKGQtPnZwY2lfcndsb2NrKSApDQo+Pj4+Pj4+ICAg
ICAgwqDCoMKgIHJldHVybiAtRVJFU1RBUlQ7DQo+Pj4+Pj4+ICAgICAgwqAgeGZyZWUocGRldi0+
dnBjaSk7DQo+Pj4+Pj4+ICAgICAgwqAgcGRldi0+dnBjaSA9IE5VTEw7DQo+Pj4+Pj4+IH0NCj4+
Pj4+Pj4NCj4+Pj4+Pj4gVGhlbiB0aGlzIGQtPnZwY2lfcndsb2NrIGJlY29tZXMgYSBkZWRpY2F0
ZWQgdnBjaSBwZXItZG9tYWluIGxvY2sgZm9yDQo+Pj4+Pj4+IG90aGVyIG9wZXJhdGlvbnMgd2hp
Y2ggbWF5IHJlcXVpcmUgaXQsIGUuZy4gdmlydHVhbCBidXMgdG9wb2xvZ3kgY2FuDQo+Pj4+Pj4+
IHVzZSBpdCB3aGVuIGFzc2lnbmluZyB2U0JERiBldGMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IDQuIHZw
Y2lfcmVtb3ZlX2RldmljZSBuZWVkcyB0byBiZSByZW1vdmVkIGZyb20gdnBjaV9wcm9jZXNzX3Bl
bmRpbmcNCj4+Pj4+Pj4gYW5kIGRvIG5vdGhpbmcgZm9yIERvbTAgYW5kIGNyYXNoIERvbVUgb3Ro
ZXJ3aXNlOg0KPj4+Pj4+IFdoeSBpcyB0aGlzPyBJJ20gbm90IG91dHJpZ2h0IG9wcG9zZWQsIGJ1
dCBJIGRvbid0IGltbWVkaWF0ZWx5IHNlZSB3aHkNCj4+Pj4+PiB0cnlpbmcgdG8gcmVtb3ZlIHRo
ZSBwcm9ibGVtYXRpYyBkZXZpY2Ugd291bGRuJ3QgYmUgYSByZWFzb25hYmxlIGNvdXJzZQ0KPj4+
Pj4+IG9mIGFjdGlvbiBhbnltb3JlLiB2cGNpX3JlbW92ZV9kZXZpY2UoKSBtYXkgbmVlZCB0byBi
ZWNvbWUgbW9yZSBjYXJlZnVsDQo+Pj4+Pj4gYXMgdG8gbm90IGNyYXNoaW5nLA0KPj4+Pj4gdnBj
aV9yZW1vdmVfZGV2aWNlIGRvZXMgbm90IGNyYXNoLCB2cGNpX3Byb2Nlc3NfcGVuZGluZyBkb2Vz
DQo+Pj4+Pj4gICAgICB0aG91Z2guDQo+Pj4+PiBBc3N1bWUgd2UgYXJlIGluIGFuIGVycm9yIHN0
YXRlIGluIHZwY2lfcHJvY2Vzc19wZW5kaW5nICpvbiBvbmUgb2YgdGhlIHZDUFVzKg0KPj4+Pj4g
YW5kIHdlIGNhbGwgdnBjaV9yZW1vdmVfZGV2aWNlLiB2cGNpX3JlbW92ZV9kZXZpY2UgdHJpZXMg
dG8gYWNxdWlyZSB0aGUNCj4+Pj4+IGxvY2sgYW5kIGl0IGNhbid0IGp1c3QgYmVjYXVzZSB0aGVy
ZSBhcmUgc29tZSBvdGhlciB2cGNpIGNvZGUgaXMgcnVubmluZyBvbiBvdGhlciB2Q1BVLg0KPj4+
Pj4gVGhlbiB3aGF0IGRvIHdlIGRvIGhlcmU/IFdlIGFyZSBpbiBTb2Z0SVJRIGNvbnRleHQgbm93
IGFuZCB3ZSBjYW4ndCBzcGluDQo+Pj4+PiB0cnlpbmcgdG8gYWNxdWlyZSBkLT52cGNpX3J3bG9j
ayBmb3JldmVyLiBOZWl0aGVyIHdlIGNhbiBibGluZGx5IGZyZWUgdnBjaQ0KPj4+Pj4gc3RydWN0
dXJlIGJlY2F1c2UgaXQgaXMgc2VlbiBieSBhbGwgdkNQVXMgYW5kIG1heSBjcmFzaCB0aGVtLg0K
Pj4+Pj4NCj4+Pj4+IElmIHZwY2lfcmVtb3ZlX2RldmljZSBpcyBpbiBoeXBlcmNhbGwgY29udGV4
dCBpdCBqdXN0IHJldHVybnMgLUVSRVNUQVJUIGFuZA0KPj4+Pj4gaHlwZXJjYWxsIGNvbnRpbnVh
dGlvbiBoZWxwcyBoZXJlLiBCdXQgbm90IGluIFNvZnRJUlEgY29udGV4dC4NCj4+Pj4gTWF5YmUg
dGhlbiB5b3Ugd2FudCB0byBpbnZva2UgdGhpcyBjbGVhbnVwIGZyb20gUkNVIGNvbnRleHQgKHdo
ZXRoZXINCj4+Pj4gdnBjaV9yZW1vdmVfZGV2aWNlKCkgaXRzZWxmIG9yIGEgc3VpdGFibGUgY2xv
bmUgdGhlcmUgb2YgaXMgVEJEKT8gKEkNCj4+Pj4gd2lsbCBhZG1pdCB0aG91Z2ggdGhhdCBJIGRp
ZG4ndCBjaGVjayB3aGV0aGVyIHRoYXQgd291bGQgc2F0aXNmeSBhbGwNCj4+Pj4gY29uc3RyYWlu
dHMuKQ0KPj4+Pg0KPj4+PiBUaGVuIGFnYWluIGl0IGFsc28gaGFzbid0IGJlY29tZSBjbGVhciB0
byBtZSB3aHkgeW91IHVzZSB3cml0ZV90cnlsb2NrKCkNCj4+Pj4gdGhlcmUuIFRoZSBsb2NrIGNv
bnRlbnRpb24geW91IGRlc2NyaWJlIGRvZXNuJ3QsIG9uIHRoZSBzdXJmYWNlLCBsb29rDQo+Pj4+
IGFueSBkaWZmZXJlbnQgZnJvbSBzaXR1YXRpb25zIGVsc2V3aGVyZS4NCj4+PiBJIHVzZSB3cml0
ZV90cnlsb2NrIGluIHZwY2lfcmVtb3ZlX2RldmljZSBiZWNhdXNlIGlmIHdlIGNhbid0DQo+Pj4g
YWNxdWlyZSB0aGUgbG9jayB0aGVuIHdlIGRlZmVyIGRldmljZSByZW1vdmFsLiBUaGlzIHdvdWxk
IHdvcmsNCj4+PiB3ZWxsIGlmIGNhbGxlZCBmcm9tIGEgaHlwZXJjYWxsIHdoaWNoIHdpbGwgZW1w
bG95IGh5cGVyY2FsbCBjb250aW51YXRpb24uDQo+Pj4gQnV0IFNvZnRJUlEgZ2V0dGluZyAtRVJF
U1RBUlQgaXMgc29tZXRoaW5nIHRoYXQgd2UgY2FuJ3QgcHJvYmFibHkNCj4+PiBoYW5kbGUgYnkg
cmVzdGFydGluZyBhcyBoeXBlcmNhbGwgY2FuLCB0aHVzIEkgb25seSBzZWUgdGhhdCB2cGNpX3By
b2Nlc3NfcGVuZGluZw0KPj4+IHdpbGwgbmVlZCB0byBzcGluIGFuZCB3YWl0IHVudGlsIHZwY2lf
cmVtb3ZlX2RldmljZSBzdWNjZWVkcy4NCj4+IERvZXMgYW55Ym9keSBoYXZlIGFueSBiZXR0ZXIg
c29sdXRpb24gZm9yIHByZXZlbnRpbmcgU29mdElSUSBmcm9tDQo+PiBzcGlubmluZyBvbiB2cGNp
X3JlbW92ZV9kZXZpY2UgYW5kIC1FUkVTVEFSVD8NCj4gV2VsbCwgYXQgdGhpcyBwb2ludCBJIGNh
biBzdWdnZXN0IG9ubHkgYSBtYXJnaW5hbCBpbXByb3ZlbWVudDogSW5zdGVhZCBvZg0KPiBzcGlu
bmluZyBpbnNpZGUgdGhlIHNvZnRpcnEgaGFuZGxlciwgeW91IHdhbnQgdG8gcmUtcmFpc2UgdGhl
IHNvZnRpcnEgYW5kDQo+IGV4aXQgdGhlIGhhbmRsZXIuIFRoYXQgd2F5IGF0IGxlYXN0IGhpZ2hl
ciAicHJpb3JpdHkiIHNvZnRpcnFzIHdvbid0IGJlDQo+IHN0YXJ2ZWQuDQo+DQo+IEJleW9uZCB0
aGF0IC0gbWF5YmUgdGhlIGd1ZXN0IChvciBqdXN0IGEgdmNwdSBvZiBpdCkgbmVlZHMgcGF1c2lu
ZyBpbiBzdWNoDQo+IGFuIGV2ZW50LCB3aXRoIHRoZSB3b3JrIGRlZmVycmVkIHRvIGEgdGFza2xl
dD8NCj4NCj4gWWV0IEkgZG9uJ3QgdGhpbmsgbXkgZWFybGllciBxdWVzdGlvbiByZWdhcmRpbmcg
dGhlIHVzZSBvZiB3cml0ZV90cnlsb2NrKCkNCj4gd2FzIHJlYWxseSBhbnN3ZXJlZC4gV2hhdCB5
b3Ugc2FpZCBpbiByZXBseSBkb2Vzbid0IGV4cGxhaW4gKHRvIG1lIGF0DQo+IGxlYXN0KSB3aHkg
d3JpdGVfbG9jaygpIGlzIG5vdCBhbiBvcHRpb24uDQpJIHdhcyB0aGlua2luZyB0aGF0IHdlIGRv
IG5vdCB3YW50IHRvIGZyZWV6ZSBpbiBjYXNlIHdlIGFyZSBjYWxsaW5nIHZwY2lfcmVtb3ZlX2Rl
dmljZQ0KZnJvbSBTb2Z0SVJRIGNvbnRleHQsIHRodXMgd2UgdHJ5IHRvIGxvY2sgYW5kIGlmIHdl
IGNhbid0IHdlIHJldHVybiAtRVJFU1RBUlQNCmluZGljYXRpbmcgdGhhdCB0aGUgcmVtb3ZhbCBu
ZWVkcyB0byBiZSBkZWZlcnJlZC4gSWYgd2UgdXNlIHdyaXRlX2xvY2ssIHRoZW4NClNvZnRJUlEg
LT4gd3JpdGVfbG9jayB3aWxsIHNwaW4gdGhlcmUgd2FpdGluZyBmb3IgcmVhZGVycyB0byByZWxl
YXNlIHRoZSBsb2NrLg0KDQp3cml0ZV9sb2NrIGFjdHVhbGx5IG1ha2VzIHRoaW5ncyBhIGxvdCBl
YXNpZXIsIGJ1dCBJIGp1c3QgZG9uJ3Qga25vdyBpZiBpdA0KaXMgb2sgdG8gdXNlIGl0LiBJZiBz
bywgdGhlbiB2cGNpX3JlbW92ZV9kZXZpY2UgYmVjb21lcyBzeW5jaHJvbm91cyBhbmQNCnRoZXJl
IGlzIG5vIG5lZWQgaW4gaHlwZXJjYWxsIGNvbnRpbnVhdGlvbiBhbmQgb3RoZXIgaGVhdnkgbWFj
aGluZXJ5IGZvcg0KcmUtc2NoZWR1bGluZyBTb2Z0SVJRLi4uDQo+DQo+IEphbg0KPg0KVGhhbmsg
eW91LA0KT2xla3NhbmRy

