Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCC1521C52
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 16:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325732.548444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQsy-0006IB-IK; Tue, 10 May 2022 14:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325732.548444; Tue, 10 May 2022 14:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQsy-0006G0-Dx; Tue, 10 May 2022 14:30:48 +0000
Received: by outflank-mailman (input) for mailman id 325732;
 Tue, 10 May 2022 14:30:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lKQ=VS=citrix.com=prvs=12295f6c1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1noQsx-0005sS-87
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 14:30:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6b25436-d06d-11ec-a406-831a346695d4;
 Tue, 10 May 2022 16:30:46 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2022 10:30:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6949.namprd03.prod.outlook.com (2603:10b6:a03:43f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 14:30:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 14:30:41 +0000
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
X-Inumbo-ID: c6b25436-d06d-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652193045;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xd+pqv0zgKIEDhjCh+UnuP1k0P82s3oSW9CqZZhRKRg=;
  b=FZDTK4HrX844MXOYqTiubdaMWVepxvhRDElHfR82b/ybDMHhXhiVCfZr
   gEkT3Md7aaANjAi+VL7NUXMUy9TWxEIKpNqgOi+ktlqpGZlqk5tGfSFyA
   zKxqnCnTuy3WEtz2Pr001Ke9puJpGbW8OhJDlHh+SYgzaMJoyJ8xEOEw3
   M=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 73473881
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xsEMEKBifatBNxVW/xPiw5YqxClBgxIJ4kV8jS/XYbTApDIg3zMGx
 mZKWz2CM/iJZTejKdsnOtjk8R8B7MOBnYdkQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng2tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh96
 P5KkaSZCj4yI6LcktY/fyJ5NSRxaPguFL/veRBTsOS15mifKz7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t2B8mbG80m5vcBtNs0rulIEezTe
 Iwybj13YQ6bSxZOJk0WGNQ1m+LAanzXLGYE9wnF9fNfD277xQwqk6fJa/7pId2wZphNuHq4r
 2PM8DGsav0dHJnFodafyVqpj/XKlDn2W6oTEqO57f9ghFCPxm0VBwYSXFH9qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAPQkqcs3SDoCx
 lKP2dTzClRHq6aJQHiQ8rOVqzKaOiUPK2IGIygeQmMt/N3LsIw1yBXVQb5e/LWdi9T0HXT8x
 m6MpS1n37EL15dTj+O84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVPlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:SIToBqizlF62dn+UrqyfyJ3Qt3BQX4N23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8bvYOCUghrTEGgE1/qs/9SAIVyyygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3vpxA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gYsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJ7iJGofy/gzdktvfrGrCo+
 O85CvI+P4DrU85S1vF5CcFHTOQiQrGpUWSkWNwykGT3PARDAhKd/apw7gpMycxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfdsRKEkjTVo+a07bWvHAUEcYZ
 tTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYYit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tXKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGG7fIx8Z0WY9ihz3ekIhlSnfsubDcSqciFcr+Kw5/MCH8bcR/
 G/fJpLHv6LFxqaJbp0
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="73473881"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZph9p7M4SFpMpZvuBoaKjIv9ormIkhki4/85M5WiyPgCuNBhM/27EoJRKhUbnU249b3ViGxZJ+X1b+UoNBAGUrbUCBMVUMgH1i4Y4pNw7GCkgqutDjRQzelhvbv3/65ETj1O1Hh49BmwJxH927GEXlWuRIndpDnmGfOsiyz3iKCsGkXn6crJnANnYA3k8GQ1ufEaoqzfMth0OPpJoQkE1hMbGr+jWorRDit8IT/AQbKCiAH+mxZ1W4DtxXzYg/fwS5znVJWphHgd8x3NEXGrbq++GXjwnXqgUUn9pHFq2qRMh24NBuBrbzZ4oCpxGTCbTrXY4/LJeiEEztEAYcqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xd+pqv0zgKIEDhjCh+UnuP1k0P82s3oSW9CqZZhRKRg=;
 b=Ukc8kCFfogoFzNAZ+oeesIeHosyTjYyG+a4x9YRKKsKUitJ/wQCGxeatudaZf22J5YcTW+8SXlEnjvwHF3JKXx/c1L3V2SEUJNh0R5bnGqizIrU1avQA0q3i6qMH+KPvaYIz6DR/13Jk3171k1mlsRKxgAD/KC5rozlFlM3xjZRr8KAWI70R5pwPRX5SaRqudYlB8yCVsFfQsjzivrY5kY2LZ+DPpt85IUv2hjifLYY7VbTkjQ/ri77kSfAwJcIZKoPl2T3DOuDocyWLLPDOWC7lEU1/NDkz1Ff3HKdpPJWshVyxdTC3VZ3Ceuuu+8n0D19fzx6ZoAj9VbyiFQ6p6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xd+pqv0zgKIEDhjCh+UnuP1k0P82s3oSW9CqZZhRKRg=;
 b=Bf+6QtzrwesWs5dC3QcIK3++ghC0I8CDo3HT5u1fXBm7OIG+EtEeAUjJy252gJFnE30bn9Gh20ELl6Q9pWcvqVrMttXWwi1KbUqLaVWd1kgIeb6oc0+KX2ugpD/WWid4VrPRtOwuKtlsmBmvUGcBAobKMRHdPmxfOrVylN/8Wxo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] ns16550: reject IRQ above nr_irqs_gsi
