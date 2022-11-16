Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A40662C1B3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 16:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444323.699402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovJta-0001hJ-UF; Wed, 16 Nov 2022 15:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444323.699402; Wed, 16 Nov 2022 15:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovJta-0001en-RJ; Wed, 16 Nov 2022 15:00:10 +0000
Received: by outflank-mailman (input) for mailman id 444323;
 Wed, 16 Nov 2022 15:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCFo=3Q=citrix.com=prvs=3126b6494=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovJtY-0001eh-Do
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 15:00:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59acc602-65bf-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 16:00:05 +0100 (CET)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 10:00:02 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SJ0PR03MB6551.namprd03.prod.outlook.com (2603:10b6:a03:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 15:00:00 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 14:59:59 +0000
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
X-Inumbo-ID: 59acc602-65bf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668610805;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FvknJ0yAruidXDMf8KU8J9heSHlajwBLWf4Q6KG4qyA=;
  b=FevAxHH2Z2isTcXBcb8Sc6T5kAQyg9EkKh60gIXjLHF7Rh7/N2zmud8M
   yeZ8i4CpHQ8yE8FXE29VasTykvwa3qnqdx2FTboou+ebF7eGZW2UFw7Wx
   VaeKBW+PQL+uR65EH+OvBa6c6y0ERk8F7MBv1pPZTV/AWTFm3X8KiWMzd
   Q=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 84946054
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UsTdOqKAqJGD8HnyFE+RN5QlxSXFcZb7ZxGr2PjKsXjdYENShmACz
 2UaCDjSOKuIYmHxfI11PNiy9h5VvJaBnIc2GwJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wVgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5XWGdq0
 MIoNAoBb02Z3MKQ0vGfZ9Zz05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzX+qBNxKSeHQGvhCiQO85EsDJSMsdEaaoameyV+seOpiE
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMinN87Q3otz
 FDht8jyGTVlvbmRSHSc3rSZtzW/PW4SN2BqTS0ZSQoI5fHzrYd1iQjAJv5hGqOoitz+GRnr3
 iuH6iM5gt07rcMNzbT9wlnBjBqlvJ2PRQkwjjg7RUqg5wJ9IYKgOYqh7AGC6e4addnHCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8zWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:rLhC+KGn4eMBa819pLqFwJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJp5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF7yfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqA+7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1cwKoVKuZEIMvJ0vFhLA
 BcNrCb2B+QSyLCU5nthBgq/DVrZAVqIv7JeDlYhiXf6UkqoJkw9Tpl+CVYpAZByHt1ceg72w
 yPWJ4Y641mX4sYa7lwC/wGRtbyAmvRQQjUOGbXOlj/ErobUki94qIfzY9Fk91CQqZ4uqcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCG4US72ws9T6pBlsvmkLYCbehGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/rFZxS1wPzVpFOIT0VUdETuNw8R1WSy/i7YrHCp6jearLeNbDtGTErVif2BW
 YCRiH6IIFa4kWiShbD8WzssrPWCznCFL5LYdvnFrIoufkw36V3w3gooEX84N2XIjtftaFzdF
 diIdrc49GGmVU=
X-IronPort-AV: E=Sophos;i="5.96,167,1665460800"; 
   d="scan'208";a="84946054"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DN6rAATPpdYNa/80HUX+NrS+z26ekqC4fVB4nwRcPFNo4qICOY+Mf16d4rUiww4Ii0T+FnhqVtVc7zHmzj5spyOE51YCFsH2K2+xwQPjaLxKxaHI7y6s3ct/vP/BnygxGdx+sPjy0f7WYZWqwV86Cej4aJRmbFZuGOCsn5E+mo1Ssv2ky+fHuXNS8BtxFTrVXFtotCz6g4VNLboT/VIjXt6mdm8bha9N9hc+dD+A9NcPcpgIuxo+Crd0HJ/n2GDZjn4zKBOKAEqBB2QNZ5+s2NIGIsAfYutS7CvUAWx/uUvGEUr0BYe2x2lYvTabvVb38fBJFL5yRIXUsu/gFxWDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvknJ0yAruidXDMf8KU8J9heSHlajwBLWf4Q6KG4qyA=;
 b=N1w7lDvs0nSTb9ir4de2yv3YwS6qikXK0z/geriVb7ZUqLzJNVIf3vk7rSa4mosYtMV66vcVp6b+FJtOtOgTHKA7TiCXqG4+Y6nu+YYDMEyKWidXOnPDLFmO2KEbebPfa8sQ9Kkv+3/uRIdIeQnxzXqSDuqFYB4nkBY58UpoDqfrM5zHGyRRwfCQ2sYXmYCn9WlTqEtk7+GcjDkBgHIqooD89MV/piLJTDXlEEZ7wiI0/3wkgHUkfRbcxzaRpcsatCw1Myto58p6pkcOPbbuE32KCIYX3NVgAlLVhSL8fazVIvtt/MVzLLpUGmqMv5g/feAd30mwJiKSyhPXVWAiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvknJ0yAruidXDMf8KU8J9heSHlajwBLWf4Q6KG4qyA=;
 b=JoTGefVARSoWgzjYkiq/xMK0S7OVBhPvKC8fLHfa/h/vCU9mBdNcA7+RVr2YTmWLaB8S6GN4JVacnT9G35ZI7U3rbGjdHbzFe9vgWCZnVwryiAIj5TNLjOEM+kiV7d0vlhr6cxm3hAVp33z5lpFvKcC/s5PFmMOZkw10FiA1RSg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George
 Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH for-4.17 v2 3/6] tools/include/xen-foreign: Add SPDX
 identifier to generated headers
