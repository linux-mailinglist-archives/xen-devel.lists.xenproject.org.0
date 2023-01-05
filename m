Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5575065F33D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 18:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472101.732230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDUU7-00041X-JH; Thu, 05 Jan 2023 17:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472101.732230; Thu, 05 Jan 2023 17:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDUU7-0003y7-GC; Thu, 05 Jan 2023 17:56:59 +0000
Received: by outflank-mailman (input) for mailman id 472101;
 Thu, 05 Jan 2023 17:56:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDUU5-0003y1-Pc
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 17:56:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55a2dd1b-8d22-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 18:56:55 +0100 (CET)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 12:56:46 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6171.namprd03.prod.outlook.com (2603:10b6:408:100::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:56:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 17:56:43 +0000
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
X-Inumbo-ID: 55a2dd1b-8d22-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672941414;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GdZtvZrOsg8Sj7hTmBkOQFY27J9pWH8YOATNQ+FZNv4=;
  b=VncuYD7R936i8/gJa2YXn/vHiulqifIqmedUh7iI49ly2AltjjsPc582
   e4dSpfRcBPWyHfn6iFEuI8Wwr+8qdH40pU9+Bx1Qji6oiHNotVHUcnMhK
   kNziwHkEHhmf6R00Agknk7EhCAeFbL+LLHAulJVMpU01kl8Q1jJk7YPch
   Y=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 90305539
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LgcBa6n8nTAbdhTZeSWVHgLo5gy3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdDGDTOfbfZ2ekftojaN6w80NSupOGnNEwHFRrrXwzESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkPqgS5AKGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 bsbGmAcYQCuveiVx7elYdFigcgCHeC+aevzulk4pd3YJdAPZMmZBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVklI3jOmF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNKT+Xlq6U76LGV7lE8Il5KdgOkm/6ajnKmC+hAe
 nYT2zV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnNM3QBQ62
 1nPmMnmbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bs/7UZtNqEarwi8KvHzj1m
 mqOtHJm2+RVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5P2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:wznkk6152PDbSQyhwfmTkAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="90305539"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLCnfSJAAmZy1e6lyGUu6OIAHSwZboa9yqGaPYb7a7r44D29NjAsHZd2v8gp0sUAuP0KD07cOHT8JEVKZfxDd75RhGx+XJivhOFcvFTPXCIsGGm/9xj6QvVt3dXE618pAiWkmr9TAyCwHqBHH10V1D0Z1Wiw92+9rAmYE+KzsfOGqwTLwC6DwuGplowYM54nfNoI91EXt0LYlc72uNZLavplGLaFygHtpE040pYY7shhUJuOqtvxFHMOXt+No/55L8ihaW/YX1r3xSDp8NeKnWnWDfq2OvA6mvcxOn/xoaD3auV0k7umlcZWTgzG6cGUxNDs61y7qCpiuBBpWUErPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdZtvZrOsg8Sj7hTmBkOQFY27J9pWH8YOATNQ+FZNv4=;
 b=ddVpCJi7LzHy8Cv1Xp+iHATHYa32oDZHkm1A7HQjaHgBkiYZn1A2CUmLNZrCBLHzp548UQ3FqcVtQ8vS8eZ99ntJUND2OxhbDmxjQ4RFyAdWYQSt1P3OagazZBQK500VGxl+/kH+R7nA3iguJ188HcQnSNIn188eVovqmWkzqIq9PDZMK6di33DT9EMllojfTAJqQ03MSSM1NjsfWW1GwdN4WfNg5rVQSTbDTuotcLwndUwYlzOJxjTLcuyBxgrWY+obrQTti+damMNyukSj7t8FPFALmlBLGBEZls5LjVeYyv0etkUo3ah7rrRW229OmOfiNMoDeNFs9Nz+VjDr/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdZtvZrOsg8Sj7hTmBkOQFY27J9pWH8YOATNQ+FZNv4=;
 b=BHbm2WpuG4MYCiMuzgjf2krOLF/wprdV+ibF0ky1cjJ46ak1Puf8bpupSBUw6N4XmOUK5Jq7vifYoXBnNqsrUog3hWR/ys8rmUgA7Te8WgThaCB7d8lu7VONbVD6lbaqxQkCS/0SmEva/5rOXCdd4/4XmA4PhIZZLigtl6jF/+w=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/8] x86/paging: fold most HAP and shadow final teardown
