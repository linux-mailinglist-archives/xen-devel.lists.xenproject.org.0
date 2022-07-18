Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2376857870A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 18:11:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369922.601540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDTKz-0001ho-Fc; Mon, 18 Jul 2022 16:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369922.601540; Mon, 18 Jul 2022 16:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDTKz-0001ew-CW; Mon, 18 Jul 2022 16:11:13 +0000
Received: by outflank-mailman (input) for mailman id 369922;
 Mon, 18 Jul 2022 16:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDTKx-0001eq-Nd
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 16:11:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b8ef15b-06b4-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 18:11:10 +0200 (CEST)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 12:11:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5803.namprd03.prod.outlook.com (2603:10b6:806:116::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 16:11:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 16:11:05 +0000
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
X-Inumbo-ID: 3b8ef15b-06b4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658160670;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DeR1xM9clxPThvwIwRFyrGWtoRsfan4gQ1Xe+sIld+s=;
  b=hUSTZFTYExjvBcBsaG3R/1pXwt2A2/CjT9aSrZTQl91VFxeQqwEhh465
   psa/MFv5RYqI+q/hsXwgNHK1wGT6Gwd55RVM5j/VZsShQngUAxCIa30qa
   GdOu4gF9S0RxhOVPBRHl1ShIfeV0x0IcuMdxRObe2lIMv3wTG7aT/UOkE
   k=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 76050321
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A7Ux5yqPi5tziBiXvrXNrnJZpQ6imJRDwMBigO?=
 =?us-ascii?q?pGNyHHe1HtQZ0Fdl8jBgIlaPhxqb1M5WdDwY4xejPwS9Vsfw+ietHj3SKQK3?=
 =?us-ascii?q?JpmGPdIPltlpT3G7+RCZoHPael36cmn1uumB/ZKOT2nDS9tFgZEpQGawSeZH?=
 =?us-ascii?q?MqYOaYuw1QgxKcRUGBcHRnj/2Nh8u5HlXShmjky2u5fISE+050GTm+1YyHu2?=
 =?us-ascii?q?ZdP4rVnOBMcAn4nwfcYhAlWGQXPimHgBL4LGrP982jvWsTRKFGbCnmc2zwrR?=
 =?us-ascii?q?P6KOMtRhUQT3VCwS7+rcqQqrjpzJyIasH4RnfL6ev4LrFjRk7LY94pXms6dx?=
 =?us-ascii?q?xvt2anvRwFgjX4c3biG+xofEmWBy6Kknw40+06FrT0m+VAAJm5SwL3i3g4uB?=
 =?us-ascii?q?eIvCII0VICOrQDNFw30p8qKkl9imD91GoxeGMkR7iYwGQpY7nnLY/mKFTf7+?=
 =?us-ascii?q?73vy7FmZ2i3A8FUpGmYu3BF6Q46TDbu6eDbsSl6I1bs5G671w+NeTJs/Jcdm?=
 =?us-ascii?q?jcs3vDyheFNigKPJ4sHUe4SgxQ5QWT7eg35BE29t+gUIslHsHJd9iZUz2uGr?=
 =?us-ascii?q?pC1c0lfajnt1trfLMo3UY5wZewwNQqlx/i8J69wD1JQd1Yuisbr6GIKoOmZb?=
 =?us-ascii?q?o3kC4g6oltJVwl+Nt+o0ECnC46eADE3JVWNY2hMQPne46nS+k7LWnXxgzAiK?=
 =?us-ascii?q?n3NjNq3CBPufLdhzINkkwoFZ7zZnPBeakge2opdlmiZxySZtcuQRZYWGM/Zn?=
 =?us-ascii?q?wGweymfb/GIzW2Iu8HX/0OnzxHey6Edh3KstJxYE2goW1lNZdjp4mZucW37U?=
 =?us-ascii?q?Xj9lvN1gOju7z9bR/PCS6iMWeXO9w8+WJpPgf5Mf1+RDvVil5K7Y9vVeYEnS?=
 =?us-ascii?q?iJwEvxSxKZuBJfOHgShIZxETyofBB10LAWKiqDysCmlWpzU04TFg9wzYJMzF?=
 =?us-ascii?q?Fli2M0aS/P841b47M4Javf/wdUKpGj1XJ+7OtKJ2PF/KKvTPb7LYcm8IlTyH?=
 =?us-ascii?q?L2ZhPUye02B8Ym7cjTt0zHqYh1K5oaCyIx0dqy4axGXVZKyk18H7n/Ut2WP9?=
 =?us-ascii?q?eZu+fABmt8pLivDhUuA7Oj1OmbzggoZ/MxMEmS5xtH6Ryqva+h2O4LsKEplS?=
 =?us-ascii?q?P1mQOv7g4VVSrPzocdc2oPZ1NRXm9HF76jWNCwBHFFf4aPVW4PeQtvtnPFpK?=
 =?us-ascii?q?IeLWlwvALMGzArE0wFt6m2BO+6oCznaJ3lNRxfVqQRKlquTICdbdM/kHvMy2?=
 =?us-ascii?q?Jj3s31+HaATVj+unqcD+Ynsy2LY1xYVpJ+n9qmyOH3LQn4822DGRq0ouxdYn?=
 =?us-ascii?q?3UVjoOdadXqXhwggtY6wHHE3I5cKMm3u6TW6+R2u/6Eh5sIOHA/AksOpLAES?=
 =?us-ascii?q?HsGbiHjPpo+gSg3NgpT6S0xlgFdtmZ6jkJh/5k9y8mMQ6o4d98/ifzbkE54U?=
 =?us-ascii?q?0OrBpphSnk7AYFzdMkK1wAZrqo+SiBHJzTc8RY3K+jfkUac2vIcwYXF7aALF?=
 =?us-ascii?q?qEZdVJDa7s2/dxyH3rIoYjGysWaTkB5XL5eW7YLPHP+fGDU5Ky6e+nn1g6F4?=
 =?us-ascii?q?a81umr+o1iD7IIqPKYeIjOKRJoLqrPM0HnWfGYrr/W17eAlxZ6ceAUZVtT3J?=
 =?us-ascii?q?ci3mIYrVamXnsVtyGYV5ETbk/9CpJQYIsMtYR5K4Sjt+yqVdHffgRMPrZX3w?=
 =?us-ascii?q?0Vismhw0X2LdOn3p9AtgkMRx3MTgPqiVurKTJyglZMVVrGDhYfht/+jQNXFt?=
 =?us-ascii?q?ikkiKQCkCGUaMCzwphLCYwj5Jvd3KTdH2a/WqHvLFkaKY/cbFFUaQbXUEVKY?=
 =?us-ascii?q?zHQR9sNTst7B+UfKTSaaeqw36XIIBUksATis4paqRbl3JMXTC4n/4bn1vxks?=
 =?us-ascii?q?glRXiuyRXReOHr+JQj4nhU7NLp48jdHJlhugXdv77+XOoigq6DpSp3xz+lXH?=
 =?us-ascii?q?dHXjZwLiSjVDMUqpTIjQEFkVJUHy/ZyU31LClPB7zUBue5oWq46nuZn2uTcp?=
 =?us-ascii?q?gDJeXFQIpX0WqSJMFXpj5qxPqlKFWnBGIA5ngGGPQPCBtZ8v+hoU4B1mdeGr?=
 =?us-ascii?q?z8BjsIGe88SMLhCblMHE764TYbMAbO/+/OMGTR7bq6kd5bkbMcBayYWlrnD1?=
 =?us-ascii?q?Mry3zO9mWtNW3qkQgoq7FF6bUtkzXtn+ohML6d7/wEJQHSPxHXQYUefyvCGE?=
 =?us-ascii?q?6JvNIrnxwjaQZOF56JOSAKxLDzLN4zxX1q8oyyhlDFUI23GQVZ7DgNfEO6An?=
 =?us-ascii?q?hJMaiuBGF1Auw4/3s00gxyVLM40DGPGpiYQGsXtL8gvkjC0gORR8Debvw6hL?=
 =?us-ascii?q?bj2bTsa7iB1kgyO6x88cFhvT2ttwZkWZlDeCLfHDxWrg/jTfO0t9tvgrhLeg?=
 =?us-ascii?q?jQH6GtvWUjmqhFiwSxFIAw3GQSMRZI/ytviY+xIALdBujk4EBZW2IfI45qNE?=
 =?us-ascii?q?dHcUZEoT0VsdEu0eqDVJV8mlBoeFHRBUeMfvWyRZFKnGyxHt/mQ?=
X-IronPort-AV: E=Sophos;i="5.92,281,1650945600"; 
   d="scan'208";a="76050321"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJ0e8pKS7CfV0WnGZ8KR7HYvyn2eOjKlDXXM557iWyTqwxAwN6LjpLbZOBFiqgwCnD/9qa7x4qgel87dOzrPc51736vOoIp5FznVmNk+cb+Vzg5MHlI/MHWmQp5yvFvPQ6I0OSYNij9BnBNaELu6wDt+hpuguyIuPXytlE7KcL5lujyBi8X8Uhbf9hM9RIBGbbtxna38WdVsEcS4ltxS1ObyoPhQX80mW7/rZa3pLDiVcw/ua7ay1XWKw44VhOGM9Hulrpvg+YsHx0U7co7HWjVZe8+go0MvdIDs+433TPay50j4WrapfWy1r1EVmP+6sOPyPTQkGL7ZCnmuv7WfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeR1xM9clxPThvwIwRFyrGWtoRsfan4gQ1Xe+sIld+s=;
 b=OcEnG+eWXHgIIE5byKbHNnImUet6ynYyfuh+vfNwYF84hkLi2eHKivWW63FNCFcd0F7TFnUfTATXjVofOoviwxhueNUpm1MJ1fuvCuwD+zOJML9O34EW0S/34N9XEiabShHZ86XwHQHglOFzGclyT15ph7Hv40kGjlhowTMKYMkip8UgLYUmMEuouGWS6WdmwF57Bx7R4JGzpc9Wytkdz4XOiavBZa4qtrdeUG8G9dNnmxiDDwvmyJI9/5R5xg4xPGjEHaIFI3CvVgtRoYhiz4zwLDAMmRjf3p8e+hqg1KrQ/faElHD1p9K6kMO7iW5Iq4VHA9/dL9ym5J9a3I/8sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeR1xM9clxPThvwIwRFyrGWtoRsfan4gQ1Xe+sIld+s=;
 b=utGzCWOwovae0guIKw+nyIL/KyK+AaW0kww74H/i6TNTQZksHQyV9mfvQJLG3sx5pv+cXPptawTj8sIhWiC8FOEgt+nP5qJp/zbyPWHC5yS72VYbLc41t3HuHlF5XRv2yfFbIYdy9qK1vkqFOTELHhw7/niD5EyXjStSorxv53w=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Charles
 Arnold <CARNOLD@suse.com>
Subject: Re: [PATCH] x86: deal with gcc12 release build issues
Thread-Topic: [PATCH] x86: deal with gcc12 release build issues
Thread-Index: AQHYl1bWGTbUX0llkEufEOvvIzdFiq2EU0cA
Date: Mon, 18 Jul 2022 16:11:05 +0000
Message-ID: <25b0dbef-8823-2a6f-7697-6bda89f3ec67@citrix.com>
References: <2c3f0ca0-94c2-6462-f4eb-a2ac54c09554@suse.com>
In-Reply-To: <2c3f0ca0-94c2-6462-f4eb-a2ac54c09554@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc8211e3-f626-4d1b-95c5-08da68d81e01
x-ms-traffictypediagnostic: SA2PR03MB5803:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sYEQ0jYsQ3hZh1FDOZaTaIg8urdZb+GjRNIfyUyZXvS4sw+Kc+OCRiiL6LFcH6dB1dWIRaV4JmH9YEbbSrXi+Z4ilVj8vqU5nM86gYipa1leoKrq5SO3Cv7EMoOj4u3XCIYpKqi0ILjJt3bQROeU+vxn/8r+kop2AwlSwvMKZbrYWk29O2+RhZgcsIQBOKnxfdyYco/D/HpY138Tu2ZlthcYk04dmqdTMsi9MtAzYW9TQJrbVXUUu7GLnD9Qw55cQvvbkgZ+M083SDpCNUZMnLysZgEbW5Pvn0fPkmHaJsIxdxaPmOh8UACwRfGetqBoaQtpa4TWKymsCyHwIUBV9Ws06MPT44Y24HLrF0OuP65CPamGR8+Q33qsIKH8O77Kgm1w7rLP7XjHkCdI+MCqJApeqHGCPV6wsxvtNAdGeMy6pPRU+I4O8dyFSif9H5Ve3kn/EssdT4Am78Io6iQ4chYVgHlQSQGlZGB98jtZEX49EwTellPGi8tKttnHCssK0B/BVAC+QDgbiZGEV4F0M03RHpK7ShIHDMH7lC0usrgR+0RAYk5JmSG/74XEHGU+hPitJhiXLEhSQ/zANC2KM+eDc2/XWSn83O5Tfnn+3k+nI4fceWQIt82RUA/0jRI/TrjhaXI5R1lLFMMzfLMTfRLMU5G/9rhiGSr1M/P4gaUKr20YsdfGHOn9BeTxF0aUkMOqikRFS1IXoBjkpLbL1zzy9PhOfXrt2CnbRDGTQZ/ALB0wHZ6/P2k0jyP6UHIGxvKVftIDFXQN++vlKVMdQJXUP0zYlXXPxMvlWYe/8pbQmSguF3RUSPbQ7dGgmSh9WbatjqYszMr/ZIiHSA1Vf2InOuuJV7PtZ4gwf7FIu6m7frFrfIJNWnnXNK43HCXB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(478600001)(6486002)(41300700001)(31696002)(6506007)(86362001)(38070700005)(54906003)(82960400001)(316002)(31686004)(122000001)(186003)(2616005)(26005)(6512007)(110136005)(53546011)(71200400001)(66446008)(4326008)(76116006)(38100700002)(64756008)(91956017)(66946007)(5660300002)(8936002)(8676002)(66476007)(66556008)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2hqMnc2SXlqZHUxNzY3MG1peWlnUkdWWGE5elFGSEVaTDdsTXJKZjBjNkpH?=
 =?utf-8?B?Si9zcU1FaFFGVGZRSjRKTDE2K2NCV3Zqa1Y2M3JpVEdLNlFtbXhlMzh5Y2NR?=
 =?utf-8?B?NUFMRG9lTStOcThrNkl6VVVoWXptYVRPQTdIeG9hRUVVN1F5VUQ0SzZXT0tB?=
 =?utf-8?B?NXlWL1RiNjFFR2RjNjQ1Y1FwRWR5dDQ5Mnc3cHg5OWI0ci8yNDZiVHZ3aEVn?=
 =?utf-8?B?R2hyYmlJOVlSMGo3OVpjRUhPYlFCbzhuQ0c2bXpUL3ZXRGRNdGhSOXUwMU9Z?=
 =?utf-8?B?b0FJSDZwTU1xeVdUaCtTbXdEd0hnZ1p6MjIvdTVsZjZlRGRxdDg4ckJCWkFD?=
 =?utf-8?B?L3hxN0F1bXB0bTFsVlFpaVhEeUxUOWxpcS9MRW91dXRpd1JVUmtmYlhhZk1E?=
 =?utf-8?B?Qnk5NUNlN3llQUp5cG1CK3hSSHlOdlg3ZVdHYjhyZkgxYzZaRmV5VnFNbjFM?=
 =?utf-8?B?Y1Vhd29TWHhKdUwyVE1rV0dlWXlNZTNJaEtTY0J0bEt4N2tGQXJCRHZiWitE?=
 =?utf-8?B?YWFlRDNYL0RrT1NXYmMvcnpQcy8zd3VSZW5obzg5VFNZWVlCbWNRUVgranpE?=
 =?utf-8?B?TGdNYnJUU0FhSXVVUFR5dkdvem5jU0NoUUt2UmJkWFlTaFVITHZrQTBGajht?=
 =?utf-8?B?azJtWE5EZWMzWFpLQjQwdDNidkV4czlZangzY001UU1zQmNKSys0SStBb3k2?=
 =?utf-8?B?OU9Ha1JyWG9nZkhzeExHV28xakp0L0diZ0dBWHFxVFZ1amZZUmlMUDA5Wnpp?=
 =?utf-8?B?cTZZNmdTRE5HYWN1UmRmeElYcUVyZkVZUHV1QWxma21FN2w1TnVpWTdlQWtq?=
 =?utf-8?B?MXFEOGRTajBERENzZ2VDSVcyN1lRWjM5VUxhbncwbjVVZTU0YmthejZmZTN5?=
 =?utf-8?B?UzRmMWxuYktuMmtWRzhTbE5uaFpPVU1XcEIzRmpHN25SazdPUk9pSFNpV0lU?=
 =?utf-8?B?S2hZQVRHNkdteTNYVjFhWjJQUW1kczY1bXpRQm5RMEd2dDZhMkNIS3JHTzR6?=
 =?utf-8?B?Q0tKa3lMY3RDcTdkN2NMOS9CRUk4UE1xVHE5MXFndHpNMmtmbzI4czdUa3VP?=
 =?utf-8?B?L0gzcm9pSURWeVQrbE5mUDlWUktaNVZoZTBER3pESVVDallWcG92a3VpeFlD?=
 =?utf-8?B?TDNDcVlITGs4b2NhS0FQdm9JZUJySWFtSjBUUVJjejVMOWhiY3FPaTZYNWlY?=
 =?utf-8?B?ZHRjL1hzc2lxdGNJaVBPVS9MYy9SMnZhakdEZzAzbmtSb3A3TEJLSGpIM0Y4?=
 =?utf-8?B?MU8vU29oNTVDU1ZBU2VWc2xCdDg3ZThkM3hQZWsyYVRFc0g3THdVbkFBK09K?=
 =?utf-8?B?QUZmMi85dXdPRFlOYWFTLzVLUXQyaWVycW9UQmJlY3VDWjNMeTBkQW4ydWtS?=
 =?utf-8?B?S1JMdVMvVHc5NVBMSy82aHNCYlQ1UnRMeFZFNzhjT3pKUWh1R1VlZU81SXZL?=
 =?utf-8?B?RFVuZHpKVy9iVXpZdU5CT3gweXU1dFZmV0dkSGs5eVVYZWZmVmVESkt0blRB?=
 =?utf-8?B?V0NPMW5lOXg2YSt4N2tjQUF3Z1ZBQUVzQmJDVnhHZC9FeGVBL29ONmRxOVQy?=
 =?utf-8?B?TjZRN3VIM1dsSitkMWV5bHRKcWk4TjVXVXF1SUJMZnN2aUtURm9DODRkd0t1?=
 =?utf-8?B?T0JSaDkzb1FhamlZdzA2aFpJLzZDQU5RZTFLbFc2T1Npa2xRazQ4Sk45cVZJ?=
 =?utf-8?B?aUhZUk1BbnY2eDVGQy9td2ZyVExKV3lDSHpBWXc0a0NDS1ZLQ25FSzFhTkwx?=
 =?utf-8?B?NDJnMGZUaVBrUHMxdFhVMGNDQ1RFdWVtNDVjWmgrT1VCMXlOdG1md2RBSjF4?=
 =?utf-8?B?MHZhbkJVMitwakpoWGVMd01JZHFmMFZJbmdGVUZoQ2NJT3lJYVVob3Y2dndQ?=
 =?utf-8?B?Mk0yb0hkYmphTGZ1YWxwc3lGL1lGaXpoNFFVQ3dmQ3c5Wks1UGZZSENQWHRK?=
 =?utf-8?B?clVSRmxmajdrWGV5V29iUVdwZUxwV3psQi9vMHdrcmVEZzMvL2R5UkxNU3Y3?=
 =?utf-8?B?czI1dk5YSnFGWXAyQ0JUM1JUbUZsQ2tzREt5OU1kM0d5KzV4azJBeEZ4N0VV?=
 =?utf-8?B?TjZKNWJoRWdmdHliMGZuWExPQW9iN1JPNUwzRUNyUUFVS1JKOWhvbkIwZ2JV?=
 =?utf-8?B?dE0rbDBIVXU5Z3A3SktrdWNoNGM2NWhuNFQvSUk4OHZSbGlDRXZvYysycHFl?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4D5937D0FFA23479F5AC7BDDC3971EF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8211e3-f626-4d1b-95c5-08da68d81e01
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 16:11:05.1522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iOg6kfnd1Va32FQe3MkHO/zRXdtP9bvE3sgBPgWz6zhq2SXArTwkrZAHPEX0zXmHt5M7AGtTc0E1Z4l2ujULOIBf4wYooZ61PTfgb9C3C10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5803

T24gMTQvMDcvMjAyMiAwODo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdoaWxlIGEgbnVtYmVy
IG9mIGlzc3VlcyB3ZSBwcmV2aW91c2x5IGhhZCB3aXRoIHByZS1yZWxlYXNlIGdjYzEyIHdlcmUN
Cj4gZml4ZWQgaW4gdGhlIGZpbmFsIHJlbGVhc2UsIHdlIGNvbnRpbnVlIHRvIGhhdmUgb25lIGlz
c3VlICh3aXRoIG11bHRpcGxlDQo+IGluc3RhbmNlcykgd2hlbiBkb2luZyByZWxlYXNlIGJ1aWxk
cyAoaS5lLiBhdCBoaWdoZXIgb3B0aW1pemF0aW9uDQo+IGxldmVscyk6IFRoZSBjb21waWxlciB0
YWtlcyBpc3N1ZSB3aXRoIHN1YnRyYWN0aW5nIChhbHdheXMgMSBpbiBvdXINCj4gY2FzZSkgZnJv
bSBhcnRpZmljYWwgbGFiZWxzIChleHByZXNzZWQgYXMgYXJyYXkpIG1hcmtpbmcgdGhlIGVuZCBv
Zg0KPiBjZXJ0YWluIHJlZ2lvbnMuIFRoaXMgaXNuJ3QgYW4gdW5yZWFzb25hYmxlIHBvc2l0aW9u
IHRvIHRha2UuIFNpbXBseQ0KPiBoaWRlIHRoZSAiYXJyYXktbmVzcyIgYnkgY2FzdGluZyB0byBh
biBpbnRlZ2VyIHR5cGUuIFRvIGtlZXAgdGhpbmdzDQo+IGxvb2tpbmcgY29uc2lzdGVudGx5LCBh
cHBseSB0aGUgc2FtZSBjYXN0IGFsc28gb24gdGhlIHJlc3BlY3RpdmUNCj4gZXhwcmVzc2lvbnMg
ZGVhbGluZyB3aXRoIHRoZSBzdGFydGluZyBhZGRyZXNzZXMuIChOb3RlIGhvdw0KPiBlZmlfYXJj
aF9tZW1vcnlfc2V0dXAoKSdzIGwyX3RhYmxlX29mZnNldCgpIGludm9jYXRpb25zIGF2b2lkIGEg
c2ltaWxhcg0KPiBpc3N1ZSBieSBhbHJlYWR5IGhhdmluZyB0aGUgbmVjZXNzYXJ5IGNhc3RzLikg
SW4gaXNfeGVuX2ZpeGVkX21mbigpDQo+IGZ1cnRoZXIgc3dpdGNoIGZyb20gX19wYSgpIHRvIHZp
cnRfdG9fbWFkZHIoKSB0byBiZXR0ZXIgbWF0Y2ggdGhlIGxlZnQNCj4gc2lkZXMgb2YgdGhlIDw9
IG9wZXJhdG9ycy4NCj4NCj4gUmVwb3J0ZWQtYnk6IENoYXJsZXMgQXJub2xkIDxjYXJub2xkQHN1
c2UuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IC0tLQ0KPiBJbml0aWFsbHkgSSBoYWQgY29uc2lkZXJlZCBpbnRyb2R1Y2luZyBzb21ldGhp
bmcgbGlrZSBFTkRfTUlOVVNfMSgpLCBidXQNCj4gaW4gdGhlIGVuZCBJIGRpZCBjb25zaWRlciB0
aGlzIHVnbGllciB0aGFuIGV4cGxpY2l0bHkgZGVhbGluZyB3aXRoIHRoZQ0KPiB0d28gaW5zdGFu
Y2VzIHdlIGhhdmUuDQoNClllYWgsIEkgcHJlZmVyIHRoaXMgZm9ybS4NCg0KQWNrZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

