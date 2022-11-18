Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2993E62FB86
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 18:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445867.701294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow54r-0002VY-Gd; Fri, 18 Nov 2022 17:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445867.701294; Fri, 18 Nov 2022 17:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow54r-0002TT-DD; Fri, 18 Nov 2022 17:22:57 +0000
Received: by outflank-mailman (input) for mailman id 445867;
 Fri, 18 Nov 2022 17:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DmIt=3S=citrix.com=prvs=314707d18=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ow54q-0002TN-0j
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 17:22:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a23f172f-6765-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 18:22:54 +0100 (CET)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 12:22:43 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SJ0PR03MB5599.namprd03.prod.outlook.com (2603:10b6:a03:285::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 17:22:39 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 17:22:39 +0000
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
X-Inumbo-ID: a23f172f-6765-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668792174;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=04wH1a30RvapAXQXfQDg7ThxeQ1mtCu6FAVdTnYjwF4=;
  b=Lwe3MU1ky1aLYnAasdV8sA8RV2pdLJ286T+Gc14pg5v4dzkN0DJDSPCO
   kT5JiNoFBiaf3ZK18p5brFooDY/F3jL6O6X9Fnl/9aoN4LfrhbmgDYsuR
   E4VtizS2hb6YcjrvHJFF1qhMvouPqYI5v87iJMLeY9YMVA/uh4UHrFh5y
   Q=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 84191593
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NhSH+aqonbbLG7rAadk/QM9XqAheBmLTZBIvgKrLsJaIsI4StFCzt
 garIBnQPKmKajH1ftB1Ptjg8EIPvJfXndM2TlZsqClnQysRpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzilNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAG8QTh/dt/n1+Y2mb/V3qJpgFdLbLqpK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKPEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXoqqc72QDCnQT/DjUdewedrcGQunSYfI1bG
 UcX6BE0rKU9oRnDot7VGkfQTGS/lj4RXcBBVdIz7g6lw7DRpQ2eAwAsQiZabd06tOc/XTEwy
 kKShNTtGCBut7uOD3ma89+8rzq0NTIEMGwqaioNTA9D6N7myKkjgxSKQtt9HaqditzuBSq20
 z2MtDI5hbgYkYgMzarTwLzcqzelp5yMSxFv4AzSBzqh9lkgPNTjYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr323FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:c65wXapir/UAssoqLdvDCZEaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.96,175,1665460800"; 
   d="scan'208";a="84191593"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fk6vpPo9g+oH6S0Na4ntZv/U5WVKlJ9t+5BULH5mOKWXfmFaTiuywWLdyzK+4zL1+1WwM2VworAmx4ImkYktDide9lDc+q+KY0n6ESe5Kp+Ir3tzuEXjEVa14igifPITkeufuHyk4sY8PUfpWyEwRo2bD1pmBs5209W7RlINsQ+vzql5AJ3CZS4/PAi2FkCUjp0htXcb68XJ/bg8iBlSDILLiUzQ0IpOjX3NX4Z+CwQFC+nP+hQmkT+gOHwFrgnOrkeknAovwzQI+q2x1RWlG8w0THcxmrlTGtGSHF9gvkRw9WpcOrxsYbEviOs9Bz98iD90hmWm+OUokXigMFL/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04wH1a30RvapAXQXfQDg7ThxeQ1mtCu6FAVdTnYjwF4=;
 b=aDyxIZLOXZHSjESy0XakXCXvsdU88SaaB/wAF+k8PFj1KqVlVUl3m68fWGURkif5WnmhjzbMyY15aB4I8c05TD0qNGG/ww8ZhQH0jJDmHHu6AoxOqV2L9sf9Tm2sTX8X6j9TAsEIInGgtzI7wLQCNvnstxS2LHb0Dv+JqVivnugoBG7qjh+wFhzKuaiFzeh2W2RnDYCZa8iCdfQIJX1iIjIipHsQSN5nCJmlDkp/8FCZ2spGa4/CdI9C7B3lk8ZP+w/rTZrRTiftrzrs73hXHPAXR/cKAsd5iMd2F/aco6oLTesHNA+DkYQpiOHDaR+Yg0iNz+3Ry56/jU+P/PyAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04wH1a30RvapAXQXfQDg7ThxeQ1mtCu6FAVdTnYjwF4=;
 b=jwzQewtpBt5O+i5BGg2rh/kLDb8jbkn2+FFwWskmxb0lMeFKjNPdeCIyiMGfnf7Ac79VqolHdn58SmiWM7lXD6gp2K/JK0gjBnY8O+NTdcbSel6VDoicKBppB1dtyPVpMhYMbxWBEub140TyMMOR9yNmr3/3ptrFqIXQENFFtSk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
	Anthony Perard <anthony.perard@citrix.com>, Daniel Smith
	<dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Flask vs paging mempool - Was: [xen-unstable test] 174809:
 regressions - trouble: broken/fail/pass
Thread-Topic: Flask vs paging mempool - Was: [xen-unstable test] 174809:
 regressions - trouble: broken/fail/pass
Thread-Index: AQHY+zeiYojqAeFzxUaCyzIpzopUAa5EwM6AgAAteAA=
Date: Fri, 18 Nov 2022 17:22:39 +0000
Message-ID: <6846bb37-345e-ca3d-4cad-2032c4852e15@citrix.com>
References: <osstest-174809-mainreport@xen.org>
 <Y3eZOcmOYkNLdeGe@Air-de-Roger>
In-Reply-To: <Y3eZOcmOYkNLdeGe@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|SJ0PR03MB5599:EE_
x-ms-office365-filtering-correlation-id: bd74d6e2-a54d-4461-748c-08dac9897e29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 M6sU+n7sSdorKuH2TqPuYiWEzUjVyLT47aAvnb+Dbu+KzFhi5fYWIlbSl6q2XUC8yA5TZtIVzI465FIlioU1o1azsBJgkB14wCIvM+Gr3O5OOg3Oz4wBOjndyv3GaDjNoXvQma+TANvEluMrz2rJ208CIhg6oIs8MF5loW6qPkuMCd/FjMxm0ll5SpXUinWPm46Je3P763LuLASbnm6jtKwTS7ZS7IYRJ7jQQDmbedUuWI1Hrnq/z7TxBEHdo7IS7NnDES5otx4fYgQP7+OsbZjh4PAIq/jbiipEaNRH4vO7nSI/3M62lpO0q39JjL+ClhrrHotaEQw7AdW3ZwTv/3J6RkUhI0Jqnba4JhRJcgFC+Mm1G3BmDLnhc3WjN2+PU1w1Mrmj0lRjNOr7xdVW+kCBQgf1XX9/j8D7yRCRXlo1b3afLJYyWK+AA436CxbNVtc4acJ3ZDU5990ayF1pdmr+3BnxqLcx0zeM7dhlECU79crocTYk/OV3Yn/9SwHhyjYpsk17nG89pjSkKFso+1xUHPWUB3Kuk8IygD95e6JJda+S9GtpVUKO11o7g5ae0l9UwBzD9eNVXkjyoSUYx0IhIFsk1lT216jXEMbpey2m+iL08TYuGXNzex6AisnH9tvRrmYWrLktZ0naht24edbuANhDDtywa3EO2Won4AOAvwJCaFNPszV3RNXPMEDwzE4pJGms1QXFWJBIjkP2WI+mH1rp0troR9yZtara2Wxl8u3IyveDX4inwLPdCCzUV60Q3LIkL46hP41tsfRgJQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(36756003)(31696002)(86362001)(122000001)(38070700005)(38100700002)(82960400001)(6506007)(31686004)(110136005)(53546011)(316002)(6486002)(478600001)(71200400001)(5660300002)(186003)(2616005)(8936002)(83380400001)(2906002)(26005)(6512007)(91956017)(66446008)(41300700001)(8676002)(64756008)(4326008)(76116006)(66476007)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3N5c01IL1AxWkdMMm1vTkhLWUtEZnBsakhuV2h2VmNyNUhmcVdaRlpaaUw0?=
 =?utf-8?B?S3dIT2RjTmUvSk5nV3oyMVBwUXJCR3A3L3lISGsvVmpIb0IxNUdNQ2N2VDZi?=
 =?utf-8?B?NjBveitvVlB5TU9wOHRHejZyZTlheXdQNDVQNi9ZeHJkWnh4RWdFTURYMisv?=
 =?utf-8?B?OFFyNFZSTnN4K2UzV3pPMlJENjh5ZVQyaXNhR3F0TlRoK0Q0ZXlDUTIzNTZL?=
 =?utf-8?B?aHRySnZ0V0RmNmhEWWhJYVA5MTEyMVlYVDVUbzNXampINlAxaDE4a3VSQkp2?=
 =?utf-8?B?b1h6V2txamwyOXhxc1V4MkpRRGt2dGtYcUxnV3lHckl3OVBRVjdDMFFNeS9l?=
 =?utf-8?B?dTBoMytxNG9kUHowKytUakV0KzRkc0sxNFcrSDZWSXE4eEVwbkpuOThnVXR4?=
 =?utf-8?B?eXBQT0gwQi8zYnFhQlVUK0kvZzJkRG5BdHhsaFlWUWZFQXRLVVVxWkJJVTli?=
 =?utf-8?B?T3JIOEsxVXVDOFJQdVcvbTQ5TG5BdTBRRkt3ejNzRzBXeTVHYlhIMlVicmFx?=
 =?utf-8?B?aUxpTXh4WEw1UmtuUnFZalc0VHJ6bDFDdjVnempsdzFlVkYzbkZQODB6K3hw?=
 =?utf-8?B?MzFHN0VweDhNajRYUHZlVmpyZzgrSTl1aHAzQk1hOFhWRy9sa3Zic3pJK2hJ?=
 =?utf-8?B?WjZlTHBaZ0RrTEhsNVIrODBZV2JwektpeCtBRHcwYUxUd0JwYjJIWlYzTGRs?=
 =?utf-8?B?SzFIalBRSG1CMURvUEVaa3EyRE11REUxWHptL3FvV3FEdkhWSFFsYmFCc1F0?=
 =?utf-8?B?ZmdaNWVCRVpidEUyblZuQ1ZMM0I3b0NRWnR3RjVxR1F4NUtiZkhKWlE4eUpr?=
 =?utf-8?B?am9sNTBXY1E0YUI2dHFJU01HR1F3RTJQRnlzREdJUjVEbVJmNGFsVW5ZazI4?=
 =?utf-8?B?YW92RDJaMTl1a1lJNDZ2NVRORDljcWlFQkEwekJsUkxkaUlVVHhjRlZINEFF?=
 =?utf-8?B?WG4xYzdVTkJ0RUZETGc2V3lpMWJYRVU1VHk4WGdqTkpNdUJVM24vRUcyRm9s?=
 =?utf-8?B?M2lPSkZVLzBmTUEwZWwxNFpEblVLMERtdmc3eGdxdTJ3bkFrbUJqdEFhUUgr?=
 =?utf-8?B?cGxJdkRKWTdoQmdTWm8rd1NHWUVXZ2VQVFBBd0wraEZsN09ndGRIRnhNREdT?=
 =?utf-8?B?dDMvM2Y5R3o4Zy9JN0l2bVBDS3ZGcGtRQ0orNy85Zy9Ga3FHb25oeVc2ZW00?=
 =?utf-8?B?Z2h2TXJLVUsvWGpPcWFUcytJMHA2VHljak1BR0w0TWFYQlNnZnk1R2h4eG9P?=
 =?utf-8?B?Rm9SSWxFTDY3aDhCVCtFTmpMQjRVZit5MzRlQnpIdyt4RTNPZlhYZkFDTGVj?=
 =?utf-8?B?cHB2VUdnY05jQS9aL01uTHVhamlVYUYvUllSUlBVVkViVExRdDVya1I5TEJ3?=
 =?utf-8?B?NThpWnYrWmI4K1hDNkxCNVFWWTlSUmh3dUlEaGFSUVpsNUtWN2xDdTN4QWNW?=
 =?utf-8?B?NGxHTjhoSTJYUzBkQWFaUDI4OE5waWhnY0pLRS9KOVljUGxSM2w4VDRMaDZS?=
 =?utf-8?B?Q3o5N2pqZzF3enpaRFpKN2x4RkhiSExLbS9YdzdQaTJpdDhQUmxDN1JSM2VE?=
 =?utf-8?B?ZGI0MkI4aG13VXFsUkZBdFlYZHo2ek5JWk9tKzBJUHZvWEhJck9DSkF4VnMz?=
 =?utf-8?B?ZytmYkNpeWhWZVRSa2pBY09yQnhpa2MrSlR4L2xxVTV5b2hjTlp2bCtwaEVE?=
 =?utf-8?B?RGFac1NNbGdwVmZET3F6UmJMVlpUNXFmVVJnS3VLeVZRd2kvZ3E5Z0NiMUVw?=
 =?utf-8?B?ZGl0WUxwYThIQjRGMWozL0w1VUgzZUVkdk9jRG5tZDF2ZGhvU2N6di93d1Ja?=
 =?utf-8?B?SXlyUkZFUE5HSEFaWXA2Z1dJdjIrb2RWZWI5ZmFjTndJem1sU1B0aEtsZGZK?=
 =?utf-8?B?Sjk3Y1crK3BrR2ordzVzNG1uNmdWdWlOcmQxelhNaGFUSUlLSDdvVTFsWHJZ?=
 =?utf-8?B?YjllcmZmVDBDTTRzMkdvYVA0LzhXWksxajZscFdqazlGeEpveGpPQUlXRkE2?=
 =?utf-8?B?ckdQMFByVHRDZWgzZWtKdk1GK1lzYStKZkR1WlJyUFZIWTlSaklvbGQ1MUhC?=
 =?utf-8?B?Y2JiN3BzYlVES21YTGxhQ2Uzb1NzMFNlclYwWFRnSTczaFduVDRhSzBMckJT?=
 =?utf-8?Q?atKP0om8zXT6aDQJ8P0pNYUto?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8087D0D3E4A9D4B925C0443C0183121@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oVkVI8gNhmsjq0HywBK0eR75G+/FS9QAXJyoT3CSlIQ/CLPauJNyLrrSYm57R4J0povJNXycxHtn/3sOZmaYvUN8IuaCaWAg/jAqo2DLucMrwi61TMQJWv+fSbD2hvxHrFT7YfGDz0zetUXBOQpzyjGB2wbCWn39dgWm2tfll4hfugz3o4/iQD/PH3sAvlgHDUTB8V8iNM3fewKvw/t5DkuyuhhRApnzO/rgBuNEBsVvqlnnRSDgyKjq7Sx/A/dPgKYXw+0IWVrj3kVl8DdCNJAWsQInxvP+G2DuJdcUkkXc2ZRJ8ReVbSB7JyP4Gm84yHT+iNLijY3L3wEhD+4dcJuKQ84gKOORc8/WKSTtujmZ9BgTsJIh3f89cacgCfBJIUS05qgyqm9qLr1ZjRjCOBL0FZzmAl8RIvj2nWEv8wzNNO+8ccyf94mogU8wsLOCSobL31AbTiSwYoMubvVBg1TL4A83o7ZRTrhtq/XH75+lzptz9kYiSZJg6TxVEq9EX9uJHU/euwQQNU5ltprLOMqNDk9OctPW+kw6HC5JsvNFqCQAMFJL3imyeittj9uyAuAMGDIPfNTNOfCfrt8qHYhKzOQCYs16CYREIcNIkS0xAO6SiakwFslYZSssizaEPRg2hus4V7ZxfBivpawHKvsVUfaOGjyEo2xYiPgELhCVSZ0RbY/ydbKTOLRgEfGwvG4/eaUuQsCTgDV7XnJbLnpRR3M86wU6Q5J9GRrmY61pzCdyocM/ipehVS4C+/HCVbEIK9Emtk7V81xyiQyyevzxmicMnIFBT8TPEOSM1fetInuPJssaFgaTRovSf/b/2rsJbLUUw3ays3uHkvV7jv1A29dIQynEeonAiZRqVFC/BCuZATERzPoKbrO8tRoM
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd74d6e2-a54d-4461-748c-08dac9897e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 17:22:39.0382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2OSgbsoEC6ChuBBbwjb+qC4wwWSjKVXqpmyri9vO69YhU4OdNriMrSTE5jM0TQuxvp9P+k+HiggMUejEGBXyxlxl1Ly+1D4PSToOCo8W58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5599

T24gMTgvMTEvMjAyMiAxNDozOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBOb3YgMTggMDE6
NTU6MTEuNzUzOTM2IChYRU4pIGFyY2gveDg2L21tL2hhcC9oYXAuYzozMDQ6IGQxIGZhaWxlZCB0
byBhbGxvY2F0ZSBmcm9tIEhBUCBwb29sDQo+IE5vdiAxOCAwMTo1NToxOC42MzM3OTkgKFhFTikg
RmFpbGVkIHRvIHNoYXR0ZXIgZ2ZuIDdlZDM3OiAtMTINCj4gTm92IDE4IDAxOjU1OjE4LjYzMzg2
NiAoWEVOKSBkMXYwIEVQVCB2aW9sYXRpb24gMHgxOWMgKC0teC9ydy0pIGdwYSAweDAwMDAwMDdl
ZDM3M2ExIG1mbiAweDMzZWQzNyB0eXBlIDANCj4gTm92IDE4IDAxOjU1OjE4LjY0NTc5MCAoWEVO
KSBkMXYwIFdhbGtpbmcgRVBUIHRhYmxlcyBmb3IgR0ZOIDdlZDM3Og0KPiBOb3YgMTggMDE6NTU6
MTguNjQ1ODUwIChYRU4pIGQxdjAgIGVwdGUgOWMwMDAwMDQ3ZWJhMzEwNw0KPiBOb3YgMTggMDE6
NTU6MTguNjQ1ODkzIChYRU4pIGQxdjAgIGVwdGUgOWMwMDAwMDMwMDAwMDNmMw0KPiBOb3YgMTgg
MDE6NTU6MTguNjQ1OTM1IChYRU4pIGQxdjAgIC0tLSBHTEEgMHg3ZWQzNzNhMQ0KPiBOb3YgMTgg
MDE6NTU6MTguNjU3NzgzIChYRU4pIGRvbWFpbl9jcmFzaCBjYWxsZWQgZnJvbSBhcmNoL3g4Ni9o
dm0vdm14L3ZteC5jOjM3NTgNCj4gTm92IDE4IDAxOjU1OjE4LjY1Nzg0NCAoWEVOKSBEb21haW4g
MSAodmNwdSMwKSBjcmFzaGVkIG9uIGNwdSM4Og0KPiBOb3YgMTggMDE6NTU6MTguNjY5NzgxIChY
RU4pIC0tLS1bIFhlbi00LjE3LXJjICB4ODZfNjQgIGRlYnVnPXkgIE5vdCB0YWludGVkIF0tLS0t
DQo+IE5vdiAxOCAwMTo1NToxOC42Njk4NDMgKFhFTikgQ1BVOiAgICA4DQo+IE5vdiAxOCAwMTo1
NToxOC42Njk4ODQgKFhFTikgUklQOiAgICAwMDIwOls8MDAwMDAwMDA3ZWQzNzNhMT5dDQo+IE5v
diAxOCAwMTo1NToxOC42ODE3MTEgKFhFTikgUkZMQUdTOiAwMDAwMDAwMDAwMDEwMDAyICAgQ09O
VEVYVDogaHZtIGd1ZXN0IChkMXYwKQ0KPiBOb3YgMTggMDE6NTU6MTguNjgxNzcyIChYRU4pIHJh
eDogMDAwMDAwMDA3ZWQzNzNhMSAgIHJieDogMDAwMDAwMDA3ZWQzNzI2YyAgIHJjeDogMDAwMDAw
MDAwMDAwMDAwMA0KPiBOb3YgMTggMDE6NTU6MTguNjkzNzEzIChYRU4pIHJkeDogMDAwMDAwMDA3
ZWQyZTYxMCAgIHJzaTogMDAwMDAwMDAwMDAwOGUzOCAgIHJkaTogMDAwMDAwMDA3ZWQzNzQ0OA0K
PiBOb3YgMTggMDE6NTU6MTguNjkzNzc1IChYRU4pIHJicDogMDAwMDAwMDAwMWI0MTBhMCAgIHJz
cDogMDAwMDAwMDAwMDMyMDg4MCAgIHI4OiAgMDAwMDAwMDAwMDAwMDAwMA0KPiBOb3YgMTggMDE6
NTU6MTguNzA1NzI1IChYRU4pIHI5OiAgMDAwMDAwMDAwMDAwMDAwMCAgIHIxMDogMDAwMDAwMDAw
MDAwMDAwMCAgIHIxMTogMDAwMDAwMDAwMDAwMDAwMA0KPiBOb3YgMTggMDE6NTU6MTguNzE3NzMz
IChYRU4pIHIxMjogMDAwMDAwMDAwMDAwMDAwMCAgIHIxMzogMDAwMDAwMDAwMDAwMDAwMCAgIHIx
NDogMDAwMDAwMDAwMDAwMDAwMA0KPiBOb3YgMTggMDE6NTU6MTguNzE3Nzk0IChYRU4pIHIxNTog
MDAwMDAwMDAwMDAwMDAwMCAgIGNyMDogMDAwMDAwMDAwMDAwMDAxMSAgIGNyNDogMDAwMDAwMDAw
MDAwMDAwMA0KPiBOb3YgMTggMDE6NTU6MTguNzI5NzEzIChYRU4pIGNyMzogMDAwMDAwMDAwMDQw
MDAwMCAgIGNyMjogMDAwMDAwMDAwMDAwMDAwMA0KPiBOb3YgMTggMDE6NTU6MTguNzI5NzcxIChY
RU4pIGZzYjogMDAwMDAwMDAwMDAwMDAwMCAgIGdzYjogMDAwMDAwMDAwMDAwMDAwMCAgIGdzczog
MDAwMDAwMDAwMDAwMDAwMg0KPiBOb3YgMTggMDE6NTU6MTguNzQxNzExIChYRU4pIGRzOiAwMDI4
ICAgZXM6IDAwMjggICBmczogMDAwMCAgIGdzOiAwMDAwICAgc3M6IDAwMjggICBjczogMDAyMA0K
Pg0KPiBJdCBzZWVtcyB0byBiZSByZWxhdGVkIHRvIHRoZSBwYWdpbmcgcG9vbCBhZGRpbmcgQW5k
cmV3IGFuZCBIZW5yeSBzbw0KPiB0aGF0IGhlIGlzIGF3YXJlLg0KDQpTdW1tYXJ5IG9mIHdoYXQg
SSd2ZSBqdXN0IGdpdmVuIG9uIElSQy9NYXRyaXguDQoNClRoaXMgY3Jhc2ggaXMgY2F1c2VkIGJ5
IHR3byB0aGluZ3MuwqAgRmlyc3QNCg0KwqAgKFhFTikgRkxBU0s6IERlbnlpbmcgdW5rbm93biBk
b21jdGw6IDg2Lg0KDQpiZWNhdXNlIEkgY29tcGxldGVseSBmb3Jnb3QgdG8gd2lyZSB1cCBGbGFz
ayBmb3IgdGhlIG5ldyBoeXBlcmNhbGxzLsKgDQpCdXQgc28gZGlkIHRoZSBvcmlnaW5hbCBYU0Et
NDA5IGZpeCAoYXMgU0VDQ0xBU1NfU0hBRE9XIGlzIGJlaGluZA0KQ09ORklHX1g4NiksIHNvIEkg
ZG9uJ3QgZmVlbCBxdWl0ZSBhcyBiYWQgYWJvdXQgdGhpcy4NCg0KQW5kIHNlY29uZCBiZWNhdXNl
IGxpYnhsIGlnbm9yZXMgdGhlIGVycm9yIGl0IGdldHMgYmFjaywgYW5kIGJsaW5kbHkNCmNvbnRp
bnVlcyBvbndhcmQuwqAgQW50aG9ueSBoYXMgcG9zdGVkICJsaWJzL2xpZ2h0OiBQcm9wYWdhdGUN
CmxpYnhsX19hcmNoX2RvbWFpbl9jcmVhdGUoKSByZXR1cm4gY29kZSIgdG8gZml4IHRoZSBsaWJ4
bCBoYWxmIG9mIHRoZQ0KYnVnLCBhbmQgSSBwb3N0ZWQgYSBzZWNvbmQgbGlieGwgYnVnZml4IHRv
IGZpeCBhbiBlcnJvciBtZXNzYWdlLsKgIEJvdGgNCmFyZSB2ZXJ5IHNpbXBsZS4NCg0KDQpGb3Ig
Rmxhc2ssIHdlIG5lZWQgbmV3IGFjY2VzcyB2ZWN0b3JzIGJlY2F1c2UgdGhpcyBpcyBhIGNvbW1v
bg0KaHlwZXJjYWxsLCBidXQgSSdtIHVuc3VyZSBob3cgdG8gaW50ZXJsaW5rIGl0IHdpdGggeDg2
J3Mgc2hhZG93DQpjb250cm9sLsKgIFRoaXMgd2lsbCByZXF1aXJlIGEgYml0IG9mIHBvbmRlcmlu
ZywgYnV0IGl0IGlzIHByb2JhYmx5DQplYXNpZXIgdG8ganVzdCBsZWF2ZSB0aGVtIHVubGlua2Vk
Lg0KDQoNCkZsYXNrIGlzIGxpc3RlZCBhcyBleHBlcmltZW50YWwgd2hpY2ggbWVhbnMgaXQgZG9l
c24ndCB0ZWNobmljYWxseQ0KbWF0dGVyIGlmIHdlIGJyZWFrIGl0LCBidXQgaXQgaXMgdXNlZCBi
eSBPcGVuWFQgc28gbm90IGZpeGluZyBpdCBmb3INCjQuMTcgd291bGQgYmUgcmF0aGVyIHJ1ZGUu
DQoNCn5BbmRyZXcNCg==