Thread-Topic: [PATCH 2/8] x86/paging: fold most HAP and shadow final teardown
Thread-Index: AQHZFT+yfO+11AII6U6krdJn3spgiq54lXqAgAD0VYCAFqnVgA==
Date: Thu, 5 Jan 2023 17:56:43 +0000
Message-ID: <4de3cf99-f8ab-c439-b383-859a41e90517@citrix.com>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <8d519e00-83c6-aee9-e7ba-523aa4265e1e@suse.com>
 <af33fef0-46f7-b206-53ed-33d66f0f008c@citrix.com>
 <780eb542-34b9-c64f-0a40-acc462b87c72@suse.com>
In-Reply-To: <780eb542-34b9-c64f-0a40-acc462b87c72@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN9PR03MB6171:EE_
x-ms-office365-filtering-correlation-id: 67e2efb6-64f7-451a-afd4-08daef463492
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HBCwJX1K0xfL49T3CmNDukRYdJvKkR4X8O+LZ7kEYBy6PVSClQminp5gatOGyg4eViKjIFAeYCY01abfaE/Fj7Hb8B0Ft+cjJKL1Tfdh+TbPii5BNlUu5rBYnuby+AtSflrHAzxdqFXVfIsMUCrV20WaE+rstpA495hSruv2VNMfw8NjHwgs/vW4Nq50ySNBxJDxU+OTUDAxhL48BLy6nGzDY+PpZKFJjlyysiP8IV1+9BRQu7HcE7+YBO6ojSMYfiKT2M47aNIkgxdKFe/+AeJe15UNV7xrxgahX2PhlTYJvozoAXCxIEx3nwoRnHsYx/qsjCPNiPa6GnfuZx2T0HIx0b5A8FP5dRCAoR5L+nfSbKmKxh5ZhU7Jii/xs77llTfqHY9JQw8I0QIKJ3/DO8N7hbJPf71qAgZ3vEwhZ9KBGx9h6hoYwVfpwaW6A0XPVEH+azoIE9sJXQTA1vhzy61u4YfNP4RS6Z7pqQwBe465C8wluFI/rEawpzbzvE7lqHyS9RX1W5wwW4tzX9+BGNrqhFVUmlwVdu3Cl3kbPwkbBgrj1TFyTsreu/y4mQwngcjNfk+edSgfx7MLqy/rECdePjdUr+0Z6MyfFqCDFxOzTJwA8pGao7T/MYmmJx3eR+gykMokt3yCTx77bzwaNAhEwNY2Omfa9Oa+VkIZzv32EPEaWzjOapMllDWs2t9XAMtaMSULQrT4x5zduQAK4paWq2LXQi/nY1XDee0UUpV4GhKhIOhnWpmzR7n9RuBjY0fGCag99VVB6+pXzbvg6Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199015)(5660300002)(8936002)(41300700001)(8676002)(4326008)(2906002)(66556008)(76116006)(316002)(64756008)(54906003)(6916009)(66446008)(66946007)(91956017)(71200400001)(31686004)(66476007)(6486002)(478600001)(2616005)(26005)(186003)(6512007)(6506007)(53546011)(82960400001)(38100700002)(122000001)(86362001)(31696002)(38070700005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEJ6Qm5TTXozMVk0TDREVjRkN0oxbWhqQlVwS1QwcDlKUjl5dVoxbnZWMGIr?=
 =?utf-8?B?Q2srNmY2OTFqNmxQNGZzenNwNzRmYzhGVTRncW1KWXhDY254TXJObDhKckx3?=
 =?utf-8?B?ZVdlMGNLQjVMWDl5dkNNNDRnMzR0empVL0tEMFRmZVd2VVllTTJENUlzSUM3?=
 =?utf-8?B?eFVScnhxVVR4eENvZncvUnAxNER4TFE4WWR2QnM5WTAzeGFIc1hPK05NYlBS?=
 =?utf-8?B?WGFRTEJjSGNxRmw4SW1GUEVWcjJZK1JiZlNLNGZYemFnUXRGV21ReWpqSDJN?=
 =?utf-8?B?NjI1OUdjQjYrbklyTERnVk1rYlhiUEE0cExRNEhsdXdRdjk5OHhpYk8vYjVE?=
 =?utf-8?B?Vm8wSFdSVGVZZUtyd0VkbnE3VWcwZFExSW5Kd0lRb1lEVW5Dc05DL3BBRXZH?=
 =?utf-8?B?VnpiSzlCM1FYTkFzaEpRU3YxRGpKclUwbzhMWVYrc3FxVEpkWS9kN2FPQlZ3?=
 =?utf-8?B?WHpvb2xBVkYxVExpVFZhSy8xMnBkbWthb2lmNVVwMitjTUxScW9aaEdNaVl2?=
 =?utf-8?B?WjdnejRpT09rMFhQWmk5RWlWWDNSajNDbjdXRFJDa2FhK0FGU1YzQkQ2YlN6?=
 =?utf-8?B?Wml6ZFphNCtIcUZNSGpvVUZtZ1dVc0xmb2ZxUEVBNGxoejJOQVV5LzRycnpX?=
 =?utf-8?B?QUZGVHF5RzhDMnNpV0IrbDF6eUVSOGFUTGkwdFRKSkhIKy9hNDVVOEtnUHU3?=
 =?utf-8?B?VzNnc2JzMkgxdVR4YjRjMzByck90VjRmTG5KNXlPN3BJRVMxTzFSUUJERnpl?=
 =?utf-8?B?UUxSMExIdDlGY2FmSXh0ZnpCRUpXb2ZkeWo5aHE0ZFhyMVhuM1hkL1hmY2FB?=
 =?utf-8?B?a3VVZlVvRGh3T2hjNkQrZnViM3oxY3FHZ215NzFIZFVkUWY3K0d5amRzMXlM?=
 =?utf-8?B?MGxuSXJsRnJEQnAxWExlOXA4aGpVRW5wRzlLWGJFZjgvU3FrZHhOelgvbXFk?=
 =?utf-8?B?RWU2S01nRW9SRTRtcFovTy9YeTk3UDl3c1pwZ0pLcXlveU1EYVVWMnZlWDl1?=
 =?utf-8?B?OFdqQkpMQ012V0xWODBYOXRUVHBIRnIybzlrZ3BFNmlqUmFSRWw0VHBsYy9T?=
 =?utf-8?B?Nk51Y3FPeE80bEpxT3FZQmxtYkJhN05YdkZQd3NXMEowS2xFbjQ4Q0F4Qkhw?=
 =?utf-8?B?Z3ovYXZzbE8zTE1iSXhYOExMZk9NVW5UNWFFc25maHI2T2JrRGpRd2hiZEl6?=
 =?utf-8?B?ei8xY0x3VElxdW10cHBCdmV2V1RpMFc4Zjd5dGNKM2F0d1V0eVd3N1JXUFR1?=
 =?utf-8?B?U0lqM1N5UnhQT0d1VEdPa2JobEowM1o4dVpSZTFDVlNSMUJvbU1FMmxNcjV5?=
 =?utf-8?B?a2VDUEZFSnlCTFJxMDBydkl5VkNnZGJXLzFGTGZBSHoxNkNiblMxN25RQld5?=
 =?utf-8?B?RWVaanVUdFVaV09LaU1LekRNcVc3YkpRdXFQQ3F0ZW9mN3JDQzRCUmcvcmZC?=
 =?utf-8?B?L1d5cjBZUXdsWFBrQXluR2thc2ovMHRRdEJJcHVtVDhEQWw3LzBQbExPbGgz?=
 =?utf-8?B?UjZhM0djYk5XNjF4SWpFVmR0MjRCaUltL2pPVG9scnE1OFZtRWZQRXdhL2t0?=
 =?utf-8?B?NWo0OVNtM0x3YVB5WDhOY2p1MFJRdUcyeXdMQUh3QW9CV0ZhYnkvSFZybmZN?=
 =?utf-8?B?Mi9ubmd1bUd2SDN2aFpjS3pHeW9aSVdNOWxSOTBacXcyRG81WWlGdEJUaVNh?=
 =?utf-8?B?UTJiQjAxeU85ckI1OFF1UEN1NmliTGhBU3NBSVNoWmFqaENpVEpaRUw4Njcz?=
 =?utf-8?B?Ly9ITHd5UVFBamRNVkVOZDhsMTVWd2lZVFhaalBkYTZZQ1hOTis0NGxGNUxN?=
 =?utf-8?B?aThibUZUNU1XOXR4ZnZRMGwvMklHOXZYV3dhTEUyN0ZvOWpUMS9ab2VFTFNz?=
 =?utf-8?B?bHR4RHZtU1oveTB4MVNLV29kbUJkdnROZEgxZmVYK3NUSm9oQnNzNklGeUlK?=
 =?utf-8?B?Qk9zYWJrZHJNRXBFYXF4L2xmZ0gwYldRUUdYb1BOUFZaSnJXeStPTjVHQXZj?=
 =?utf-8?B?ZDRxZTd0eUt3S2JtcnhSZ296aHpoY3MwYnBYOEttUERhdGJVS0RYdFlkZHpM?=
 =?utf-8?B?NEdTTUVUMnhIS3UzSTZwcE8vVzMrZzVBRmdmM0ttOXVQc0VQa1RibzQyU2hq?=
 =?utf-8?B?UU5JaXV4ODR2aW55VWdhRWhGdmJXemY3MWJJdUhjZEthUHBRMWNqRi9OYk96?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFC612EC572CA74E9147DD7EC7613536@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k+E5ZMhKbdStadBdw1m79HIviaKZ51we5sJsVWlqEbgGVJ3/7MuHoYeJFekOE72SX6SECi+yzexXeBA8X1H2RhB5IJ07nTM4bcy9RTajHWzICDjPeOe/qrgdSL4mDhpScIw9ALWXEL1gCPOk1Km9Ur4ubib2zWYLRg5AtkVQy5ncsw43UGnMh1aln+HyMS3oAhBILJphthD92Vl3b64DDsp0iEiU6WZYBSeCIftXfyvdzvRBHkEjD9I6Trz7XxLQjje7ginmnrHnuW71ZoRXIRcs0sZmrcq/XBR3Z94O32YBEG29fy5zmjdGS5JU69/62CIwwOascujnvnEFawhpvrP6ukvI8r7eQb6hwEPD8nGX1rks1eQ8jrYC1mpUuIptlf/j/YI1EguqlPoaOIrMh8djnhxWGF9D/cYmGX+5E8Oh34s0B1koxnFwb9yCinZDy8fBZr8D/IEogboc05XOOjZe3kHi8Gf4MRJZba/6NkmOYcAqvc+C1ecn8b9No8duz5nZEg1hDiOqkPcgXlpzxPSScttE9KWO1HIYJhSviXDCPf/fZCO6pIkdNEw2ZZd9dFpCsB/XL14j0Qpuo5+Y6p9N0REbMaWXcgdBzXZbHSknqYIneP0qlaMNeiE96OkPokVQFJBvp/2cxI9D1MYPFlnQbK/bSb5vO5ExKgSijm0mmCQw9LkTl8/njF54N2NmHlQDEGgyVzh9HXGpGJxxQiVCH8pWjJRLPBC4dNNPA6VeBJotaYqxcgsdZGGURMeB/1XlzXLwtBjdWYf6sQomRYvjDGAYnOMsFLDV+b0Z3jvZRyVexc/xgQtJASmq/fjkw0c4d0rcjI4sGHiggEYxPA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e2efb6-64f7-451a-afd4-08daef463492
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 17:56:43.4967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dr0WReK5iycGELS96DFQqEUrB24Dv8nvgqdBk3HMhC8/CWySLAgzsTzcPZSMBLdHS5J3GEjXARdqAesgYflh8fe8EQf3rrUfkhhCeOOcf8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6171

T24gMjIvMTIvMjAyMiA3OjUxIGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjEuMTIuMjAy
MiAxODoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDIxLzEyLzIwMjIgMToyNSBwbSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gKyAgICAgICAgICAgICAgICAgIGQsIGQtPmFyY2gucGFn
aW5nLnRvdGFsX3BhZ2VzLA0KPj4+ICsgICAgICAgICAgICAgICAgICBkLT5hcmNoLnBhZ2luZy5m
cmVlX3BhZ2VzLCBkLT5hcmNoLnBhZ2luZy5wMm1fcGFnZXMpOw0KPj4+ICsNCj4+PiArICAgIGlm
ICggaGFwICkNCj4+PiAgICAgICAgICBoYXBfZmluYWxfdGVhcmRvd24oZCk7DQo+Pj4gKw0KPj4+
ICsgICAgLyoNCj4+PiArICAgICAqIERvdWJsZS1jaGVjayB0aGF0IHRoZSBkb21haW4gZGlkbid0
IGhhdmUgYW55IHBhZ2luZyBtZW1vcnkuDQo+Pj4gKyAgICAgKiBJdCBpcyBwb3NzaWJsZSBmb3Ig
YSBkb21haW4gdGhhdCBuZXZlciBnb3QgZG9tYWluX2tpbGwoKWVkDQo+Pj4gKyAgICAgKiB0byBn
ZXQgaGVyZSB3aXRoIGl0cyBwYWdpbmcgYWxsb2NhdGlvbiBpbnRhY3QuDQo+PiBJIGtub3cgeW91
J3JlIG1vc3RseSBqdXN0IG1vdmluZyB0aGlzIGNvbW1lbnQsIGJ1dCBpdCdzIG1pc2xlYWRpbmcu
DQo+Pg0KPj4gVGhpcyBwYXRoIGlzIHVzZWQgZm9yIHRoZSBkb21haW5fY3JlYXRlKCkgZXJyb3Ig
cGF0aCwgYW5kIHRoZXJlIHdpbGwgYmUNCj4+IGEgbm9uemVybyBhbGxvY2F0aW9uIGZvciBIVk0g
Z3Vlc3RzLg0KPj4NCj4+IEkgdGhpbmsgd2UgZG8gd2FudCB0byByZXdvcmsgdGhpcyBldmVudHVh
bGx5IC0gd2Ugd2lsbCBzaW1wbGlmeSB0aGluZ3MNCj4+IG1hc3NpdmVseSBieSBzcGxpdHRpbmcg
dGhlIHRoaW5ncyBjYW4gY2FuIG9ubHkgaGFwcGVuIGZvciBhIGRvbWFpbiB3aGljaA0KPj4gaGFz
IHJ1biBpbnRvIHJlbGlucXVpc2hfcmVzb3VyY2VzLg0KPj4NCj4+IEF0IGEgbWluaW11bSwgSSdk
IHN1Z2dlc3QgZHJvcHBpbmcgdGhlIGZpcnN0IHNlbnRlbmNlLsKgICJkb3VibGUgY2hlY2siDQo+
PiBpbXBsaWVzIGl0J3MgYW4gZXh0cmFvcmRpbmFyeSBjYXNlLCB3aGljaCBpc24ndCB3YXJyYW50
ZWQgaGVyZSBJTU8uDQo+IEluc3RlYWQgb2YgZHJvcHBpbmcgSSB0aGluayBJIHdvdWxkIHByZWZl
ciB0byBtYWtlIGl0IHN0YXJ0ICJNYWtlIHN1cmUNCj4gLi4uIi4NCg0KVGhhdCdzIHN0aWxsIGF3
a3dhcmQgZ3JhbW1hciwgYW5kIGEgYml0IG1pc2xlYWRpbmcgSU1PLsKgIEhvdyBhYm91dA0KcmV3
cml0aW5nIGl0IGVudGlyZWx5Pw0KDQovKiBSZW1vdmUgcmVtYWluaW5nIHBhZ2luZyBtZW1vcnku
wqAgVGhpcyBjYW4gYmUgbm9uemVybyBvbiBjZXJ0YWluIGVycm9yDQpwYXRocy4gKi8NCg0KPg0K
Pj4+ICsgICAgICovDQo+Pj4gKyAgICBpZiAoIGQtPmFyY2gucGFnaW5nLnRvdGFsX3BhZ2VzICkN
Cj4+PiArICAgIHsNCj4+PiArICAgICAgICBpZiAoIGhhcCApDQo+Pj4gKyAgICAgICAgICAgIGhh
cF90ZWFyZG93bihkLCBOVUxMKTsNCj4+PiArICAgICAgICBlbHNlDQo+Pj4gKyAgICAgICAgICAg
IHNoYWRvd190ZWFyZG93bihkLCBOVUxMKTsNCj4+PiArICAgIH0NCj4+PiArDQo+Pj4gKyAgICAv
KiBJdCBpcyBub3cgc2FmZSB0byBwdWxsIGRvd24gdGhlIHAybSBtYXAuICovDQo+Pj4gKyAgICBw
Mm1fdGVhcmRvd24ocDJtX2dldF9ob3N0cDJtKGQpLCB0cnVlLCBOVUxMKTsNCj4+PiArDQo+Pj4g
KyAgICAvKiBGcmVlIGFueSBwYWdpbmcgbWVtb3J5IHRoYXQgdGhlIHAybSB0ZWFyZG93biByZWxl
YXNlZC4gKi8NCj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpc24ndCB0cnVlIGFueSBtb3JlLsKgIDQx
MCBhbHNvIG1hZGUgSEFQL3NoYWRvdyBmcmVlDQo+PiBwYWdlcyBmdWxseSBmb3IgYSBkeWluZyBk
b21haW4sIHNvIHAybV90ZWFyZG93bigpIGF0IHRoaXMgcG9pbnQgd29uJ3QNCj4+IGFkZCB0byB0
aGUgZnJlZSBtZW1vcnkgcG9vbC4NCj4+DQo+PiBJIHRoaW5rIHRoZSBzdWJzZXF1ZW50ICpfc2V0
X2FsbG9jYXRpb24oKSBjYW4gYmUgZHJvcHBlZCwgYW5kIHRoZQ0KPj4gYXNzZXJ0aW9ucyBsZWZ0
Lg0KPiBJIGFncmVlLCBidXQgaWYgYW55dGhpbmcgdGhpcyB3aWxsIHdhbnQgdG8gYmUgYSBzZXBh
cmF0ZSBwYXRjaCB0aGVuLg0KDQpJJ2QgYmUgaGFwcHkgcHV0dGluZyB0aGF0IGluIHRoaXMgcGF0
Y2gsIGJ1dCBpZiB5b3UgZG9uJ3Qgd2FudCB0bw0KY29tYmluZSBpdCwgdGhlbiBpdCBzaG91bGQg
YmUgYSBwcmVyZXF1aXNpdGUgSU1PLCBzbyB3ZSBkb24ndCBoYXZlIGENCiJjbGVhbiB1cCAkWCIg
cGF0Y2ggd2hpY2ggaXMgc2h1ZmZsaW5nIGJ1Z2d5IGNvZGUgYXJvdW5kLg0KDQp+QW5kcmV3DQo=