Thread-Topic: [PATCH v2 1/2] ns16550: reject IRQ above nr_irqs_gsi
Thread-Index: AQHYZGTv0L0FedIJ8kmYH2hX6mR3t60YLEEA
Date: Tue, 10 May 2022 14:30:41 +0000
Message-ID: <4ed4e4c3-6b71-8299-69f4-7910583fd9cb@citrix.com>
References: <20220510115546.1779279-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20220510115546.1779279-1-marmarek@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3b0864b-cff3-4ca4-2942-08da3291a91e
x-ms-traffictypediagnostic: SJ0PR03MB6949:EE_
x-microsoft-antispam-prvs:
 <SJ0PR03MB6949C5A30D5E303401BCE11ABAC99@SJ0PR03MB6949.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DfEN7NfyY2X7iM7LfBzQvtDT2c9ciC4axAd2vYewGazAXez+7M6XzQxCO2PnWiYurX/f6nBMdQtnZP7x/oziEqn/nrHIsnI/kEHRO/9pmTXlXQ03rt9u+eVCcE9J/kyVuNSSElf80recIzvAUqHcnnsXOoUA3JTTWD0AAhQk0m4ceE2p7CQTjAP9t58M8KUONW2lsmuJy3HANOfNqUaW3VNDbs/2TSzI3GAgufazabHy0mQOcYRa3mthFBvLpcdGWQtmKR9Kt3EjWsOXEYaVaNc4euUsCmmzrgPo3/r+xIiQeDFqhWrCHtXclJ9H6v7C/qI3K9Tpa75zc3OR3sGj9VJ+YtQ2WIcrzRGMW0AURpchCy8pOUStPH1cSeiMOt/QM9uSTd68AClsQK3/KZ+52omdV3e/zCSMJQsIXhu8/yVfefaq0aI8YtOqBLsjDHfqSDS309PThEfu9ODdDaPfVGpvoQfrzhKjE5cdUHvYic/h0yRy/CagHEnatuA6ER4sRFzZDdD/1xqJiBDC/uQzS28YjT08yyQd0+30YBXOnUl61z9mLFJXzvapEa44U5ZsRzVpGW4rmuoBqTVYw+PSV/OXADBb4/u3xV9tQHiSgDd5NtUOETKfD5KwqVsJKcF9pPqHSzVgLJgECFMxObRHWMK24TvwN6OKgsGQA0Reo3Gb/BDIvyfg0co2lt3oWIr8Ws+a+M1qVy0eLsvhb0INM28BckbtRuKshrOwIaERY31OwgkKCveXxGT+2z9+3P+dtH3s1/u8MR7HK8UR67My2g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(31696002)(66476007)(53546011)(5660300002)(6506007)(83380400001)(26005)(66556008)(91956017)(31686004)(4326008)(66446008)(8676002)(4744005)(76116006)(66946007)(6512007)(66574015)(2906002)(8936002)(186003)(36756003)(2616005)(508600001)(6486002)(71200400001)(38070700005)(38100700002)(86362001)(54906003)(122000001)(110136005)(316002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1dqL3VrQzFIcnFmcmNkRUR3S0tHVk5WcXdNb3FTb29ST08xRGQ4NXBIeUN2?=
 =?utf-8?B?aEVFOXFFcXZCbm1waVR0VGxwTEVidk1RWnU1WWVEQlBmbWV0aDdYUm91bUdP?=
 =?utf-8?B?cGh2dnpkdlNwZFZWQmozbTVTRkNzVU8vVmpxWEdOa052N3I0Mm4wcWpjMWVt?=
 =?utf-8?B?NUFhbUJ6cllHMjJUTlF1RXBaLy9TQmg4SFc3cThnYXppUUl3Q0xQY01HSXpt?=
 =?utf-8?B?cUd2V2VLWUtoU2NIWGZMSTNkSURxNHIvaFAvYU9uVlFPbzZZUmVTaDdud1Fp?=
 =?utf-8?B?YTlWNWZtWWtjSnRtUkNoR0ZIYU1SYllSRGZYVkp4WTY2QVBPbHpGQmRMTXN1?=
 =?utf-8?B?NUljcGNrSkN5WURKdGFYUzRSTjlPNEMzd3BHYTcyejIrKzgyemNmYnVzMDB6?=
 =?utf-8?B?WitVQkMxTFIwYlIxRGNHTjR0a2lMMnM2THZYY1VMNThzMUl3cGhtK1NUZG5h?=
 =?utf-8?B?U3IrcnZBS2tHV3hIakFsRzZ4Nk9FOWhOejN2VDhqb1hINUl0MmozdWhMcmtY?=
 =?utf-8?B?YVVFS1JELy8xRjM5OFBvczJ3RWhuYWduRmtocjg0ZlNUS3NWMlRqUVQ2TWxE?=
 =?utf-8?B?ZGNCN2xPTUFiWitGSzFwRFM3cFZlNGpmMjBnbDZlRzdrUndTcE9xRk55N3dG?=
 =?utf-8?B?MW0xeWF0QThlS2toc1NaU1RvbHQveHpMQkJPaTgrcDhHVGVUZHZyK2ZYeUMz?=
 =?utf-8?B?ZnhzMGkyR2Z3TEh2VnhqUXB6V25qZ25JMlREUWtiYWpEZUZHNzlsUmo4Nk5N?=
 =?utf-8?B?YXV3MzdJNS9rS2trd1FTNEhUU2I2L1pXZFpSUGJNUUh5Q3JmNGlCUVF2YlJv?=
 =?utf-8?B?M2hUU01TL2VHUlQ0Z0dROVpDNnZLdURqTzdkYUJFRXo1ajAvMUJsVFFJb0JS?=
 =?utf-8?B?MUR2TVkyaHI4Z0ViL0dWaldPY0ZzN2hTWHczaERQc0dOaER0aURlZTBXampm?=
 =?utf-8?B?b3BRZUhvdnRlaFZZWmNvclp1enpxb1FnYTM0dGFGSCtUVWMwTnFkYnZFNmpO?=
 =?utf-8?B?M2Z6cFFIV3B1SVY4MFRKVyt4b2RTODhvS3kwcFA4VDFSN1d6REZrcUl4VzYz?=
 =?utf-8?B?akVWS081Rjc4UUY5dCsrSU1iMzltTnBBVTlEQjBVblhxdktzTW4zRW9sWVps?=
 =?utf-8?B?OU1zaVhQbmEyM0ZBRzh4bkMvTFpkNjZYVFoycG4wczFSYnVhTjc0b3RISXgw?=
 =?utf-8?B?UTU5QlFkYVc4OVpqNmVwS0w3M3JSd2UrdjhYcUI4ME8rQUlreVBxNXpBZ0NC?=
 =?utf-8?B?SC95bkRvSkxFQUM1V0hHSVhXR0ZFTlgvUC9oS3VDZ3gwYktCZS93NFFKajgr?=
 =?utf-8?B?emdFTlFIR0s5dmJmdmpBd1NQRndtdlFHMGdtc0NMSFM2R1A1NnVObUpDWi9B?=
 =?utf-8?B?OVZ4cFhYbWxtU0krZlNoTE5IaDZsVTBCRjQzWEZrQjkrSHorV3dteUhRcWVQ?=
 =?utf-8?B?MkhNUWwzNWoyQjQ1Qnc1ZmNVb1RENXkxUDhzQlgvSGhCV05UdmduWVV3OHZF?=
 =?utf-8?B?Wm5DeDhNOEFJRG4vYndjb1JVdk9FQy82dTF2eUVIZGRhcmRBWTA4NHNwTThL?=
 =?utf-8?B?TkNnTFU1aVNMTnRSUUZ2V0tzRzF5OEY4NGVuTXg3dHVLaWJaYXlMYnhHMVdS?=
 =?utf-8?B?bGREdXU3TXN0TXdjYkxQMFZSQ3hWUEQvak0rWHRJbDJnZ1BzaTFtTHRNSGxl?=
 =?utf-8?B?MFJyOHFpOW1TcTVGS3FLVG9Xd29NZERFNlBmODBBY1p5MXRjRnV5SkNOc1No?=
 =?utf-8?B?czNlOEJ3OWE5c0x3Mm5mWDF6eWw0MU9VcEdrazNFTGZVeUV4alFUMGppZ0V4?=
 =?utf-8?B?SVJtd1RWT2FITlJBOUpMWkhVUW5aYjJmTGNlS21QaG5JSWh6WjBRb2paY1p1?=
 =?utf-8?B?ZGVKTFlROHZCeW9RalhyMDJsQ1phd281byt2SS9TZExGcWlETllSMGRTaGRU?=
 =?utf-8?B?QW5HWFR6M2xBbWRraXRaYXVFN1VVMFJXZ2kraElMOEF5dFMweXRYdXNSQnFT?=
 =?utf-8?B?a1RDWmRXeTJZWENKNnZUaWU5Y3pmZ3NFLy9TOHlmYTRhVG9BRDFidENqblMw?=
 =?utf-8?B?MjlzOVhIcmNyeFQ1dFdUbnVZeGxDbTJWVjlIbGthRnVQTURDTUxyRjJzTU1k?=
 =?utf-8?B?clFrZ2dRUWFxUjF3b3RwWDJrTWZRV3hEWXZJcXZyOC9lRGkrMS9RUE8zZlR1?=
 =?utf-8?B?ZE9EOWt6SzlLL1RDYUlqV0xsZlRzUUhyOEJLRzV4eFhnbGZlMDBMQVNrM2RG?=
 =?utf-8?B?THlUZCtnQm9uZEh4eDVwdXo0UU9NYjEyK1JNUVUvc0ZHOGx4OW1rd0tMZ2tu?=
 =?utf-8?B?NTk5MjJxbjc5dm9qeS9OQU5UN2h2b1N5SG5PWmtzRDVzMnBVNVVrOFBHRHJJ?=
 =?utf-8?Q?qdViGW8XncIUS2kg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <424A7FCEF8D170488468D8C1709AF330@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b0864b-cff3-4ca4-2942-08da3291a91e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 14:30:41.5006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BZP4ihRA3Zzpx7C54p3MJ8ut/+525OafL7xBkcFTWppL8AEJiOOOONmd0Yef8M+OiuA8GNwonwm6VTsngr5j0isnVkm8vbDHq6F4y+dOIe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6949

T24gMTAvMDUvMjAyMiAxMjo1NSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOg0K
PiBJbnRlbCBMUFNTIGhhcyBJTlRFUlJVUFRfTElORSBzZXQgdG8gMHhmZiBieSBkZWZhdWx0LCB0
aGF0IGNhbid0DQo+IHBvc3NpYmx5IHdvcmsuIFdoaWxlIGEgcHJvcGVyIElSUSBjb25maWd1cmF0
aW9uIG1heSBiZSB1c2VmdWwsDQo+IHZhbGlkYXRpbmcgdmFsdWUgcmV0cmlldmVkIGZyb20gdGhl
IGhhcmR3YXJlIGlzIHN0aWxsIG5lY2Vzc2FyeS4gSWYgaXQNCj4gZmFpbHMsIHVzZSB0aGUgZGV2
aWNlIGluIHBvbGwgbW9kZSwgaW5zdGVhZCBvZiBjcmFzaGluZyBkb3duIHRoZSBsaW5lDQo+IChh
dCBzbXBfaW5pdHJfaW5pdCgpKS4gQ3VycmVudGx5IGl0J3MNCj4geDg2LXNwZWNpZmljLCBhcyB0
aGUgc3Vycm91bmRpbmcgY29kZSBpcyBndWFyZGVkIHdpdGggQ09ORklHX1g4NiBhbnl3YXkuDQo+
DQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtA
aW52aXNpYmxldGhpbmdzbGFiLmNvbT4NCg0KVGhpcyBpc24ndCBpbnZhbGlkIHBlciBzYXkuwqAg
SXQgZXhwbGljaXRseSBtZWFucyB1bmtub3duL25vIGNvbm5lY3Rpb24NCmFuZCBpcyB1c2VkIGlu
IHByYWN0aWNlIHRvIG1lYW4gIm5ldmVyIGdlbmVyYXRlIGxpbmUgaW50ZXJydXB0cywgZXZlbg0K
d2hlbiBNU0kgaXMgZGlzYWJsZWQiLsKgIEl0J3MgcGFydCBvZiBQQ0kgMy4wIGlmIHRoZSBpbnRl
cm5ldCBpcyB0byBiZQ0KYmVsaWV2ZWQsIGJ1dCBJU1RSIGlzIG1hbmRhdG9yeSBmb3IgU1JJT1Yg
ZGV2aWNlcyB3aGVyZSB0aGUgdXNlIG9mIGxpbmUNCmludGVycnVwdHMgaXMgcHJvaGliaXRlZCBi
eSB0aGUgc3BlYy4NCg0KQWxzbywgdGhlcmUgYXJlIHN5c3RlbXMgd2hlcmUgbnJfaXJxX2dzaSBp
cyBncmVhdGVyIHRoYW4gMHhmZi4NCg0KSSdkIHJlY29tbWVuZCBoYW5kbGluZyAweGZmIHNwZWNp
YWxseSBhcyAibm8gbGVnYWN5IGlycSIsIGFuZCBub3QNCmludm9sdmluZyBucl9pcnFfZ3NpIGF0
IGFsbC4NCg0KfkFuZHJldw0K

