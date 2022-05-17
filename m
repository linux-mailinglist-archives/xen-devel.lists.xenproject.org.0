Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76652A33B
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330860.554275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx9X-0003Wl-TH; Tue, 17 May 2022 13:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330860.554275; Tue, 17 May 2022 13:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx9X-0003Uj-Q3; Tue, 17 May 2022 13:22:19 +0000
Received: by outflank-mailman (input) for mailman id 330860;
 Tue, 17 May 2022 13:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqx9V-0003EP-AX
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:22:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e74159f-d5e4-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 15:22:15 +0200 (CEST)
Received: from mail-sn1anam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 09:22:09 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2863.namprd03.prod.outlook.com (2603:10b6:300:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 13:22:07 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 13:22:07 +0000
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
X-Inumbo-ID: 5e74159f-d5e4-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652793735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=pOm+i5JAdWUwAraVuKUnIlBtJtehOQzbFezAfJ3DcqU=;
  b=VSCxBbsSo+290RWouU6uyHmZIu68TWkyckZ2DqbiuKECv3I/16NsCxCc
   wR9qCnjgyeRpoJCO5NqvIA9Y/3YlV8GArU9hGDRh7L1jZCRqDxJTWqHGO
   D1oeCyf7G87r+gJLoEuRByc+0LyT2FsF7XvyjOUPLSc9bH54MSBrTzvpW
   w=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 73990242
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kbz7naCqvIj1+RVW/zPiw5YqxClBgxIJ4kV8jS/XYbTApD920zIBy
 GAYUGjXMqqDMGGkfdxxYN628UwBup/SnNIxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPha8
 cdxpaLhcD4pN7zom/83UyFUGjBXaPguFL/veRBTsOS15mieKT7X5awrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t5B8yeK0nJzYYwMDMYnMdBEOyYf
 8MEQTFucA7Bc1tEPVJ/5JcWw7z51yGlL2cwRFS9j6Fo4kjellRN8rHEHurpf5+VGZpnpxPNz
 o7B1yGjav0AD/SPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmmp7+/g023WdNaI
 mQV/DYjqe4580nDZtrwQRy+5mKFtxg0WtxMHul84waIooLW6QuEAmkPThZadccr8sQxQFQCy
 Vuhj97vQzt1v9WopWm1876VqXapP3EcK2YHPXUAVVFdv4Slp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjnNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:8CStJ6HRHcEu6KgwpLqFYZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+twKH
 LajfA31AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3FosPD30E1wsK7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VfN1xJ/dfKla9Ny4kY1jiaGgOKsk8SgDwgq+yxokJz8eXX7FN5KcOuf
 36ISZlXCgJCg/TNfE=
X-IronPort-AV: E=Sophos;i="5.91,232,1647316800"; 
   d="scan'208";a="73990242"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5ajGRf6YBpofDg1cIx18I74HKi88Vy1rj7Tsvko/I8ZNn5B9w0cFPDdnRylIKkTbiK7Pyn1jAVS3hA4SMBnKVYmdG0AeryQUZA6UCE6vl3HoIasupC2rTKi4YN34YqxP/NRLFQg16BK3J6ZbN8zMx9d35DWSD34FmIgrlx4Ygj68zEgCW88Eb/50SRPNtsbmWDbsgH40WYPgZyYtF2eeEnrP89cdrSMxrmus5UzUdv2RHHaLXCDN67i5+qta/lpHJc2gv7w5HA/ekAlBwJ9fRa6vITNESubBYUeVVOJufJSCLylRDbeKD36PbGOlJV+6AGEu7zEeA67N/Y5Uip7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNfREiG9nWIHx3lpEV4C+Dr+1tG6YO5Ms4iOxJIfvy8=;
 b=gv7wXWNg9agDtPZ+9JrpjmSJWzF8CdY07rtvFuV5bGl/Ab2NMIL623LXW0YWweEQzcTqbkkA/juhPxYw3KUVEy+EA5WEluuhF963Cz0sLnriAV4bbt8/oyW4ZUJ45kmzJtnyZR7OJGRCRqWGX9J7uwKJ8GIhqyivHx5h3vIDL8G8pfTbc5VuOgtzNG3x7KTwCZVnwAp1kuA9nuJpsYaz9Diyas4rcm7eCph5SpXQMGsW+a113430/JwvL8TZ/zZVk94nx39M/Z9d2vj8B3YfV7Q8Tw1aVBE9bayfGaZBoPZqBplk8HRoMCZC3XKhHzrQpb8x/II3RhopqImLErBcjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNfREiG9nWIHx3lpEV4C+Dr+1tG6YO5Ms4iOxJIfvy8=;
 b=OFWPSUJjN3ciTejzcN/Q36Nzlc8W8fa81vVdytsYH1HSkdcR1RZ45A008YCQMCfKmE0UMbeDsZh28K69gpAndj/uf/qth9Lv12eQUhRPJ1BhABjAARtZqiQqHpBUxO/bWS8spKMCUwQu2/3GdpVW8N3QGmi24K2u+F4aYLkZfsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/vmx: implement Bus Lock detection
Date: Tue, 17 May 2022 15:21:29 +0200
Message-Id: <20220517132130.38185-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517132130.38185-1-roger.pau@citrix.com>
References: <20220517132130.38185-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0038.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76cce606-8dca-47b6-1ae6-08da38083db2
X-MS-TrafficTypeDiagnostic: MWHPR03MB2863:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB2863798C7CC98D9B40409B618FCE9@MWHPR03MB2863.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g0Kdrzu4qWA6vk4bAXEttEqS4V4JlrCW+3DzNy9hOrYkqfp+z4sU7HUz2w7Hqz1ghPzZ0LOoWNDntM3nwWDTCNZkUtAx03YHGMNjN3QgZo1yee19jyH49Zqf/sUB81KB3YLUDpmh+t72fN3LBVgZhZ6YTgdeWj93ItAG/v05uSq49UONvwl16MzPhzAvoJz9GzxzBZizmfGn9kH9X0/9aFx2OSSJSrF/lwc8+uffZ1KQruIRNyRGIVh4dAlGePcxTElgGCLUu59N3SCx3Ov5IQCz3d8sZm3FE1wSzmOUEPLYV6T1oOLJsaA5cdE4SHbV1xA0bt3WPdKPXu5MnvnsuefR7qfLsDnXj2HTvvyUyb44zyqa5N6oGlL0UdrHJhkNzX9M0+PJXP5GEf/eIKO5sI6mtsstgDCnbpyf/yC+zCbo0Kwhg1zzfaKhmo9R2olgnYHwWyx+zDsOcpIh/VR0Vw1qYeHRRvhtf8E7bpdnsR2Ui/jPMvgnP/Rr6CmWN+UHJPVKw9yxg178Isf/pFucYzBU/quKNGkf0KlfdXEdFh2FGj4ekc6a0LGOigQjZxUE4xyiX31EW7RSDM1RyocIJnHkbybsUDtm7TFQDaDfIQaErRPV4ePRRnkE3nt1YIlcScTJ6IO2gjS0ujRRbdpRkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(6512007)(82960400001)(36756003)(66476007)(508600001)(54906003)(6486002)(6916009)(6506007)(86362001)(38100700002)(83380400001)(2906002)(316002)(5660300002)(6666004)(8936002)(2616005)(186003)(66946007)(66556008)(1076003)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUFES0xYcDYvMklhM3o5MHh2VjFMditBaERmcTRualREY09PNVpNc0dicWtU?=
 =?utf-8?B?M2g2bXFLenY3SElQR3lFWjZYdzZaOC8wRGdnUGxTeFpPd2RpUExrYU0xU0Vo?=
 =?utf-8?B?NHR6QUdoSTZvRjNER0QxRXlLWi90ZytGbER6TWFPVjM1bHU4MmVXcUdEa3NN?=
 =?utf-8?B?d1h1RGw5Um1LbGNrZytwWUFPVk5pbStTeERianE2M0tRN0JtWUZDb05YUlpo?=
 =?utf-8?B?WXlkREhuZ3hPUnB1aDZoYTc0V2dER0ZtSyttYXhFdG9ZT21JbHF6aC81SE1M?=
 =?utf-8?B?Z01NMUViRGIzdzVsaHI1SVg4UzRGOHJNbGZWWlc0SVB6emxHT1J6dEFoVWxP?=
 =?utf-8?B?bjg0S3lWeXNSaHpwQUxYTzB0VUYvMjU2dWFHMjFBc0ZSWkwvY25JcEgyQW95?=
 =?utf-8?B?UUV6UkxNT21EYUNOejlLWUxvOFhwL21oQVlsb1VkSVdRMjRyRitDcWQ2WERi?=
 =?utf-8?B?UFovL0lHcGZaRVJQUVFMTGFvZDZibkx1dEZzdlNCajIrc3VmSXV3bTRXamJt?=
 =?utf-8?B?UEpQRjVNTktkR1dzby9KZmN0SnQzY09qMEVFTlBEeGt0ZGVoNGNnODA0RXNE?=
 =?utf-8?B?QWp3S3c2STBDZDBYVTAvOGJBVGRxZDdKclJlWTBNVnc3SVRja05sTkU2cmVQ?=
 =?utf-8?B?SFlTdGpzRmFIcHBNRlFVWDAwaW1heG9wZFUyN0gzRnN5ekpoSXlpRnUxSHhn?=
 =?utf-8?B?aTMyQmllU2RvVWo2MXBMSTQwRmc3d2p6dnZpdEdNU3dWZWs0TktndDhWbmhm?=
 =?utf-8?B?bGZMTnNUY0ZNVXNnaFF5VHZvZVJzbGIzSENiWmpKMDZUelVXRHF5bmgyVDBv?=
 =?utf-8?B?bDViaCt4KzEzQjRpYmdyYVNpUE16dkNUamwzYUlkVVFSYUxmM25GU0tXV3VK?=
 =?utf-8?B?UU91bFFpbWtaektCUXpCV3BRWVdnK2tPbWhxY1dEM3FmODJrOHBDU2x4TEIr?=
 =?utf-8?B?ZGs0ZGM5YTZDQ0k3bFk4anVjZGl1dGZ1bkF0OW0zWS9wQnZvSzdjeml6S0dq?=
 =?utf-8?B?R2pQS2hDSStGNVBiOE80QUNTUnhlWVdlQlpLUU5jeWpQam9GR1R3TnhuRmM1?=
 =?utf-8?B?VTRMdksrV1BTMlZ5V0VqK0txaExuUkJwR0NNUUlJY3hZQ0dNdm1XVHFoUnZo?=
 =?utf-8?B?ZEY1VnFUSXBiU3Y4Qm1VaHo3L0RGeVBWZnhheGxIZ0t2cUlZTHdQZ0ZsZDR0?=
 =?utf-8?B?c1ZHYU9DTG0xOG5DOE9TSXJuc1ppOUJpaGRSMjh0MklveDdMU3hzazI4QkMr?=
 =?utf-8?B?V0tSbTdXV0c2S3FLQjU2N3REUFdrVjBBdW5wNDZwQW1YeGNqSFg3ejlBNG1o?=
 =?utf-8?B?akkvcU5wMFdpMFFIa2NTTTNINnd2OUkxL1gwMmZERU03eW9sL0JWS2RVUFRP?=
 =?utf-8?B?SGZDSlphZFhEay9rY1lrT0pJSXU2T3g4Vll4ZmVRQmlCbDBnN3J5RHlEb2JQ?=
 =?utf-8?B?MTRvVm1RV0NEQ0lGdHFQN2JleVdjRHhEYVYzYWMzVWNPcms0U1NHT1ZKdS9h?=
 =?utf-8?B?ak14cXZjYSsxdHRHVmVZRTdTZjE4MjdLYXhSVGkxY0xHeDlpNnd6aGh0c3Bp?=
 =?utf-8?B?SlgzY1lIWlFOVkdzQUtWMmpjcWtFUFZNK0dxYUNnL0x1dGh1TlVmSll1ZVFa?=
 =?utf-8?B?WlFmaDhiTEpxUmNnNjdBSVRhZC9ZNlFVV2dPQy9EbU5OMStmWWwxWVNwdXBF?=
 =?utf-8?B?L3JSaEJRRVUrb3A0TWw0M0JMK0VBY1RiVFZqY1V2YjVyLytTMnIrdi9rSFFr?=
 =?utf-8?B?dmFwY3ZZK0hhYTdIeFFGdjhDbko3K1p3WmJ1RFErVU9RaGs4WEUyTVNMV2R4?=
 =?utf-8?B?cGQ3WUY2MlJkdUQybHFnaEVHS3NtL2RBV05hSkxWSnlHNHRZWmczUWI3ZlJ3?=
 =?utf-8?B?OUdCSHhTSk40dEFidnJ0WnB1Z1kxMXZNL1lEUnkxOG9QSER6aXJjSFNnM1Nx?=
 =?utf-8?B?cU5nOGdHZXlwWFY2VlJUV0pvTFBkakZZT0VBRHl4dENWck0vZTZ4QkVLU29H?=
 =?utf-8?B?ZVkyNkVlZVM2bm1rQ3pwdjd5dnpvZjd5NXVDMi9KUE1iSUphQUdWdEw5ZTNZ?=
 =?utf-8?B?ZGZqaFdDNnhJYVpKbFhPWGFCNzlVaTdJTFVrNDhXTzRBaVdIRnlOTHliN093?=
 =?utf-8?B?R1JOQnJJRlVrbTNWV0R3QVhSYXR6OHV1NHlFT01jdXV0TW04K2dDQlJRTldu?=
 =?utf-8?B?Mi9WVkJxMzdRUkE0K2ZGZ2tUell2Y3BjU0lrYnBDWWthT0hldnBNTE41TGRP?=
 =?utf-8?B?eExNZVExY0N6MWVlZXZJNzRveGUxQU1HRExBYnZkRVI2MnlCdHRsQ29TeWJT?=
 =?utf-8?B?dFNnZHVLeWV1Z2czeGFmZ2c5d0ZPZS81T1ozRGZXS04xaUYvcllwVnNmZWw0?=
 =?utf-8?Q?Ok9RjNCMbIouIDYo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cce606-8dca-47b6-1ae6-08da38083db2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:22:07.3728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWCrYiWnZ4duClhIWxy9bL9IW7zE3Hn5gfFaTzU7huYX457uKmNSfZPCRTYX/FfNXPv0rMJFxyekBWrnFMrD2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2863

Add support for enabling Bus Lock Detection on Intel systems.  Such
detection works by triggering a vmexit, which is enough of a pause to
prevent a guest from abusing of the Bus Lock.

Add an extra perf counter to track the number of Bus Locks detected.
This is done because Bus Locks can also be reported by setting the bit
26 in the exit reason field, so also account for those.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c             |  4 +++-
 xen/arch/x86/hvm/vmx/vmx.c              | 18 ++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  2 ++
 xen/arch/x86/include/asm/perfc_defn.h   |  4 +++-
 5 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 56fed2db03..d388e6729c 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -209,6 +209,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_virt_exceptions, "Virtualisation Exceptions");
     P(cpu_has_vmx_pml, "Page Modification Logging");
     P(cpu_has_vmx_tsc_scaling, "TSC Scaling");
