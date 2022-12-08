Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23857647A63
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 00:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457490.715414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3QlW-0007rY-4b; Thu, 08 Dec 2022 23:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457490.715414; Thu, 08 Dec 2022 23:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3QlW-0007o7-1S; Thu, 08 Dec 2022 23:57:22 +0000
Received: by outflank-mailman (input) for mailman id 457490;
 Thu, 08 Dec 2022 23:57:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uovv=4G=citrix.com=prvs=334de2702=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p3QlU-0007o1-5w
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 23:57:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ac5896c-7754-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 00:57:17 +0100 (CET)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Dec 2022 18:57:10 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6544.namprd03.prod.outlook.com (2603:10b6:510:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 23:57:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.016; Thu, 8 Dec 2022
 23:57:08 +0000
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
X-Inumbo-ID: 0ac5896c-7754-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670543837;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HlNJ2P4uA/LTQ3Mesg/UbZJWANKTp2nuTsa6NOauz9I=;
  b=ek51nOa6pssZ8I4j7bCCY0MuQlYxRj7R8dV0p3cMOSD7cn8umpyuH4xK
   jHjtqoK1aZBD8h9/YmcQmk7+ehKnxQFT+4xYprOVj7L1wrDjCxOiSxUBJ
   i+Riy60W9HvVle8vqWpWKTNZnEUqG256t1Uyo7oOYnME1i5dJKZXd9uRu
   A=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 89953476
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zezwxK3zvqJi0GUHavbD5Ytxkn2cJEfYwER7XKvMYLTBsI5bp2AOz
 GpMXW7VOKuKYGrzfdh1aYiwp0MGvJ+Hn9BlTQs/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZmNagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHGF+1
 8cfFSo3YjuKl7633bXrRMVer5F2RCXrFNt3VnBI6xj8VK5jZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6KlFQZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOqCd9JSOLmnhJsqFSh4k8/JRwSbmP4rveIgVSMePlhA
 WVBr0LCqoB3riRHVOLVVgyxpn2Zuxc0Ut9cVeY97WmlyLfQ4gufLngJSHhGctNOnMo3Tjwj0
 hmOhcHkARRmtbHTQnWYnp+dvDq0fysIKGYYIy8NSQcI+fHqpY11hRXKJv5zHajwgtDrFDXYx
 zGRsDN4l7gVldQM1aiw4RbAmT3EjoPSUgc/6wHTX2SkxgB0foioY8qv81ezxe1cIYiQSF6al
 GgFn8mY/KYFCpTlvBKKROIBDbS4/cGvOTfXgUNsN5Q5/jHr8HmmFaha7StiPk5vPoABcCXwf
 U7IkQpL4dlYO37CRahzboGqAsIm15/8BM/lXfDZaNlJSpVpfQrB9yZrDXN8xEjomUko1KQgY
 5GSdJ/0CW5AUPw/ij2rW+0azLkngDgkwn/eToz6yBLh1qeCYHmSSvEON17mgv0F0Z5oaT79q
 753X/ZmAT0GOAEiSkE7KbIuEG0=
IronPort-HdrOrdr: A9a23:mADnD6v76xHiBVdyj9kJHlNs7skDSdV00zEX/kB9WHVpmwKj5r
 mTdZUgpGfJYVMqMk3I9urwXZVoLUmsl6KdpLNhXotKPzOGhILLFvAH0WKK+VSJcBEWtNQ86U
 4KSdkYNDSfNykdsS842mWF+hQbreVvPJrGuQ4W9RlQcT0=
X-IronPort-AV: E=Sophos;i="5.96,228,1665460800"; 
   d="scan'208";a="89953476"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhMmdSRNba+3gR3BnOZ4uSDZ90ASiIdDALn0OD3f6IdI3pyYypeSZW4F3ViiAmD6WF5/9wzkSIcYJGlE/XkbOljFICA9biYrSxqhshhtqJC6fBaY+iBIkCO4cDpEqIqI8XmbBqu37hidIUI1jaZAbkjLWWCX1jyc9QT3sS3+poy2gWrfPNG5b+1saZJ/5Y346TW1nRTUEndTqABOPAQe7QrjheEcQ7gMh6LRMshp7vKjyYLUaNJ25OgbaZEnUMHzzY2uwxUX4d+qCzH5B/LioDR/cvvOtUt0aXUhx1N77Pqu2BmK+Em86iqocs4fsMSM4pMgFuKEM+vINfnRxhSOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlNJ2P4uA/LTQ3Mesg/UbZJWANKTp2nuTsa6NOauz9I=;
 b=QnSl22RlnlDY3CM3oF0crj5DyoKHPEUr1K29G80tjg8O2heiKGMhvtYBkPi95OMUicuNiRBR6H8wleNEebSbsGQ3tuxTkpARYLlYU2CUNmlGhX5rthpvKGbIjNXq92F4OnRATvToGxTxw1yl3dMv451XoyMAskD2Xxxl/YY5yVBtw2b7yrhiZvZ9GY0ByXDRaNSM2hZ2t54ZRUv65iVAVAw0qRkyTDy5zInk7bWOFjkJ336mUAI773s7CZBo6bJi1QEQW7UzYblg76n09Ak8hq2jZm54sDotp495frbtZJC0PV38SwfGaoMBan1HwWQFlkEmahbWxS4eucS4n+RESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlNJ2P4uA/LTQ3Mesg/UbZJWANKTp2nuTsa6NOauz9I=;
 b=lnJMH7sOkjyGOL2/0JZMRjNVMEhBfAPf9AdWcsSrWxWXquCcODOGGhnD41Pmmgp5OWYmRmEXSobmvPcSteInXbYuTXCx6IRchggYJlJsUza167I00A+rtq/UdaPg8qJMZDnlYO8XBOd0wM28M8nSR5UKjHRdbF23czQAjkxDHKU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Ayan Kumar Halder <ayankuma@amd.com>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "stefanos@xilinx.com"
	<stefanos@xilinx.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
Thread-Topic: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
Thread-Index: AQHZCwOZePGqMJgXO0SRNnj11JOJK65kAkoAgAAZ6oCAABkLgIAAHn8AgABXyYA=
Date: Thu, 8 Dec 2022 23:57:08 +0000
Message-ID: <eeeea39c-4a00-b742-036b-a97a5a5ab2a9@citrix.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
 <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
 <00ab59fa-d449-255b-bfe3-aaacb87e34dd@xen.org>
 <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
In-Reply-To: <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6544:EE_
x-ms-office365-filtering-correlation-id: f2bd30c0-b71f-4097-f3af-08dad977ea42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3IAO3Pvwi9ecoy9y/D9FwGi2ik5Goc45R/MatVhQmoWuLOzjXV9U3kzNX6Xm+9e2n2dk4vmVyx5HSWqSvYOkTO0TJ4HMJBooRRLD9PHAxoZcAGOLTG3qyIRumrHjCLrpEeXnk8Ra394ZqbPljakZjD0yUzlQpqXwD+kb3+jEJYBRFlOED9WkTvbDmNCraxqeevynxFGNBWSb4O0D5iG//G9257o9QIv5Hr+AZXz238fv6PB37LIgVgzxuC9g1krlr36kQHTdbWIjZJjl6scHyEMHfld/JzyjokApKqeFX+vAUy/zBEfSMxe43suGpW3jUT9jO/7qSPy6LdGU9pHjt5ejTj0NKp3cjF/FEeUry+iC7s5by+a3BB4+F1IWyoXq0PXL8wWd2/W84jjRZ/Y4Z906Pnr5rUucB0MjI0Kw0CdDvssmjq5kB0SpABJRcYOQ6w2HU1FJcBizwA+HkILlPcQP1fjtg3eVOMZYSiXOVP3frWOLfcWXGxPpBCUO3DpzeVHNOC+u8NVMHKS9fGw6S2U9WSSG2pXopWg70pDtnmvR4uJJdQ08jz3hp/mntVRBWkHDVPhUeJeOoKdzH+T4UczIw5yFq4qNo4T5LqLRyF6VL9vKZcbIu5uoV4inO0jrJU4UTXYsplaa9gTsOxcBpRgHRhY8OV5yrqLTDZAn1QKeeMDSLk5e1+BAWAHvjpJeCTvEjIlTEHUVupvYysQtVNqROUgHCQSePkHTrFl01gGVJH4et8QRrBmwLjwvI4SwL8b7FDuR8ULoW7VuUiNi4Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199015)(122000001)(31696002)(54906003)(82960400001)(86362001)(91956017)(8936002)(2906002)(5660300002)(7416002)(41300700001)(31686004)(38070700005)(4326008)(186003)(53546011)(6506007)(26005)(6512007)(64756008)(66946007)(2616005)(8676002)(38100700002)(66556008)(76116006)(6486002)(316002)(66446008)(110136005)(508600001)(71200400001)(66476007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STlMclpQN2RwR3I5Qzc2UDRtKzhLc1JlUW92MEM4M21NQ0dUd3gvS2EwMlN2?=
 =?utf-8?B?Y1c4bWxoRytHekwxSEFKUWw0MnJ2ZEZDbEdLQVBibENnN2xFbVJPY0ljSUxG?=
 =?utf-8?B?V2hTeU1MYllKa21ZK0sydjVud040SzczUytYVjZtT2ZxaURHMEJJbkhML3Jt?=
 =?utf-8?B?eTArcUJPT2dqWEZHYnRGaUJFbG5TNDZHQStmYXZ4TGlCY09WMEVMZXZ5LzFl?=
 =?utf-8?B?ZW9GejJidDNHQXJuRDZXbVpPYjZjMEtPZ2Z4STc1OEVHR21wa1Fja2lvR0l1?=
 =?utf-8?B?MHhhS3UzcDRMK1h3a2JrUlRIcEJQd1BQbDd3R1p6K2cxanRtbENING1DN2dn?=
 =?utf-8?B?VGU4L0YzanFkVUtvZnBmSjVBOGZYVmovQjMyTUVKeXVIeTVOaHVGdmYyMjNo?=
 =?utf-8?B?UnNOb2lmZ05PYnNrUFY1dGpLR0Q4WisybjJ0VXJ4MkgyeTVIMlQzNDJFVEE5?=
 =?utf-8?B?T2hsWm54Z2I4SiszQzRsWnh6MFRSVERXSHNJck9reFNhS3FWVm8yQTlBUGZU?=
 =?utf-8?B?RU1PVzZEbndJdE1GejBtZHQreUVPQkI4SDMvRFZQRU9qVUcrOExoUFYrOGpu?=
 =?utf-8?B?Kzh0QTFnL0k2YjNOWkhKTWUrcHVnMERzdVVzd2dRUktmVG1uYVgrc1J6K1ZJ?=
 =?utf-8?B?VmRIMTBxREExTjNxRVYyY2FmWFZTcE4xQTRJUk9pQ2hTZllwQUx1U3Z4MHdS?=
 =?utf-8?B?V1puUjlPb2E5S3JVSDdnTEJKZFBkTTQrV2cyVzZzMGVLYmNnbXhzMGxBQ3l3?=
 =?utf-8?B?WUh6ZW5NdEZSL011NnZlSmpRcE90VnBCdVdGWnRyYkdDS3R2cy9PQVpMWG10?=
 =?utf-8?B?UkxGMW9CQWE3NVdJWWxDT2EySzBlYUlMNHN4K2s4ZVE1WWwzVWxsUFFNdmVB?=
 =?utf-8?B?OVIwOW1NRWh3MDlXSk4yVHBGdWhpVUVNRUhPbDk0REV4cW9ONmRXdG5hQTZW?=
 =?utf-8?B?VTFwZGpCbTczeks4YmlZVWdHeUlEeWpQbVdFdm0rSXJGVGJla2xTNDd1Z1c2?=
 =?utf-8?B?NE5sVTdSbkR5dDdNU1RQYnUySTk3bzl5QzF0S3c4aDI3VXRBQVJZeFo1REw4?=
 =?utf-8?B?clFzL0RPdFQxY081c0lORVRzLzluVDZ6b1IvQzNpNXdRSGE1aWlpUjJFYkhS?=
 =?utf-8?B?K1A0aVI0T0tOQlBxV0FJZW1mcWwvUmo5MHJGNHRJclVFVmRxM2NoMUlWd0tt?=
 =?utf-8?B?THNKVHc3ZGdNcnFESDlkRXdpdU5XVmpSbHFHTkN0dXE3Z2pHZDJ6c3JvSzZZ?=
 =?utf-8?B?Wi92TUFMazNYY2ZkRUtQS0xTRW8xWm9ETUI4ZUVCMEUrMkZuTXlpNG9IRXNY?=
 =?utf-8?B?d3poM2R3b08zMWczdFEvSytzSndiTm84bUNndlNXbklESGVJLzFsYnJBVlly?=
 =?utf-8?B?VUZ4RklDclgwa1FuQ2pINllJNkNaL3VwK1ZwZWVIa2xWVFlKOUNzbXh6RmFZ?=
 =?utf-8?B?ekNJNXRhZnZFRWxQN3RoYUtDZUJWbE4vR1F6b0c5ZWdOZ3FVcjZPOTZNdTFR?=
 =?utf-8?B?YXBYUVJmRUVrWlJOcCsxRTBpQ0pIcGhwMGQ1WitJTlV1RmE1eVo5UEhNa0hv?=
 =?utf-8?B?K2ExQjZwSEFxZFlJNlZ3NFphaktkbVlwNGtUdGp3eXZlaEM3aHZEQlBTNEpZ?=
 =?utf-8?B?NHJmY0h4Q2h2R1o4UUgrcCtSUkJtM05OWTBRNWFaSkt2MWVFWXlOTk5MVjc4?=
 =?utf-8?B?TWRpRmRobTBHMFFYWkxoNVRKcXo1MW42RW9seW55NlJ5OWVTcTFVQjRHN1JQ?=
 =?utf-8?B?cEQ4VmFyeU1BdjJsQ0RxK3VVcno3bWNWcnlMcTgrd1BrM1NiNHhNUCs3RVh5?=
 =?utf-8?B?UFFpTmptcVcraUxaWUY2MEhCKzdDL2lqbzV0TzRYMU1KbnFnczk1cDFybk9F?=
 =?utf-8?B?WHpMV1Bxc292YjYvRU9KblhidGlVNDJLYXAzSnNmS29OZE5vdnVobVNteUth?=
 =?utf-8?B?YUpvQVh4ZnlWdDl6dHM1RE5pY0Q3eGpUUnV1WFhRT05aS285bmxwVTBoa1Jh?=
 =?utf-8?B?TDF2TFBXMDhDY1llN3JrNjZKeWtqRHdaaGk3YTMzUnRRcE5pMGVwb2ZEVjkw?=
 =?utf-8?B?VmhIUWJCcWFrdUFTcC9xaSt3ZzF3bjZEWlNQQ0pSTWF5dlFxY0RTUk5WU2Mv?=
 =?utf-8?Q?3Bbck+IEmjWYMWOegjm7gLiHB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDF46F19CA33FC48AB37602FED3105B6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2bd30c0-b71f-4097-f3af-08dad977ea42
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 23:57:08.0469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VkEeKSyaDxgEihQ1mKEjOuTDEl0vsMaaK8229tGX6yrfqOJkNAOs5O3S8YEwWK4ut2FrfMNB/lHTIkavkBUSkEi1fR+gh1Kezc9FyQ1iWXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6544

T24gMDgvMTIvMjAyMiAxODo0MiwgQXlhbiBLdW1hciBIYWxkZXIgd3JvdGU6DQo+IE9uIDA4LzEy
LzIwMjIgMTY6NTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IE9uIDA4LzEyLzIwMjIgMTU6MjQs
IE1pY2hhbCBPcnplbCB3cm90ZToNCj4+PiBTbyB0aGUgZmlyc3QgaXNzdWUgd2l0aCBaZXBoeXIg
aXMgdGhhdCBpdCBkb2VzIG5vdCBzdXBwb3J0IHpJbWFnZQ0KPj4+IHByb3RvY29sIGZvciBhcm0z
Mi4NCj4+PiBWb2xvZHlteXIgYWRkZWQgc3VwcG9ydCBvbmx5IGZvciBJbWFnZSBoZWFkZXIgZm9y
IGFybTY0IFplcGh5ci4NCj4+PiBJIGd1ZXNzIHRoaXMgaXMgd2h5IEF5YW4sIHdpbGxpbmcgdG8g
Ym9vdCBpdCBvbiBYZW4gKGFybTMyKSwgZGVjaWRlZA0KPj4+IHRvIGFkZCB1LWJvb3QgaGVhZGVy
Lg0KPj4NCj4+IElmIHRoYXQncyB0aGUgb25seSByZWFzb24sIHRoZW4gSSB3b3VsZCByYXRoZXIg
cHJlZmVyIGlmIHdlIGdvIHdpdGgNCj4+IHpJbWFnZSBmb3IgYSBmZXcgcmVhc29uczoNCj4+IMKg
LSBUaGUgekltYWdlIHByb3RvY29sIGhhcyBhdCBsZWFzdCBzb21lIGRvY3VtZW50YXRpb24gKG5v
dCBwZXJmZWN0KQ0KPj4gb2YgdGhlIGV4cGVjdGVkIHN0YXRlIG9mIHRoZSBtZW1vcnkvcmVnaXN0
ZXJzIHdoZW4ganVtcGluZyB0byB0aGUgaW1hZ2UuDQo+PiDCoC0gQUZBSUNUIGxpYnhsIGlzIG5v
dCAoeWV0KSBzdXBwb3J0aW5nIHVJbWFnZS4gU28gdGhpcyBtZWFucyB6ZXBoeXINCj4+IGNhbm5v
dCBiZSBsb2FkZWQgb24gb2xkZXIgWGVuIHJlbGVhc2VzIChub3QgZ3JlYXQpLg0KPg0KPiBJIGFt
IGV4cGxvcmluZyBmb3IgYSBzaW1pbGFyIG9wdGlvbiBhcyBWb2xvZHlteXIgaWUgc3VwcG9ydCB6
aW1hZ2UNCj4gcHJvdG9jb2wgZm9yIGFybTMyLg0KPg0KPiBCdXQgZm9yIHRoYXQgSSBuZWVkIHNv
bWUgcHVibGljIGRvY3VtZW50YXRpb24gdGhhdCBleHBsYWlucyB0aGUgemltYWdlDQo+IGhlYWRl
ciBmb3JtYXQgZm9yIGFybTMyLg0KPg0KPiBSZWZlciB4ZW4vYXJjaC9hcm0va2VybmVsLmMNCj4N
Cj4gI2RlZmluZSBaSU1BR0UzMl9NQUdJQ19PRkZTRVQgMHgyNA0KPiAjZGVmaW5lIFpJTUFHRTMy
X1NUQVJUX09GRlNFVCAweDI4DQo+ICNkZWZpbmUgWklNQUdFMzJfRU5EX09GRlNFVMKgwqAgMHgy
Yw0KPiAjZGVmaW5lIFpJTUFHRTMyX0hFQURFUl9MRU7CoMKgIDB4MzANCj4NCj4gI2RlZmluZSBa
SU1BR0UzMl9NQUdJQyAweDAxNmYyODE4DQo+DQo+IElzIHRoaXMgZG9jdW1lbnRlZCBhbnl3aGVy
ZSA/DQoNCnpJbWFnZSAoMzIpIGlzIGVudGlyZWx5IHVuZG9jdW1lbnRlZC7CoCBXaGF0IGV4aXN0
cyBpcyBmcm9tIHJldmVyc2UNCmVuZ2luZWVyaW5nLsKgIEkgZm91bmQgdGhpcyB3aGlsZSBkb2lu
ZyBzb21lIFhURiB3b3JrLCBhbmQgd2VudCByaWdodA0KYmFjayB0byB0aGUgc291cmNlIC0gdGhl
IExpbnV4IG1haW50YWluZXJzLg0KDQpUaGVyZSBhcmUgdGhpbmdzIHdoaWNoIFhlbiBkb2VzIHdy
b25nIHdpdGggekltYWdlIGhhbmRsaW5nLsKgIEJ1dCBJDQpoYXZlbid0IGhhZCB0aW1lIHRvIHRy
YW5zY3JpYmUgbXkgbm90ZXMgaW50byBzb21ldGhpbmcgbW9yZSBjb2hlcmVudCBhbmQNCnN1Ym1p
dCBmaXhlcy4NCg0KfkFuZHJldw0K

