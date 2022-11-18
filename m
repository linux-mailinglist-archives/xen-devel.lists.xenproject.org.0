Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B0A62F4D8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 13:33:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445689.700986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0Ye-0004Hh-PY; Fri, 18 Nov 2022 12:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445689.700986; Fri, 18 Nov 2022 12:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0Ye-0004F1-Ka; Fri, 18 Nov 2022 12:33:24 +0000
Received: by outflank-mailman (input) for mailman id 445689;
 Fri, 18 Nov 2022 12:33:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DmIt=3S=citrix.com=prvs=314707d18=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ow0Yc-0004Er-Bn
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 12:33:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e3a7e09-673d-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 13:33:20 +0100 (CET)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 07:33:02 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by CO6PR03MB6228.namprd03.prod.outlook.com (2603:10b6:5:35c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 12:33:00 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 12:33:00 +0000
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
X-Inumbo-ID: 2e3a7e09-673d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668774800;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zL55OUZT4Sr4OkWMRHz8kqZ0mKqRB9gitDIWm5zUuEI=;
  b=aQMMevKB1BAx0XLcS8m1Kt36aO9jrX+kdn0N7xUZtw8XzTFzmbh5x/Mo
   L/6zI1GKdHgHcExiOVTg523S/TgpIiK+oandGKQsroboyR/QgayseDP21
   3bcv491mcbque6xzm2cLEKb2QIVAi6y7iJOQ6HwG5kZF9w5nmyTUEdDeK
   U=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 87651584
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dskmgap76krcykSpT184FB3EtTteBmIoZBIvgKrLsJaIsI4StFCzt
 garIBnTa/qCY2Gkco9wb4qwoU8Av8OBz4MwSwY++CxkECtG+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzilNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGspQRDSvruw+bKmcM41qMkaffb7I7pK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKPEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXoqaA32QDDmgT/DjUmT3jimdzi1HWCQslEK
 GIPoDIEtbc9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSy2ETgYKykFfyBsZRMM/t3LsIw1yBXVQb5e/LWdi9T0HXT6x
 W+MpS1n37EL15dTjeO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComXPlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:2Cb2B6FyAVNG4blzpLqFwJLXdLJyesId70hD6qkvc3Fom52j/f
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
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="87651584"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlf0CX2djrbbYInKr2uS/VolwbkKcSAbI9OXEBgCbqhMS2TMV717P5dZlChLhZyB7VlWb/K7OEc/rpslkCVVtQAVofNnWHkoZS52AkG/RHQpwc9m76+RFena05VxzyE92SM9bWwY4VhY3reeUqivo8hsEp508f/BSKbzZVi9Wjbj9BBi6pjpM2raMg7q4vUTcRZTKqvgNN1OU1cbmF1WT1p/pPcvbY84p8TZGz+KzHXpMZRrpct1891xaratRSaUTbJtgeJcSAHsTO8W7622niCJ70xYSABt8ElWaTkp9YAtCP7o6mJy7xOgnD3tvkoAVI9caYJxicifWl0hglHlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zL55OUZT4Sr4OkWMRHz8kqZ0mKqRB9gitDIWm5zUuEI=;
 b=lJE3gOXpQ39M5bKUl7/3zUoCmhhoMyz1+Poi45YfCBVShUZoJc0tCqDntsNQHNxQSw5hMVi61RrXWvpHi7RTtdOiCSx5/ZzqV9Uw78ZcdH9avJPMebbcOyoNRwH0dDt+Uca4F2aIdjNMHg1CRUgpG3pgkheaCsafh3U6YDkyu19qubcHhLD2yray+BNsLknAx75OyAFL6GAjZamNyXbE3mv6i5RLcRwXZtjBgYf7laVmII09VyBgCXCBnBMTm3s7kA2LJzAw+BU2wSuxM8N9ndD31hvkE9KbeDkYM51JXIwjmTWc8rtUg64lkR+JLzU19lrV+MsFJzYmJ7hdjB3qIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL55OUZT4Sr4OkWMRHz8kqZ0mKqRB9gitDIWm5zUuEI=;
 b=WoZwLN4Do9x2/UEOKCUeMVk2W5uDGi4IxTMJfgFKEb1aeuNzDHMfjZxpHc0NuwlMeqaJV+xoy1XwJ6coRZ9/Eel+V9y7MQ2mS48MDStqTRRFisa8luCDlcjKFYkJfEZtnkPXeykePG5zpYi0EAgcyyQJyz2LeNMJACPP+Krjt9o=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Thread-Topic: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Thread-Index: AQHY+zjv47cM7GZ23kWVhiI/91aGOa5EnVaA
Date: Fri, 18 Nov 2022 12:33:00 +0000
Message-ID: <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
In-Reply-To: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|CO6PR03MB6228:EE_
x-ms-office365-filtering-correlation-id: 0e3b0f27-8d98-40c3-f739-08dac961079b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 abBK+S9ukSgxXJIRHbpk9jO+7r9GUw0Q+9dCb6FJabxoK8SOE53tmeJNtZdu0tzbPT8MFpOKmppS8cvVe7rNOsxFroeczA1FBbRSerCU/pu1cuVhMAehr9vtnQViZvrlgk9hOfAXwYGiGZDl1P+uht7bnwlmhGDd87HQGAT2gjovJHnYOtPkQHzLAfly+wyl/xpbkIsYI63I5PK0mixbR5I0gsYJq1JpZ48Rfjqq1aSQS67RPiEampth3CcpXG+u8T0YeITxVCvYVGDwn8ZqFigYUag8y2eH9HOnQRay+TDn6Mdv+MZHuw1GMyZ6fTYj6XzwJqWJm7WKzVzR07VGb1F0kpjFFv41Q4WTyL5VDLtRaMOIkmQp/BsZW3RL6t9HPeOBevIvlaSPzzEoZUTnSXwiIxRr+6HHWJopwJBPwhu8sjRN1oDUZLfeg+PVCy1/sR2JGrpX5YIBeeUHs2+MBOi0MZAAV2PlzEXLNhvrdUOdjVNe3+Ab2lMhPAVgG5pip60hC5zZ+bdFvDrWdn5LA128XHJkZDmRdiv7Blpj7jx05a9DBgfxGO7qzExWN4BMbSk/Pgt3iYXg6KtSc66uxutEGMijj8LNy9ZTTDuW4aB5bPEaQbWGRY2pK7SI1poscaZMZeLNPuo3a2jDSyx2rjfpt7FiQjZ1boyS5F3ymns/zRuiLT59PEk5LqHbrg4vQbs6d2ktBpvlJ9qy5MUnRjBnwxxQ6I2lvUe1eYMPBesSDD1ZbOk+3a53XkpHqqCI5VaKuflidueBiDXR+zNqyg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199015)(71200400001)(478600001)(31686004)(6486002)(8676002)(26005)(66476007)(8936002)(4326008)(66946007)(64756008)(36756003)(66446008)(66556008)(76116006)(6512007)(91956017)(186003)(5660300002)(110136005)(53546011)(6506007)(316002)(54906003)(2616005)(2906002)(83380400001)(82960400001)(86362001)(31696002)(122000001)(38070700005)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SkRDSkN5LzRNK0NraGswVzNxbWxLajhYYkZwTU9IQTB6bk0xN1JpTHl5bVk5?=
 =?utf-8?B?dmtzdWcyRVRzbFRzaWlQZlJBWFdBRVZjQjFqSEg5emFXZUZCRnI1UDE0SDk3?=
 =?utf-8?B?NGErc3NzSW1KOTJHdHh5QVh1YmZJcm91WUppaU5UemhraWJROWd1UUx1enhR?=
 =?utf-8?B?Y1RxWXpkYnhBS1JLeWR2QUJZTnNsMmJjZGxwVU9hT3FaUWFmV1h4eFJtbUZF?=
 =?utf-8?B?Tkt2eFpZOE5BMC96cFlMZDVicmVaazNZMkh2emF3QTRBNW9hS1NHWTNrNkVv?=
 =?utf-8?B?Z1A5RExnM01KWVl5anEyZ3JHaVdqOVlSSW9xWlNMdmpZMjU2VlptRFp0U2pE?=
 =?utf-8?B?eEpibHVmcTBRYXhQQUhrQjNtaVlMVmxuRERkRUl6M0ZXeVE1a2RUR0JZQjcr?=
 =?utf-8?B?QmRsSnhsWURSZnJTTkJGeVdGYWtxeHZEVjk2RURXbm5xdEJ5bWlFcllZTWtB?=
 =?utf-8?B?a3pjMm1Md1JVVWswa2h4REdtejlReC9sZFBPZzg2UkZQRFMzMERmR1JuNDdE?=
 =?utf-8?B?L3lVNUNuQjFFN1NSMnUzMlpmSjJsY1lkRXBJb0hmMlhsL2ZEZm9rSVd0VnpE?=
 =?utf-8?B?djBJbU0rNjFmQkMxNkJEY2MxUFM5UnJtbkYxSHJPamJVU2tvZmFxelNKeFlO?=
 =?utf-8?B?eHROOTQyaVppSkh3WW9yYVBvdkxsc05BUjg1SWdnWVJ1VllOWU5uNlBGSzFl?=
 =?utf-8?B?VWFWbVVZNCtrdDFRL0RQQU5xV3NscmppVFRndTN5YzkxOE1ycjM1Z0plMGx3?=
 =?utf-8?B?eDNER0g3Tlh2QURGd2FHV0MvZnNla3Nkc25lb3ZiNkNMRkFPcHhWek9CdXNS?=
 =?utf-8?B?WStOS3p1b3p6aHZMZERHS1BzK0xPekxxQW5HaVpyL0RiWTJ0T05vL3Z3TW1m?=
 =?utf-8?B?amhhOVNkVS9DSXVTMUF3V0dIZU9sdEZSZ0RZSWtnR3M5N0psYVFETWF0R3lM?=
 =?utf-8?B?YjNBWW1zNUR0RGdySnc2WFQ3VEhhRGIxbmV2aGE1eFpvT0x5QXJqdUZOTnFj?=
 =?utf-8?B?Y2p6cGk3NWNqUnZVNU9aRy9HNGxXek9OOVFzM1Q0ajFoOHZyd2ZhTDJFdDhK?=
 =?utf-8?B?VktrRS8vYWptWjZ2S3N0cWMvdnlCTU1yRXFCaFpXRzlFZ1ZlL3VtWnFkd0F4?=
 =?utf-8?B?TXVLeW9FSFphemRFT1QyREZ3d3VucjJ5cURjUEs2S3FsVW5ZYXh5aXNKa0ZY?=
 =?utf-8?B?dHBhRlJrZi8xVVBSY3BPT0lPTit5VGlQejNLZGgvOTdOZlk1anBWUkdBVFRv?=
 =?utf-8?B?dXE5MzdFbVVGeU1kOFoyU0htWHd0ay9nMm43aWU3NC90QmhwS3UzbzVsbndW?=
 =?utf-8?B?THhqWlZ1aUw1dTJMM25vWVlnMmtKUVgrcWN5RmhCNFpHRVVqMGFGeU4vYjF0?=
 =?utf-8?B?eTJ6c0ptL1hPRnB4U1dYNHplWWtScmtTYTFBUHA5UmQ1WVE3Wk9vaTFqNWNN?=
 =?utf-8?B?R2dtNFdtSWFmQU1acFdhbEl5dVNTYy91Q0tUNkZleXNVQlBjNUp6MitUUVFG?=
 =?utf-8?B?SFdvR3R1ZStyQ1VocnRNNTZQMGdCRG03NEFrcE5KMVJCMzRRMVRPc0gyNmx1?=
 =?utf-8?B?ZklYZUtSNzJ2Mll3cWdjaS96dytiUkZ4cVJHMXlMSHdBdFJVZ0xtM3llUTI1?=
 =?utf-8?B?bTdkVURKZG9CaERhaGxoY08yYzRpQTFJU1Y0UkZTZGJ6bzFVVnhBeU9BU2dT?=
 =?utf-8?B?b25wZkdvcjM4LytpRGlrNVlWVmk0bUZHa2RsYlpHekVKTVBLMUYxTDJXU3NL?=
 =?utf-8?B?dUQwOEtsaXkvK3JkK0UvQ2VZbTRLSkROL2lLbFZwRE5XMGxpWmdFQzdHY1ZO?=
 =?utf-8?B?dzVwQk8rQjJRMzFqSXVXMUJZb2llOFkzYlZvNWo5UjJYS3dYNk1RL1NSeDJU?=
 =?utf-8?B?NFVjdzBWN1NucEdyRHQvb2tFYWdVWU5UNTlaeGhKb3QxemFBQTE5TFVHSUN4?=
 =?utf-8?B?RFdQSk50RVppR0NIOUx1K3NzWmtGUFhxQlZ5d3ZwQjJ1Y3JEb2lTOHBTcHR6?=
 =?utf-8?B?N2ZTQnh2dzBNY29WSHAwTnBZN2tseHVWTmRha3Vzd3QvT1NHN3VpK0xJS1lN?=
 =?utf-8?B?YmRRVlZ2dHhDM0tvRG8vN1FLbjdnbm5mYkM2TjFPNDVmdTJQNTdBODUxVjJy?=
 =?utf-8?Q?8yGFIStdtRJS3hpcOJRmWIte5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64093F0D7C283C44AE97534053BF191D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/Lf7U4EeO70lQr/eETPF43BLw3c1IttMKXsXFd9PrTtUmco+4x0rXgFLxGliJTRNJmyrQ6SvPTRl3jMTgA7YpHWey7NsywFn1mTrBYXOtVWXeyCGx+QAUCsa3ALKgz9TNulqXuIr7XtAOuvSl4q3gGCIhCmMG+I8OiF26K/+S88k7NS6XIDtzP2nTYwcDLoGbgNtxdJoZwH8RauHtekgp1qewhafngA2rjN6wGstPxKmffbQm7HWCQSJhyknaGuAjdEecxTBBx0EW/zEyXreeLEUapGbrzvu0gSbUt5LES8+rUDg92zG/840p52GnU8WGALK6XmCIWUfrj+Ej2yESrGb8UolxVD7ZArT3nHQGXHchMInDN929+O9S+Qj1+Va0ndD4Q7ldL9VYEFQTLeNoPNq0Y367mxfqKm2Cz45Y8uD67xBq0KFIEuh/fMDd/CzuG1PQ3vjcK02AqQpluQ75GXrEdHATzGLW9nUXr6QjTAR8dYwfagVOueyhYb0S4vTSbzCvZrlMfabQLmeGemKECYhO1FDItjg81fHJppa3KRC2md/VZ76pKUe5UgrEJBAiBsTfljKFKgNkUJ+cPEMdg9j1rAdX/TKCKhWekkum1/WxTckDp1g5NEnle/CAknogatGsKV7cfUj7cR+foZVNRnEZaYeS8OPQihscDfBpTIbbFLZCPlaA/3Y9vr9wvyS6AslOJdjNbgGJlqV+wuWrHGxY7C3J2dv8ToYH4z324YoShJ/M5mesG8t3QRZGCrorsOF9tswgfhtUFJhSGd14P8TvAYhw1Z17xzOPs9/V1FVX9Z0ZeizRUJPezu70NHBgvNePpyV7Qmv2taPGfHDML5t4zzZZLp8H4SLoL0k8u8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3b0f27-8d98-40c3-f739-08dac961079b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 12:33:00.2394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JanA6pzShuOc0IJ5X4sdmKpzdU98EgclQzAmlO6Xsrv+JKFDgutg59yeDAE+E4rwzF4aD/20TKxceyzRZNjDmmZVOpNPjIZPWYuT2BiufG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6228