Thread-Topic: [XEN PATCH for-4.17 v2 3/6] tools/include/xen-foreign: Add SPDX
 identifier to generated headers
Thread-Index: AQHY73rFw2EypUFm0USU279+Ma36zq5BuTuA
Date: Wed, 16 Nov 2022 14:59:59 +0000
Message-ID: <79a61107-6cec-a927-12e8-44b25478bb74@citrix.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
 <20221103115204.49610-4-anthony.perard@citrix.com>
In-Reply-To: <20221103115204.49610-4-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|SJ0PR03MB6551:EE_
x-ms-office365-filtering-correlation-id: 20841b1e-9476-427a-65e7-08dac7e33baa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ufVrztGFUjkER+qrV9pDt++7dRGLGfqTF+wnM2ihyB6WnRK6hH+HeLDhnKcN2uANHPTk7tFRGnR2RGo8fzfk6dxLc5O1GGyJmbC2VLl2pkBxGNcoaHbl8TlsRHT3NlT74kXAbIFC4W8KehoB+RLSCc3ru0DNePXkjv17RvwH2f9rkTCjRzjs4hp1c9xvbNmARwuzsi4KkzkjdeBeEzHHzjqfQ9LU/UyEVfNhtL12i6f+ICvz121l2oi488cNsyGR4ABtxb89JfdrORYuIE+TLeKSwX5ErBth6PbhcRKAQ8bgYbLloD1HaSQ7muB9Ma/++VZrBbSLTRj4Vsox87Qa4vqRwWx24senbOqeLgLkzozRraaxpnijCnvvbAjR7UdvpNBoG1+dP9t+QnY84vAHOvLLoMWGhPr7ZZHkI7N1u8fed/z886iQIxrXr0f0+BVt8TR+oQbJWNAYTCBmFmiNuurJfBYAg6Ayrws3NOyqpjHqxKN7BMOtiVp6pKqO7iwsCcmd1cfwF7dS7b6fk01KH/qclvBYR4kApC1xqoPzLQ5cDOAylyHXHxI89NLrKvwXPbfhLlSvD/gR6cNkM9CgR3d3sWPn5R5Hkvd9zzAli5UNR/v5zW/x8T5Lzh2W/SDWcNfNd3rjKTeCoeOT6DUn0R68SuPHM50AeWWuwcWFVgNQ3zbmQzoTxUJMuw6/CkbexSH8q4yrZT3xoCXhR3FURL7U8PmDTIvagj2EGg5aYOZdXAQkpnc+s/65RSxwyMlXN8+Na5Yos6cTNSiIfjjecdrKkCrDlMk3efyRbpN2/AtSKmZMAONbsUrEWMHbPNFz0/wbdxyGfFeQiJ+utULYPE22Zu70aNkB0sIW5baHX/I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199015)(84970400001)(36756003)(41300700001)(54906003)(8676002)(53546011)(76116006)(91956017)(66556008)(66446008)(4326008)(66476007)(186003)(6486002)(71200400001)(86362001)(2616005)(66946007)(31696002)(478600001)(316002)(110136005)(26005)(6506007)(6512007)(64756008)(82960400001)(38070700005)(31686004)(2906002)(122000001)(8936002)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjE0SWN4WHBLbTV1NHlxNlg4S0VGZlpEM096TDU4cGs0TC9ORnhXVE0vZFd1?=
 =?utf-8?B?S0lEL3NVdEdHQTdsNHFJeUFLYlJBOFkxWXc1NS9McW80algzeUY1WXJ3aDgz?=
 =?utf-8?B?QWYyeWJrRmR2enZPU0UxU3BES01lckxnQzZYSldmQS9ZRUZKU0grSVlNc0hu?=
 =?utf-8?B?L0JzL0x5RUZ2YXJydnlkYzNyWnJGa0ZjYzl1SnhESVNpS2JFVGV5SE11WUd6?=
 =?utf-8?B?NjZqQXpSTnRTVjJoa0krMDI2NGFlSUZ6Y1k5dzVDSkJzWSs3eFZaZWVMcDhW?=
 =?utf-8?B?OWsrR0MvNmg5dkdVbDVIc0hkc2Z1R1g3RmdTSDF6L0Qza3h3bGRDYmRuUXJV?=
 =?utf-8?B?YTkrZGF2Q09TN2dDbm5PWS9YTUgrTUFLMGsvTEJjaDN2UGMrSTBGVCtUWVRz?=
 =?utf-8?B?VDIvb0NBNmhXNllDYzFJNTZXYzJMR2Q5eUx6T1NzcUo3UisyWkJEYWlacS9G?=
 =?utf-8?B?V3UySW4vTlcrdGlSVnBQeHk2eVlUK0lMUUJ0U3VkRy9GdHlVaDh1TDYxdFl2?=
 =?utf-8?B?VW9KRHFsckJ1S3NTVlZIVWNvRnlDNGFlTWhEZWQzbzUydWxMaGloUGpodDRO?=
 =?utf-8?B?MmpKYmtXNlh1VHlVNnFCcDBabHBUdXdPOUtxOU0zYkx5VXNzK3V0dUNlZUJu?=
 =?utf-8?B?bkpha2FyVFBEMG5lM2Z4bFhqeGl6QmorN1duNFVxbzVRNWRiSmlXWEYrVENX?=
 =?utf-8?B?aFNnNlVLWEd0VjRZb1hmTnJyYkFXUEZQTm02azN3Z3ZBUGdFV1R2UmhYdG8x?=
 =?utf-8?B?N3BDNmU0U29EWUtBOFp6c3lIbzd1Y2d0dElkNG5qS21NTk1aOW1QSDVpeFV4?=
 =?utf-8?B?R0tnM0d3L0p5c3VMOHl5Qk9xSGNvbVFDbU9xMHNPSE9QRG14UnErWTJiMWJj?=
 =?utf-8?B?dkFSU2dJWkpRM1BEWUg1V1pLRld3RkJoamhTbTNjWVU5dnBUeFo0Z0d3V25I?=
 =?utf-8?B?cWx3N0dwSW5OdFJxMUlxWmMrc2ZVYVZjc3UxL3RjVHJYME52THcxeThHQVJW?=
 =?utf-8?B?OW1MaFFFZDgvOE9nZnZ0dVUrK2s4NjA3eXZLUytkNG1GMmFseTB0dWRyZ05Q?=
 =?utf-8?B?djBpOTNEdG5YUXVqNDZidnBMN05ndTd5MWFxdTdsS0Q3NjF0eFVBWUc2Nmhn?=
 =?utf-8?B?UGtEM3JsYUxKMSsreC90UGxBb3VnMU1hUVZTWFBnWG5lWjNtL2NwczVwTHAr?=
 =?utf-8?B?bjZQTEtCdHNibGs2VUY4cWdvSjM3bUlKU3pQVmFBalVXQjVKSkpyd3FLcGQ2?=
 =?utf-8?B?bWNpU281T216NS8vRXE1dnVWKzBiTllsYkR6ajZPa0RRdzNJSkJSekJqTFFy?=
 =?utf-8?B?YjBqU2J4aUV6cDFPR3VmZUNjTkVDOVF2UitpT1hoUkhKeE5BL2d1OXdwREpD?=
 =?utf-8?B?WmVFZlhzN25oSm5KSFp3b2ViOVlsWWVuM01LMFZmaTZTWUpjYVhEVjJxQzl6?=
 =?utf-8?B?OENZUS9zbXlaZHV5Y2VqMkFUWUJlNUlrTUdBOEtWUGRxaDV1Qm0zdUc0SzRU?=
 =?utf-8?B?S29ubUVWek54ZkFRdWJybksranZvUGtkRFhvcERjS1dvOTE4M1FHdjM5RVJm?=
 =?utf-8?B?ZUVsa2RnQTJzOTlyMmpGYU1GeTBGZTVwb1FVa1I3a1c1NnprWlJJNXhhMUNu?=
 =?utf-8?B?SkwxTFJNeXJqWmJYbFFuVmx5MjViTmNxNGx5VERzZWowaEkwb3c3V29SQ3U4?=
 =?utf-8?B?UFhySTBkQXNjViszUlM5U0hIWUdCTVMvVE5TWW1UbFFWQUFUNDF5SEdQM1FD?=
 =?utf-8?B?V0djcDYwcW9ZbWxjZ2dRb3dCcFhNdmVsNU52K0dQbjRqeGJxYVEybnpXbzNV?=
 =?utf-8?B?bFZqQWs0YUJucE9xdjJCZUo4N2dlenJ5cmcvamZaS3NaMTNvaGdMY2VHSGFD?=
 =?utf-8?B?aFBIMU1kaVRHOWs4WDZSejg3R2xTZjRscXlxTHpiN0VDaEhRWGY5RFRuazYv?=
 =?utf-8?B?Rnh1RGxBYWFqTGdHQjY0d3dVblVKQWZpemJtU1hkS0k4N0RBckxMTFovYXY3?=
 =?utf-8?B?bWlET1RLZ05WeTZtaEkxcWlIQ3JRKzA4ZVlGREhibytTQUJudGtXTklQNVNz?=
 =?utf-8?B?VmhaYlE5RWZWY2ZuTlEzV2d6MHJyQmtKNkNPT2VXZ2YvVTlHT3lxZGtNMVBy?=
 =?utf-8?Q?TE2C4pai+/z5CrAxeDrl7XZu/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CE78DED7A029147BAE154B08A914EA7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wzSR5vDucf78sTvsDjO4cugIrGCkWwxgsl/v7HJ2EgFyeLFLVw+fuJlOqStPWWbK9VhXjQzPRoCc9wjs6rWMCYgS6rR0r/UFJTglmUTBU4h/ZWKZGjnucxudarGdZzv+y+4DAqtI/SUKF6nOlAc5KezJnDewKpf/BETx+H6ZzU+ZbpM8sKdizoDFgBg0F/rQ63S8729jxOaOur02WOQ8DvcItOrPRYVntAux+SsGs/n5C1f98oFFD/mUVE24ZowpDPjq3aPW3SF0j9g6V+tUQnDl7D5ZUDJ4H4eFF07bXe74PtxJxUxcdvhi2TLFMWlIxVZRqB+0KagWaRhj9fdWHrN1G/D7XNperUqtKHfQeb9rpy0EqS6zEA/Y7cMEBLboI1vm5vHGOC4e42WdD8/A2vtKizZk8HZK7FHmmNcn7C/1IiHI0bMVlzi2ahT9bjS1awsVFm8rXW6vGEG2WVMg5WwQloIvJtJKzBv9MKUg3qc52dAqhQAdZYNj+BLwY519FNi793PuSLPB0Su6bnDz+f0jWX7oCvelXBWWd4GuWdCggfoHyCSQ4i0ZfKg4Kr24Qt/FCeA7C1Kl5bKBoomCkliro8PmG6F4tDR+e1q/5Ly0J3rPaEjw968jR5kzsuHKqFGsX3JnEC+1KyANOZNKlO3bea4AetNvjuaYqmd36KHGBESCxNqawp8pX2H5nv/DhEIcFIHEBG2SNFfXYKlKf7rMc0LuVGfLB/CfkaH0ZhNU7GHzZgSyiZWeztyycoh3d6RBjhAemRhlKaZSS43YPF43GQ3VSl2XobRK5yfeKwLhnxX7ueqEajbnx2A8xLsQaB884sZ5xld7+rZ8jKaT2QrkykP/Cn1Ydcu1q01lyNYzt34ep9p//1s4B2et0jyuHwXJEKUtbmXJ/NeuRuPJbA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20841b1e-9476-427a-65e7-08dac7e33baa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 14:59:59.8248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qeH4lDa8bnnW1eL0XRw0da8heYp0TJ2Ws8PBFfju/TXzxBz13zdAdW/TDNjRm4H5KI5Zgq+XxXnQozLac9vLL/RMxA9EAMfXV1p6SZmJvUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6551

