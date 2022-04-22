Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD650BA86
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 16:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311015.527981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhuWQ-0007Vd-VQ; Fri, 22 Apr 2022 14:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311015.527981; Fri, 22 Apr 2022 14:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhuWQ-0007Tl-Ru; Fri, 22 Apr 2022 14:44:34 +0000
Received: by outflank-mailman (input) for mailman id 311015;
 Fri, 22 Apr 2022 14:44:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+xj=VA=citrix.com=prvs=1042e1a12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhuWP-0007Tf-GY
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 14:44:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b719eb53-c24a-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 16:44:31 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 10:44:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5075.namprd03.prod.outlook.com (2603:10b6:408:df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 14:44:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 14:44:27 +0000
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
X-Inumbo-ID: b719eb53-c24a-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650638671;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Hn3/Va1zcskwbc3cwCcV3YNR4+I3wl/S8U3iOrqEKyM=;
  b=XcosSuEd1jcA4fCJR0VE9tKQq3jp+0riI3d3d+nw65NjZrK7TuI5gvx1
   yHgajSTsKifoyh5Ink2OridoiVCuIkSPWvg28uVSaleEQdWl76R5+qQO4
   262Wud89r54jMS5hyNW27swq+HHxmxJPFn69m4CB3UK0IpPwXiSLRp6AY
   U=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 69728125
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AB4brqCLB7E0+xVW/1jiw5YqxClBgxIJ4kV8jS/XYbTApDl31GMGm
 2AbW2yEbKmDYzD0Ld0nbNzl80wD65TTnYBhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jj2NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgh0
 vJD7KyIYD45YK7NqPUPVjxpDn9XaPguFL/veRBTsOS15mifKT7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t3B8mcGs0m5vcBtNs0rulIEezTe
 Iwybj13YQ6bSxZOJk0WGNQ1m+LAanzXLWwH8gLM//dfD2771y5y8LzmYNTve82la8N3wF6pq
 zjX8DGsav0dHJnFodafyVquifXIhjjTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDUd3VTxC+5nmesXYht8F4FuQ77ESBz/TS6gPAXGwcFGceMZohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:Mshsyq3izjU9xCGPPZ7uTQqjBetxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyTpAJb4RGYFqjgpF5N1H22xa1+
 UkZC1Qefib3kmhO11dZyGdgjUIngxes0MKgmXo/EcL6faJOA7STfAxxL6xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMMjgZJq3PoiFXluYd499ePBmfIaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgEl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sjnwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uw9zvkMehTIYd3A8LAv23EigMyMeFPCC1zxdHk+1829vv4YHsrXH/
 6uJZM+OY6XEVfT
X-IronPort-AV: E=Sophos;i="5.90,282,1643691600"; 
   d="scan'208";a="69728125"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5wP6U4xMvNH5vbaPBSXbhwIFDDYmM7dGAH9TSd3PpLwvEaUmEf8dcAzAPB+UTTX4f16Q6Pk81mvhNcxNZhLjtai0RRCABYJh5UtivmuXKtGS1/W2Bbwqr8ENjBv4mY3Go4pgkyTDyqY1vVJE2GT/oZVMkzMHLR0B1dxrZHsAnU7KMWAkxxZ07pLWdSM6W+ghxF0ohxW2QNvbnTMYBuSGl2ThEKveKuysvB3+4lVf1DJiT71wMn4iwDsdTdTS6BM9X5cv9zl1H58eD7Q57lITXa+z/1u+0uvpdSPxjZ5sHMTt3FsbpEJbb8jM4hcav3S9RFpOLS8F/JfCOMHx0IxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hn3/Va1zcskwbc3cwCcV3YNR4+I3wl/S8U3iOrqEKyM=;
 b=hnJehBbnXiRcTWh3BCvSkKDB106FqRRvqLCjX7xpvAv3YaaQhJL9ovpApZEFDW+x3S0kzmfKxzcMneksoBVOi6wxnNzmGknUVgUP5KT/jzY5GT/XVDk4wvgYut65ZDzUU+EfA3hFbng2+5+Hpzvw4W0HNJH/W5xAObokGHldS65zqyu+Jgge4/x1nmf11c5mU15JThy8majEaHWW3CX/xVGvFDErRPwgXsrtt1TK/9UwL/KYYY0KQCuorXs0SL8bXS8yP/traj9ftTiDyrHyKGjAJ15Bqx/oLwAv6/8VGZmIy81BbulMqr8uAfWAYCScNp9Jr8jf0t+7eKFsra8IrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hn3/Va1zcskwbc3cwCcV3YNR4+I3wl/S8U3iOrqEKyM=;
 b=cXyGzzZY4zQxR8JpQWPjPnpKR63m6xvGaBxaD6C39Jm/n9FArXiYdcMuzbHiBJtcha4qiMeZ2D93J53p9dhIKimwe1RBBxEMNppG9BKN4aMkD2lQGvASCj22C508VSzInIn7xR0f9o7MH0ABArlCcGAxpaLkTu+GMQ997dIPa6Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/4] tools/libs/evtchn: don't set errno to negative values