T24gMTgvMTEvMjAyMiAxMDozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IExpbnV4J2VzIHJlbGF0
aXZlbHkgbmV3IHVzZSBvZiBIVk1PUF9zZXRfZXZ0Y2huX3VwY2FsbF92ZWN0b3IgaGFzDQo+IGV4
cG9zZWQgYSBwcm9ibGVtIHdpdGggdGhlIG1hcmtpbmcgb2YgdGhlIHJlc3BlY3RpdmUgdmVjdG9y
IGFzDQo+IHBlbmRpbmc6IEZvciBxdWl0ZSBzb21lIHRpbWUgTGludXggaGFzIGJlZW4gY2hlY2tp
bmcgd2hldGhlciBhbnkgc3RhbGUNCj4gSVNSIG9yIElSUiBiaXRzIHdvdWxkIHN0aWxsIGJlIHNl
dCB3aGlsZSBwcmVwYXJpbmcgdGhlIExBUElDIGZvciB1c2UuDQo+IFRoaXMgY2hlY2sgaXMgbm93
IHRyaWdnZXJpbmcgb24gdGhlIHVwY2FsbCB2ZWN0b3IsIGFzIHRoZSByZWdpc3RyYXRpb24sDQo+
IGF0IGxlYXN0IGZvciBBUHMsIGhhcHBlbnMgYmVmb3JlIHRoZSBMQVBJQyBpcyBhY3R1YWxseSBl
bmFibGVkLg0KPg0KPiBJbiBzb2Z0d2FyZS1kaXNhYmxlZCBzdGF0ZSBhbiBMQVBJQyB3b3VsZCBu
b3QgYWNjZXB0IGFueSBpbnRlcnJ1cHQNCj4gcmVxdWVzdHMgYW5kIGhlbmNlIG5vIElSUiBiaXQg
d291bGQgbmV3bHkgYmVjb21lIHNldCB3aGlsZSBpbiB0aGlzDQo+IHN0YXRlLiBBcyBhIHJlc3Vs
dCBpdCBpcyBhbHNvIHdyb25nIGZvciB1cyB0byBtYXJrIHRoZSB1cGNhbGwgdmVjdG9yIGFzDQo+
IGhhdmluZyBhIHBlbmRpbmcgcmVxdWVzdCB3aGVuIHRoZSB2TEFQSUMgaXMgaW4gdGhpcyBzdGF0
ZS4NCg0KSSBhZ3JlZSB3aXRoIHRoaXMuDQoNCj4gVG8gY29tcGVuc2F0ZSBmb3IgdGhlICJlbmFi
bGVkIiBjaGVjayBhZGRlZCB0byB0aGUgYXNzZXJ0aW9uIGxvZ2ljLCBhZGQNCj4gbG9naWMgdG8g
KGNvbmRpdGlvbmFsbHkpIG1hcmsgdGhlIHVwY2FsbCB2ZWN0b3IgYXMgaGF2aW5nIGEgcmVxdWVz
dA0KPiBwZW5kaW5nIGF0IHRoZSB0aW1lIHRoZSBMQVBJQyBpcyBiZWluZyBzb2Z0d2FyZS1lbmFi
bGVkIGJ5IHRoZSBndWVzdC4NCg0KQnV0IHRoaXMsIEkgZG9uJ3QgdGhpbmsgaXMgYXBwcm9wcmlh
dGUuDQoNClRoZSBwb2ludCBvZiByYWlzaW5nIG9uIGVuYWJsZSBpcyBhbGxlZ2VkbHkgdG8gd29y
ayBhcm91bmQgc2V0dXAgcmFjZQ0KY29uZGl0aW9ucy7CoCBJJ20gdW5jb252aW5jZWQgYnkgdGhp
cyByZWFzb25pbmcsIGJ1dCBpdCBpcyB3aGF0IGl0IGlzLA0KYW5kIHRoZSBzdGF0ZWQgYmVoYXZp
b3VyIGlzIHRvIHJhaXNlIHRoZXJlIGFuZCB0aGVuLg0KDQpJZiBhIGd1ZXN0IGVuYWJsZXMgZXZ0
Y2huIHdoaWxlIHRoZSBMQVBJQyBpcyBkaXNhYmxlZCwgdGhlbiB0aGUNCmludGVycnVwdCBpcyBs
b3N0LsKgIExpa2UgZXZlcnkgb3RoZXIgaW50ZXJydXB0IGluIGFuIHg4NiBzeXN0ZW0uDQoNCkkg
ZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55IGNyZWRpYmxlIHdheSBhIGd1ZXN0IGtlcm5lbCBhdXRo
b3IgY2FuIGV4cGVjdA0KdGhlIHdlaXJkIGV2dGNobiBlZGdlY2FzZSB0byB3YWl0IGZvciBhbiBh
cmJpdHJhcnkgcG9pbnQgaW4gdGhlIGZ1dHVyZSwNCmFuZCBpdCdzIGEgY29ybmVyIGNhc2UgdGhh
dCBJIHRoaW5rIGlzIHdvcnRoIG5vdCBrZWVwaW5nLg0KDQp+QW5kcmV3DQo=