T24gMDMvMTEvMjAyMiAxMTo1MiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IGRpZmYgLS1naXQg
YS90b29scy9pbmNsdWRlL3hlbi1mb3JlaWduL21raGVhZGVyLnB5IGIvdG9vbHMvaW5jbHVkZS94
ZW4tZm9yZWlnbi9ta2hlYWRlci5weQ0KPiBpbmRleCBmYjI2OGYwZGNlLi5lYzhhMzIxMzk1IDEw
MDY0NA0KPiAtLS0gYS90b29scy9pbmNsdWRlL3hlbi1mb3JlaWduL21raGVhZGVyLnB5DQo+ICsr
KyBiL3Rvb2xzL2luY2x1ZGUveGVuLWZvcmVpZ24vbWtoZWFkZXIucHkNCj4gQEAgLTEsNSArMSw2
IEBADQo+ICAjIS91c3IvYmluL3B5dGhvbg0KPiAgDQo+ICtmcm9tIF9fZnV0dXJlX18gaW1wb3J0
IHByaW50X2Z1bmN0aW9uDQo+ICBpbXBvcnQgc3lzLCByZTsNCj4gIGZyb20gc3RydWN0cyBpbXBv
cnQgdW5pb25zLCBzdHJ1Y3RzLCBkZWZpbmVzOw0KPiAgDQo+IEBAIC0xMTQsMjMgKzExNSwzNyBA
QCBpbnB1dCAgPSAiIjsNCj4gIG91dHB1dCA9ICIiOw0KPiAgZmlsZWlkID0gcmUuc3ViKCJbLS5d
IiwgIl8iLCAiX19GT1JFSUdOXyVzX18iICUgb3V0ZmlsZS51cHBlcigpKTsNCj4gIA0KPiAtIyBy
ZWFkIGlucHV0IGhlYWRlciBmaWxlcw0KPiAgZm9yIG5hbWUgaW4gaW5maWxlczoNCj4gICAgICBm
ID0gb3BlbihuYW1lLCAiciIpOw0KPiArICAgICMgQ2hlY2sgdGhlIGxpY2VuY2Ugb2YgdGhlIGlu
cHV0IGZpbGUsIG9ubHkgU1BEWCBpZGVudGlmaWVyIGlzIGFjY2VwdGVkIGJ5DQo+ICsgICAgIyB0
aGlzIHNjcmlwdC4NCj4gKyAgICBsaW5lID0gZi5yZWFkbGluZSgpDQo+ICsgICAgaWYgbm90IGxp
bmUgPT0gIi8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi9cbiI6DQoNCiE9DQoNCj4g
KyAgICAgICAgcHJpbnQoIiVzOiBFcnJvcjogJXMgaXMgbWlzc2luZyBTUERYIGlkZW50aWZpZXIi
ICUgKHN5cy5hcmd2WzBdLCBuYW1lKSwgZmlsZT1zeXMuc3RkZXJyKQ0KDQpJJ3ZlIHJld29ya2Vk
IHRoaXMgYSBsaXR0bGUgdG8gcHJvdmlkZSBtb3JlIGluZm9ybWF0aW9uIGluIHRoZSBjYXNlIHRo
YXQNCnNvbWV0aGluZyBhY3R1YWxseSBnb2VzIHdyb25nLg0KDQp4ZW4uZ2l0L3Rvb2xzL2luY2x1
ZGUveGVuLWZvcmVpZ24kIG1ha2UgYWxsDQpweXRob24zIG1raGVhZGVyLnB5IGFybTMyIGFybTMy
LmgudG1wDQovbG9jYWwveGVuLmdpdC90b29scy9pbmNsdWRlL3hlbi1mb3JlaWduLy4uLy4uLy4u
L3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQovbG9jYWwveGVuLmdpdC90b29scy9pbmNs
dWRlL3hlbi1mb3JlaWduLy4uLy4uLy4uL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaA0KbWtoZWFk
ZXIucHkNCi9sb2NhbC94ZW4uZ2l0L3Rvb2xzL2luY2x1ZGUveGVuLWZvcmVpZ24vLi4vLi4vLi4v
eGVuL2luY2x1ZGUvcHVibGljL3hlbi5oOg0KRXJyb3I6IE1pc3Npbmcgb3IgdW5leHBlY3RlZCBT
UERYIHRhZyAnLyogU1BEWC1MaWNlbnMtSWRlbnRpZmllcjogTUlUICovJw0KTWFrZWZpbGU6Mjk6
IHJlY2lwZSBmb3IgdGFyZ2V0ICdhcm0zMi5oJyBmYWlsZWQNCm1ha2U6ICoqKiBbYXJtMzIuaF0g
RXJyb3IgMQ0KDQp+QW5kcmV3DQo=