Thread-Topic: [PATCH 1/4] tools/libs/evtchn: don't set errno to negative
 values
Thread-Index: AQHYVIinhoRyh3e5qEasPCJgKMVAJKz8BdsA
Date: Fri, 22 Apr 2022 14:44:26 +0000
Message-ID: <f9c85569-e068-339c-1ca2-db72cba139ce@citrix.com>
References: <20220420073119.16974-1-jgross@suse.com>
 <20220420073119.16974-2-jgross@suse.com>
In-Reply-To: <20220420073119.16974-2-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a116c7d1-c7a0-4fcc-fb31-08da246e99a9
x-ms-traffictypediagnostic: BN8PR03MB5075:EE_
x-microsoft-antispam-prvs:
 <BN8PR03MB50751A0D8A67089CD66ECABDBAF79@BN8PR03MB5075.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CCBpX+NKXIwMTPDcqTmmKzDfC3VY5PAIVTvC4SM3t0vmXvSs6dclr0CeaFMWNSjUHycvOHyf1aQ/+qc8KLFkqgPapuc9qHJ9LLt5Dz1c1YRH2fCmY3nGOK9poeRsYVnc7FPcTHeNJbDLtaNV1JWQ9GhFQXiqO540bHEK1dJIsb+LfNSzmUrLR92J9QaMAllqvC6r+hf4cIXc8Dc9xrSaHLn0RZbHTw8WX+A1A6y/bL1f8gSDRUK3Uo121D/COVpblkI1KAjBhv2lkXWyWB35kGdayC5t3swptjeZiPmgf3PpvtUqd9uddOYGsJGJTQp2jZxyIk9xBpWmCafSVrZ16hX1NxZkoi5o3/Nuhm9p5m2slEouUsiRw0g5A3pgUtNpnhs6IM9LH6cFSaV5Y2/G8JzK1v0ceOn1cii98HVsmNYBBWVkIe6L8n7Jizr57a2CvAGRlvDHRlLbLee28827j5R1uQl6/B+yN8RcnRu+Giz7AeHRPGk3Jk0LwHgkUbWVtM/C36e07dFfl6PQ2Dz6ej2V4G4NDCsdgkhwnaz4pyo0dZtq76ymzA3RwI8Kna5GKGPgQBOtoWABaVDlB+r9b8EyWTyOfDmPQXAG9OjHpJDwea6yZUGIzwxvOH5NEUWiePTYvD+JTsZ23Jw4b4fiAVS5Kbu6WJnlo/n0LDxKJjJtS4GFPOu84B2NYNXQSalb1ueoKSAhXeAtDO3MqqIJ5EqrznLcWYvRVncHKWNuSVKgxRQPlAIP2OnVJAJUUXcEJAgVIVPb4RMRtWtje9aYRQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(26005)(66476007)(8676002)(6512007)(6506007)(54906003)(508600001)(38070700005)(91956017)(36756003)(38100700002)(86362001)(82960400001)(66946007)(53546011)(316002)(2906002)(76116006)(4326008)(6486002)(31686004)(66446008)(5660300002)(31696002)(64756008)(122000001)(8936002)(107886003)(66556008)(71200400001)(558084003)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3k4ZUJIWk1LdXI5eENneFRTOG1xeEk1clJ4enpibDdVVi9Ydm51ZFRXT2c4?=
 =?utf-8?B?eFlnU2NiMmRkL0h5Umswbm5WS1NMRFFISDdHQUFFSGFUVkthcHA4UGZMSUUy?=
 =?utf-8?B?aWZSWlpRaHhzZitYNlR4ZGJ6b0hoNTM4S2V2Z2RubmpZaDBzaW5HanQzdjF4?=
 =?utf-8?B?WjdHNnlxcEtxZTJ1bWJSYXdXNUl0OW5vRHlrRmxsMHIwWm9LWm04UTNSTFht?=
 =?utf-8?B?WWhMazNXTTlGSTRMdi9pc1gwdmpjWEtOMGJ4anBPd1ZvZnJNMGVSeTdoUk9N?=
 =?utf-8?B?WnY0Nk4zZTg5WTVYdUlxaW1OeUNrUzV1RlhvZ3FBQ2g4VjFwU2tLa3hYVUxQ?=
 =?utf-8?B?MlFORHZka0hkTHp4bWc2YnJVWi9Vc2dKQ0FTNWdobUMrdE05Qlc5ZHlSQ3Bm?=
 =?utf-8?B?dWpUd1F1K2gwMFlSVnlnWkNDZXhCY2NONFRCWGVkSjZvT1lQVTkyNmFNdmNj?=
 =?utf-8?B?UVlZRW5uUHJQUk5MTDVHd25sVWtLSnVtM3NqQXcyVGprbVI5S0hTaHE4WTAx?=
 =?utf-8?B?dXNyamFpeHRXbVAzenhVU01RblpNQ1JqQ2NGOXArOFpucmQ1NFZkV3VFVGZW?=
 =?utf-8?B?dk1QQVNLN3lUSkNNckFSMkMxMEJNR0daZXd4RitrSTY5WllnRzlmMEZhbGNt?=
 =?utf-8?B?aWV1MVZQTVhMY2h5a1FtL2FJTzZjK3ZjbnNiQ09vdDFvVWJkOFhsRVhFU2FQ?=
 =?utf-8?B?WHBJbU9OWFh2MlZ0NWJ0OE5KT0Q0WEhCOTRaNTMwWTRGMDdyRFFUaW8rblZk?=
 =?utf-8?B?MlAyOFV1TVJxNjd5ang3d1pGb08yRy8rY3JBZjZhNzJhTEhQaWVjeWthZURX?=
 =?utf-8?B?czNCSzIrd25zM0h2WFpvK2lwSk1QYm9Lc08yVmIraTdabDhnOGJQQkxzenc2?=
 =?utf-8?B?ZXFqaUl4TlYyNjdjczluUlRkVkdlT0d4ZytuS1pvY00xelExeEs1L0FTakNS?=
 =?utf-8?B?TEJRemRuQ1FDS0E5MGtiWW1qTWZoaXJpVnphelF1ZWpZTXZ4SjRPdSsvV3NY?=
 =?utf-8?B?eHY1TFRsYkl1NkVuWHpvajRJNEYvYWl5dEl2dXlLYm9tNGEzNmlESUEwbHZR?=
 =?utf-8?B?RFdPQ0xXL3Q1cTZMZUNJYmhQakZkMTlwVTZFc0ZLcVRydHJVS1VRd2JNalIx?=
 =?utf-8?B?ejVETDY5clEzczFSQmgvb0gvY20wcmVlN2JnUEk2K1hXSzlYZ054Z2pROU9h?=
 =?utf-8?B?VmF2elFlK3V6a3lmaFcreitnWXRLVmVYM0lVUWdHQTVQaGUyQm4ySlZxQ2JL?=
 =?utf-8?B?L3RRTFFIcE1sK1BRTmVRL3dSZkhCaXN4NVFYNnhoOFJjK1hFVXM1NEFEckR3?=
 =?utf-8?B?aVdEOEQ1WHlzOWNYRW9aWDNIMDF3a2VrSVZkM1lZZ3piMW1sT3ZNTWl4aHZH?=
 =?utf-8?B?QzVYVWhwZEkxWVNzbi8wRjR1b3pkcUR3RlJiVGZHQS81TlN0ZDVnN1JnQkNH?=
 =?utf-8?B?TUpWMkx0UmNzU3ROUjJRVzNBSEYvMWtLMjBKaHJkYWVNRUE0NE5nT0Q4RFR6?=
 =?utf-8?B?MnFIMjBIbTBrK0RuRFF1cVZZWW9pMFBxL1dUNkVBSDJ1dlJZZElwZ0hoWDJw?=
 =?utf-8?B?QURPWFU4eFJtNkxMTUJ2UE9jaDMxTm9yQ09tcFVzVXpZY250WHNHNTBaQXRr?=
 =?utf-8?B?cHRDekN1N0NPQllhVGxIYm9uYzFsMjVkZDZnMGlsdG51dWN3c3ozdC81ZGxO?=
 =?utf-8?B?SGhzYUs3RGFCdGs2enpoYlF2ekJ2d1RSQmZyUlVjVTAzbVh3YzJLWGpnQ0NC?=
 =?utf-8?B?S2NtcCtya0MydGNmTnlYMUxYeWJaaVhCYitWMmJLclJzWmVNdWJQQU43U0hp?=
 =?utf-8?B?dnpzNUxjZmQyd2o4STNlRm16YU5hcFoydHFYL04zSG1hUHQ4TlVrdmw0dmFv?=
 =?utf-8?B?MkUxOGh3a2NpWmVtQnlFR3lPdnhjd0lEN3VMdWxxMXh1UmFwaElFZzFuTEJS?=
 =?utf-8?B?UHdXY1dncitLZXUxeVNDUmFHbGZyNkVOTEtKR0d5NHdycWkrV1BXaTV3Qy82?=
 =?utf-8?B?SGs3MlFDV0NBRzJuNVlFLytLdmEweEUwU3BzK2V5M0poaER2eUtiK0xQZ1c5?=
 =?utf-8?B?WUpjdmYvVUUwK1pSR3FzaXdOVkJlTlVrdTEyclhuT3Q3R1g2TkxQUU5PSlZV?=
 =?utf-8?B?OVgvazMrR1JzamlnakpIcVY1YkVjSGNXbENmeHJKYzVMRkxSVnh4eTYyWDZX?=
 =?utf-8?B?N0gxN2NQRzdlVU5UdXc4OXRhb0xRUG1DM1owdzBMM0FoN1AwTkxTNDNpYmdI?=
 =?utf-8?B?d2t0NjAwc1h0akNkVUVRRlVHd0JaZjlSL2ZZL0FrUTNhekNqSlo1VVVFY3BQ?=
 =?utf-8?B?RFVGbDJ1WDBVVmg3ckxuWHV0OXYwVCtTVDJaRTQ5ejFpZ09sWUpxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86D8F6071ECA9A4892F599EDECF4410A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a116c7d1-c7a0-4fcc-fb31-08da246e99a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 14:44:26.9246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LmuiuNHvAI33eepH+2FO+qxt+E1YimkHFN/3zw6Zi5HTPr2bsl8by9uR7S8rbtli8ptRiTCDPBjEx5nAsD4awbE4OWnsPn5JrSibSbVfU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5075

T24gMjAvMDQvMjAyMiAwODozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gU2V0dGluZyBlcnJu
byB0byBhIG5lZ2F0aXZlIHZhbHVlIG1ha2VzIG5vIHNlbnNlLg0KDQpGaXhlczogNmI2NTAwYjNj
YmFhDQoNCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
DQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