+    P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
 #undef P
 
     if ( !printed )
@@ -318,7 +319,8 @@ static int vmx_init_vmcs_config(bool bsp)
                SECONDARY_EXEC_ENABLE_VM_FUNCTIONS |
                SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
                SECONDARY_EXEC_XSAVES |
-               SECONDARY_EXEC_TSC_SCALING);
+               SECONDARY_EXEC_TSC_SCALING |
+               SECONDARY_EXEC_BUS_LOCK_DETECTION);
         if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
             opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
         if ( opt_vpid_enabled )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d03e78bf0d..02cc7a2023 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4053,6 +4053,16 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     if ( unlikely(exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY) )
         return vmx_failed_vmentry(exit_reason, regs);
+    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
+    {
+        /*
+         * Delivery of Bus Lock VM exit was pre-empted by a higher priority VM
+         * exit.
+         */
+        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
+        if ( exit_reason != EXIT_REASON_BUS_LOCK )
+            perfc_incr(buslock);
+    }
 
     if ( v->arch.hvm.vmx.vmx_realmode )
     {
@@ -4549,6 +4559,14 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         vmx_handle_descriptor_access(exit_reason);
         break;
 
+    case EXIT_REASON_BUS_LOCK:
+        perfc_incr(buslock);
+        /*
+         * Nothing to do: just taking a vmexit should be enough of a pause to
+         * prevent a VM from crippling the host with bus locks.
+         */
+        break;
+
     case EXIT_REASON_VMX_PREEMPTION_TIMER_EXPIRED:
     case EXIT_REASON_INVPCID:
     /* fall through */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 9119aa8536..5d3edc1642 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -266,6 +266,7 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS   0x00040000
 #define SECONDARY_EXEC_XSAVES                   0x00100000
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000
+#define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
 extern u32 vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -345,6 +346,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
+#define cpu_has_vmx_bus_lock_detection \
+    (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 8eedf59155..03995701a1 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -159,6 +159,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
  * Exit Reasons
  */
 #define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000
+#define VMX_EXIT_REASONS_BUS_LOCK       (1u << 26)
 
 #define EXIT_REASON_EXCEPTION_NMI       0
 #define EXIT_REASON_EXTERNAL_INTERRUPT  1
@@ -219,6 +220,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define EXIT_REASON_PML_FULL            62
 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
+#define EXIT_REASON_BUS_LOCK            74
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index b07063b7d8..d6eb661940 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 65
+#define VMX_PERF_EXIT_REASON_SIZE 75
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
@@ -125,4 +125,6 @@ PERFCOUNTER(realmode_exits,      "vmexits from realmode")
 
 PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
 
+PERFCOUNTER(buslock, "Bus Locks Detected")
+
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
-- 
2.36.0


