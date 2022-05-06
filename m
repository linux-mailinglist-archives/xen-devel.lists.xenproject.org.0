Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301B851DFB4
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 21:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323423.545054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn3nt-0005bN-SN; Fri, 06 May 2022 19:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323423.545054; Fri, 06 May 2022 19:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn3nt-0005YL-PZ; Fri, 06 May 2022 19:39:53 +0000
Received: by outflank-mailman (input) for mailman id 323423;
 Fri, 06 May 2022 19:39:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmAY=VO=citrix.com=prvs=11886748f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nn3nr-0005YE-7s
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 19:39:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 495c7f4e-cd74-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 21:39:49 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 May 2022 15:39:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN3PR03MB2403.namprd03.prod.outlook.com (2a01:111:e400:7bb1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 19:39:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 19:39:42 +0000
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
X-Inumbo-ID: 495c7f4e-cd74-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651865988;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bZzx+L6wGo6YelnL7p14XuNDn14mIwZ+1GirtjQfpbc=;
  b=LWmhUAp4LZksRAiJGEuj1zb3tMmuDi34De5tMnv4/7q0wmCdAr41mW37
   pHplW2i2Edw0leWOUJvvLOLDOnXrfENxNeTLJbm84rRWvPG6nvdQ2ygEw
   OOUYRp1jiGrMkkDBQNG7ZpFm3GMH6zyNDk4Mnt7GuJi3TO9JDPYTGimPE
   Q=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 70640969
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:01xS96P2puEBVDfvrR1BlsFynXyQoLVcMsEvi/4bfWQNrUp33jBSz
 jAfCD+GPvfZZGv2ed0iPI6zpk0H78KEydA1TAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 ZIXj7uiZVkTGILmgcQ4SklESh5TFPgTkFPHCSDXXc276WTjKiGp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7ENaaHP6iCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2IA9g7N9PRmi4TV5A9Y9LLWa/3LQfWhedp5gHmZ9
 2Ts7U2sV3n2M/Tak1Jp6EmEnfTTlCn2XIYTEryQ9fNwhlCXgGsJB3U+V1G2vP24gU6WQM9EJ
 gof/S9Ghaov8E2mSPHtUhv+p2SL1jY2VsBMCeQ85Eeow7DN/geCLmEeS3hKb9lOnOYsWTEv4
 XqYkNroCCJHvaWcTDSW8bL8hSm1MyUPMWhEbyYLSwIf6vHpvY4ogxTACN1kFcadntDzXD393
 T2OhCw/nKkIy94G0b2h+lLKiC7qoYLGJjPZ/S3SV2Ohqw98OoisYtXy7UCBtKkbaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhknTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:tei2RK3JyLr6X8t2nXXArAqjBetxeYIsimQD101hICG9Lfb0qy
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
X-IronPort-AV: E=Sophos;i="5.91,205,1647316800"; 
   d="scan'208";a="70640969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yba9JUjsHoLa5Pr7cOZ9/P+8BjEp5HxvnRzdjoLNIwk8Cq7Jl2Fx3346Tpz4vYS5jhrzCU9B4KwxAQH/2XDfvhZltwr4etKMy1byaGvxUnqLz2Pi8e3DMbHmqOK8lIFQ1CRHZtrz7rDgGk9AOdUatY5aoB2fCQtSTjlv3ppMxYdaMh2PuYZ+sljJWsABmP7sEOQYY/0El/4hJ7+goS2qkRr16HrNjx2+5PRvvAJwChnq7O8IE073QicoKD4lE4dwsU6XRhq3pbRJjK3JcfvWKSmjOD6Q2tsk6OKgcHGuK/8i3RReSg3OCyRLV6GMOe/vVNUdppyfVYDw44o5ux88nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZzx+L6wGo6YelnL7p14XuNDn14mIwZ+1GirtjQfpbc=;
 b=AkfZ4MztxpQrIXMuzwBseri0gv2MqgrszZQyP7F1kvHlKSl1G2A/om6zmd7CiDdeVsYyDAKeGyMFedUa1YN8ldpXE4DuRDYkQnzfkg1DcTfkjUBMXvjHo0Bqrr6pOXl20gDnMZKBudpL8+8uiqNr43vJ4zF2f3cGVdwgO+4LgawhNhKWHb62/gjzyVgbrcnpaCOOYoHZLhrvEf0hSnnOGWJJ3S7LJqRrXYsmV0eU7W/4iB9HnRpP6Q0K1TOhQl61vv8XWJ+PlgmrSe44Et23zZJlguy3FJGQPgIlTIXSi6sx+4H+yKWmLgN5alrD8s/1nGfqUgoDS7tToHuhmOwFxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZzx+L6wGo6YelnL7p14XuNDn14mIwZ+1GirtjQfpbc=;
 b=Gis0sOJYgnDrKZL7Re+QRcvQs5tsqLuxuopztXIQFiOsbdXBi2xkycm+TiCTzXxxc/+pnRR46L9Zasi1P1vVgC4YFPVJ11SME0Gf9jq8tbQFhTn+Zvpakal5uZC9jlJjxYRz28jPvQEVR3mh/nZG45Wx5m/h0/xw2pMgwDzJEPs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, Roger Pau Monne
	<roger.pau@citrix.com>
CC: George Dunlap <George.Dunlap@citrix.com>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: ECLAIR Xen x86 results and progress
Thread-Topic: ECLAIR Xen x86 results and progress
Thread-Index: AQHYYWbKxDkd+3tW3E+LoQLYc1h9j60SP0GA
Date: Fri, 6 May 2022 19:39:42 +0000
Message-ID: <659c5058-1404-01b5-63d7-48c33159dc48@citrix.com>
References:
 <alpine.DEB.2.22.394.2205060919400.43560@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2205060919400.43560@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 540d611b-ab32-44d0-88d4-08da2f982abf
x-ms-traffictypediagnostic: BN3PR03MB2403:EE_
x-microsoft-antispam-prvs:
 <BN3PR03MB2403FC676BF8C9A6B648049FBAC59@BN3PR03MB2403.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0yXIfSjZJsZCtluO8w7l3o72z+j/Z/m6kB87tkqZDrzXk8uXkvHnvYJna5p8hUg2/jZe2hvVIxthOu4HeO+/3dZhPtdL5SMub30qcmWUiWls0XmyvLIr/8vj/q9UbaQ78sFBjjkLSeSD+o1SEleIrAqtvMtV33XeS+dWa4ah/mJMV9oqrmZwRpjT91G+jI3tslNNFIVqpReRsKm+b4fjd0s0lsJMvv1vPe5zyY4+ejRRIKr9pziT5mA+iMkEDR35lDD0/jEsMIOzRpDrz+uYIGGO9DkYW3m6GqdYQrByycLsJBUPg6bnBWA3PS+IXtWLqghwdylAm7ARwCg+m2X7SSpvT1YhyjYvMrQkhPY0+A005Lla2QrhSBygKYmqKlx0H/wYPnSQty4ndWTw3gQFSOmH8zpJZbp74Fmnj7UHq+obDq/1Hiev5peB2T7mCejOzGfFmucE4g9+p5ownEKQxrPmfm/iE3BLN8YHWoK0yW7ykA8TkbbhKM9sK81SiubAgtZOAyO2BAGFXO7u12w0/L7335NF46UiDH31xfIcwnQD1a3RnIc35COauHDQXD+/JZC87pFPJ+AV5ZW0ZhPujA8Q1SkkiPU+VfSUIMkzpUK9JAcN2yOdEvaSF/KsNLyoizO2ngVKegm5k7MK29XHU6qzTr0SZ+Hud6beCQQqYgAWtzIQ3vX+SjqtjAknk+oOKVdugOTrVVfHiNhn9mNWCBn8ejK/cuU7eTsXegM5/5wEQqfXJ60Ko8s0L9KObsr0NFSeoOf5SrGnBBIUMVipvixrqE3JlByEjaSKDpal143GmTfM0o4HQR0i7bk0jSr1+nNozIjMKs+t5+Vrp+blFLuaEplXCCfwygltM4qYO10=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(6506007)(83380400001)(53546011)(966005)(6486002)(2906002)(186003)(31696002)(6512007)(508600001)(26005)(5660300002)(2616005)(86362001)(54906003)(110136005)(36756003)(316002)(66556008)(66446008)(8676002)(4326008)(64756008)(6636002)(66476007)(76116006)(91956017)(66946007)(31686004)(122000001)(38070700005)(38100700002)(82960400001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXdOWDlTTlVaNitJclpxVXZ0eUs0WStCTHlhQmlVcFp5b0RSSWNiTDNxMmFv?=
 =?utf-8?B?V08vbkRKcVFIRWcramIxZ2paWUdWZUdDejFXV2NPSWhnOHZmY0R3NXdrbTNG?=
 =?utf-8?B?d2dUdG5sRjBpZVJOYlZKZmpSNUdpOENhWnVaM0VqVCtTY2tLNmZpeEJIbUxz?=
 =?utf-8?B?MDd4bU5IRi9talVUd1BZRldMRm5VN0RGQmhCc2FiSm9na3hYTUkxaVEwWnR2?=
 =?utf-8?B?aEw0UWZiVDV5RkdNSEd6TlZSYVdlMlR1eVlhdFNRWFFZcnBNUjE1SW9rMmRR?=
 =?utf-8?B?V0thVWFDcTFLaGlEN1RPcHk0YkYrWk10aEphNm80QTRmczZkejlvdG55cXdK?=
 =?utf-8?B?bzZ5S3VkN2Y4emZmSTMvK3VqbEdsWUU1N3NFQmVGSmNuWkxDS2l4RlNrZG5L?=
 =?utf-8?B?aTZlZGR4U2JBemYxY3Z2alR3eXRPSnhyN0EzU2N3SFBEZGt0SHB2Q3Q4SURH?=
 =?utf-8?B?MDhBbmh0RWU0RnpYTVlhTFA0SWNSOG9YdGJKKzVVVlk3b2E5N3BVN3JSczhG?=
 =?utf-8?B?LzFkWXppWWxEdHVSNG1wZlFKWVVPOGI3MzZsc1NsOWdTQkdIQjBmSnlFeElE?=
 =?utf-8?B?UFdUQ0xqeVRYNU9tM0RjU1U0T1J0WFY0dVBkS1pKUXFtWUlySS9wbVRUSnVn?=
 =?utf-8?B?TEMwNTdvUzg4eUhNQlYvcWJnUU1Fci9vaU1PMHpVTzZ3MlZWQ1NrRUNDcWJt?=
 =?utf-8?B?MWlaNmVOYWRDSDNNVnRkT1ZjN3Z6aEhsa01GMVp6VkZBd3N3TGk1WCs2cVF1?=
 =?utf-8?B?STdNRWNoaDV3NGxWMHlRS2Eyempsa0p6RUpEZGlqenpQK2RTN3VSYUpvRVg2?=
 =?utf-8?B?aTh1dlp5cmVHL2pvcVVJK1E4Z1ZBcFkra2xtSlNNQVNEZ2lqdW0wMGlocWFx?=
 =?utf-8?B?ZlBHWlZXOHJvQWExQ1lsWHR2TnhCdnJTa2pWSUNIcWhiSnNIMDZrcFlWRys0?=
 =?utf-8?B?R0dEb0pFYlB1aWZZVC9uWit6dmVHcHVWTUtTWVNxSWVZNk94NlUyQ2F2MGY3?=
 =?utf-8?B?QlBzWjFCcUhiSk11RE0wUDB0SmdFTzBBa0syeUZXY2FjWjR6ZnEzNi9YTm5p?=
 =?utf-8?B?UWd1bjRUcHh0NDFBNFdCVzh2ZjkzUm05bUFjVEtBNUxkczdta2xsRkhNSEND?=
 =?utf-8?B?SW9FeUNaR3VlUUR0OXJzdVFWU2xEU0JRTHl5UTY4MEJ6aVZmQ04zVXcxMDNu?=
 =?utf-8?B?V0FzKys2aW5lNTFFVTNnSFNFRWNiay9jR25xSVIzY2xscnMwcDRWOU1TOFVs?=
 =?utf-8?B?OHJyN2U5anE2K21xdFdFOCtMcU4vRWJiUkg3SDFCUDF0ODcyMDljNERoVE1U?=
 =?utf-8?B?QmdJQSttNzlPSWNHUkZuTSthVFZucElRam93bTlPSGVKamQ1VG9mYXJBSmh4?=
 =?utf-8?B?REcwanBPYXFGbjVOTmlxdlRSaUlaNlJCM1Z1STd1aURZRG1KclNpeWRKSUc0?=
 =?utf-8?B?a2wvOUVXNnBtY0VxMmp3emd1VHFmTDR4clQwaFFSanVTb3dTdnBtVERpdS9T?=
 =?utf-8?B?RCs2MFFGYkNrOEVRbmM3VWNic0c5eEs5V0ZXdmRaMC92QjdGTU5DdnYzL1pZ?=
 =?utf-8?B?MVJMK1pPM3BQWWd6dERvWXJBZXpXeUNaUE50dnFtZkI3VVdnZDAwOEtTcHcw?=
 =?utf-8?B?TGpPSGxOcmp6cVhKMTNUTi9ST1Y3K1BITWs0c2lXQ1BZeTErTFpxbGdveUli?=
 =?utf-8?B?NHZZQUM4OElWSXppK3QrYlQwYWFZR005MFd5Tlg0OUpIU0NwZWZ2VlBFQ09u?=
 =?utf-8?B?clRaSUM2RDJhZWRVT1c1MzdoVlBHdnozUHZQc2JwMXpKcXBJelYrR2Ird29w?=
 =?utf-8?B?b0dIb1hIcmZCSDlpS2ZrMnhIeXZKREVteFQ3QmhvSVAwbm9NUVZDT3JWNkF5?=
 =?utf-8?B?OEV6UUJ1d2VseXFzK1FoUEFIQ2MxN1pZa0RQY2QwTHR6bnpmTGhWTnE1QUxn?=
 =?utf-8?B?TU01QlRrR2I4ZTM1aFhQQm1wY2tKMjVlRU9Nc2lUSE9Xb1lIVHVKRUR4dlly?=
 =?utf-8?B?Zjd0WUJnVTFNczJxcWp5bVVRblNOM0lMN003aXNFNFoybG5PRE5kelRDNG53?=
 =?utf-8?B?OGxNS294MjR0MHg3MFVWQWE1dXhBbUxMTjhISVVPNFNGcVNKSC91dHRBU3Ez?=
 =?utf-8?B?UllWT0xZZlVJZHJSOUU1T1A3ekgyaHBPMVdId2JXYjh1ekVDUHd4cVJyZ3pz?=
 =?utf-8?B?Q2phQ0t5VVJDU1lkSDUzV0RoTVpZVlkyVUlMcUFpNUQzc3hLTmhtckRGanQw?=
 =?utf-8?B?c2NnTlUzdHZuQmZQNEx2eTlidWVkMmFCV2ZOY00xdUFlTy9yamtCQmZDSE5X?=
 =?utf-8?B?bEdsY2VvUHVYcHJUWFBwTFFOYlg4SHlvMHBZQnlFUHhoTnlOTGxjVjlsSDl5?=
 =?utf-8?Q?By+5UakoiRwwHsxU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F07666589F74A0498405716DDA1858B4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540d611b-ab32-44d0-88d4-08da2f982abf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 19:39:42.4607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JSs59cySmkkK67MF61tDN6nkDBpm7ndPhbbZRLw00o+NeRMd/x7w6C/PiY3G3KMJZ1u13gnpnG/ZkqyESWz9xVquu++tZ2fYUOR17nuefHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2403

T24gMDYvMDUvMjAyMiAxNzozMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBIaSBhbGws
DQo+DQo+IFJvYmVydG8ga2luZGx5IHByb3ZpZGVkIHRoZSBFQ0xBSVIgeDg2IHJlc3VsdHM6DQo+
DQo+IGh0dHBzOi8vZWNsYWlyaXQuY29tOjg0NDMvam9iL1hFTi9UYXJnZXQ9WDg2XzY0LGFnZW50
PXB1YmxpYy9sYXN0U3VjY2Vzc2Z1bEJ1aWxkL2VjbGFpci8NCj4NCj4gQ2xpY2sgb24gIlNlZSBF
Q0xBSVIgaW4gYWN0aW9uIiwgdGhlbiB5b3UgY2FuIHNlbGVjdCAiU2hvdyAxMDAgZW50cmllcyIN
Cj4gYW5kIHNlZSBhbGwgdGhlIHJlc3VsdHMgaW4gb25lIHBhZ2UuIEFzIGFuIGV4YW1wbGUgTUMz
UjEuUjEuMw0KPiBjb3JyZXNwb25kcyB0byBSdWxlIDEuMyBpbiB0aGUgc3ByZWFkc2hlZXQuDQoN
ClRoYW5rcy7CoCBTb21lIG9ic2VydmF0aW9uczoNCg0KMSkgRDQuMTAgInVzZSBoZWFkZXIgZ3Vh
cmRzIHRvIHByZXZlbnQgbXVsdGlwbGUgaW5jbHVzaW9uIg0KDQphc20vcDJtLmggbGFja3MgaGVh
ZGVyIGd1YXJkcyBhdCBhbGwuwqAgYXNtL3NvZnRpcnEuaCBoYXMgc29tZSBkZWNpZGVkbHkNCmRv
ZGd5IGxvb2tpbmcgbG9naWMuwqAgVGhlc2Ugc2hvdWxkIG9idmlvdXNseSBiZSBmaXhlZCwgYW5k
IHRoZXJlIGFyZQ0KcHJvYmFibHkgbW9yZSB0b28gaW4gdGhlIDU3IHZpb2xhdGlvbnMuDQoNCkhv
d2V2ZXIsIHdlIGhhdmUgZmlsZXMgbGlrZSBwdWJsaWMvZXJybm8uaCB3aGljaCBhcmUgZXhwbGlj
aXRseSBkZXNpZ25lZA0KdG8gYmUgaW5jbHVkZWQgbXVsdGlwbGUgdGltZXMsIGFuZCBhcmUgbm90
IGdvaW5nIHRvIGNoYW5nZSB1bmxlc3Mgd2UNCmhhdmUgYSBmdW5kYW1lbnRhbCBzaGlmdCBpbiBv
cGluaW9uIG9uIHRoZSB1dGlsaXR5IG9mIHRyeWluZyB0byBtYWtlIGENCnNpbmdsZSBzZXQgb2Yg
aGVhZGVyIGZpbGVzIGZvciBhbGwgZW52aXJvbm1lbnRzLg0KDQpBbHNvLCBFY2xhaXIgcmVhbGx5
IGRvZXNuJ3QgbGlrZSBob3cgd2UgaW5jbHVkZSBDIGZpbGVzLsKgIFRCSCwgSSBkb24ndA0KbXVj
aCBlaXRoZXIsIGJ1dCBzb21lIG9mIHRoZSBoeXBlcmNhbGwgY29tcGF0IGxvZ2ljIGV4cGxpY2l0
bHkgZGVwZW5kcw0Kb24gaW5jbHVkaW5nIGl0c2VsZiwgdG8gYXZvaWQgY29kaW5nIHRoZSBoeXBl
cmNhbGwgbG9naWMgdHdpY2UuwqAgVGhlcmUNCmlzIGFuIGFyZ3VtZW50IHRvIHNheSB0aGF0IHRo
aXMgaXMgZGlmZmVyZW50bHktbGVzcy1iYWQgdGhhbiBvdGhlcg0Kb3B0aW9ucywgYnV0IGl0IGNl
cnRhaW5seSBkb2Vzbid0IGhlbHAgd2l0aCBnZW5lcmFsIGNvbXByZWhlbnNpYmlsaXR5IG9mDQp0
aGUgY29kZS4NCg0KMikgUjYuMiAiZG9uJ3QgdXNlIHNpZ25lZCBiaXRmaWVsZHMiDQoNCldlIGhh
dmUgb25lIHNpbmdsZSB2aW9sYXRpb24sIGFuZCBpdCdzIG9ubHkgdXNlZCBhcyBhIHJlZ3VsYXIg
Ym9vbGVhbi7CoA0KSXQgZG9lc24ndCBldmVuIG5lZWQgdG8gYmUgYSBiaXRmaWVsZCBhdCBhbGws
IGJlY2F1c2UgdGhlcmUncyA2MyBiaXRzIG9mDQpwYWRkaW5nIGF0IHRoZSBlbmQgb2Ygc2hfZW11
bGF0ZV9jdHh0Lg0KDQooSW4gdGhlIHRpbWUgdGhhdCBJJ3ZlIGJlZW4gYnJvd3NpbmcsIHNvbWVv
bmUgaGFzIGFwcGFyZW50bHkgZG9uZQ0KYW5vdGhlciBidWlsZCB3aXRoIGluIHBhcnRpY3VsYXIg
Q09ORklHX1NIQURPV19QQUdJTkcgZGlzYWJsZWQsIHNvIHRoaXMNCmhhcyBmYWxsZW4gb2ZmIHRo
ZSBsaXN0IG9mIHZpb2xhdGlvbnMuKQ0KDQozKSBSOC4xMCAiaW5saW5lIGZ1bmN0aW9ucyBzaGFs
bCBiZSBzdGF0aWMiLg0KDQpXZSBoYXZlIDMgdmlvbGF0aW9ucy7CoCBPbmUgaXMgYSBsZWdpdGlt
YXRlIGNvbXBsYWludCBpbiBzcGlubG9jay5jLg0KDQpUaGUgb3RoZXIgdHdvIHZpb2xhdGlvbnMg
YXJlIGZyb20gZXh0ZXJuIGlubGluZS7CoCBHaXZlbiB0aGF0IGV4dGVybg0KaW5saW5lIGV4cGxp
Y2l0bHkgZ2l2ZXMgdGhlIGNvbXBpbGVyIHRoZSBjaG9pY2UgdG8gaW5saW5lLCBvciB1c2UgYQ0K
c2luZ2xlIGNvbW1vbiBvdXQtb2YtbGluZSBpbXBsZW1lbnRhdGlvbiwgSSB0aGluayBleHRlcm4g
aW5saW5lIGFsc28NCm1lZXRzIHRoZSBzcGlyaXQgb2Ygd2hhdCBNSVNSQSBpcyB0cnlpbmcgdG8g
ZG8gaGVyZSwgaW5zb2ZhciBhcyBpdA0KcHJldmVudHMgdGhlcmUgYmVpbmcgZGVhZCBmdW5jdGlv
bnMgZW1pdHRlZCBpbnRvIHRoZSBmaW5hbCBiaW5hcnkuDQoNCn5BbmRyZXcNCg==

