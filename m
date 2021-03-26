Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B4934AB79
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 16:28:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101921.195266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPoNV-0005TD-7q; Fri, 26 Mar 2021 15:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101921.195266; Fri, 26 Mar 2021 15:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPoNV-0005So-4B; Fri, 26 Mar 2021 15:28:01 +0000
Received: by outflank-mailman (input) for mailman id 101921;
 Fri, 26 Mar 2021 15:27:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPoNT-0005Sj-NF
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 15:27:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e64e8e1c-eba7-476b-b6fc-5cbe8767deb4;
 Fri, 26 Mar 2021 15:27:58 +0000 (UTC)
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
X-Inumbo-ID: e64e8e1c-eba7-476b-b6fc-5cbe8767deb4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616772478;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ewnmhvDM0TM5SXoUyR7l/ilRiMA62iJdak9FiCVkuQA=;
  b=Tyfm3G4LajLiLAUIxzXFAVOnCp52HWnCfg9ftNYd95GSKwUPRYaK/wLI
   352uvqJhOt9oIeTBF9GT1dmxOnftApw2pJ1iU2CmPXqCucPcxc6a2aUcB
   TKdhj6g5zyFfKQ1k/bCIgO+uUFyf0Fv6kr/qv/h9UAJb1Svf7eHyhDA7P
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xovhcyLK/NMoVKvDpZJ1x+1FcSWz38lbZIcRpdl541zPSSc1WON7zjHkylzIZuEKIFzrr909P4
 MTGDeveOGimTj02ucwOMs8IygHxm46bIP/IhI6k71dli4otDWEY6KkcBrLTIXZ3Fy+NBompiOo
 TN7I3EVOFLFlnw10LJAwVIodXmVq96CIbuabFjZQ6nbOIoVxY5uRN3oje4el2Bf61OqyYKgi9C
 57WPazUv2jYYqQ4S4amNS76ZyTTb68Ea86n+nHR75YngVSQvajNYa3CnlpEeJdE/b/E3ipW/Nz
 T+E=
X-SBRS: 5.2
X-MesageID: 40211189
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vcf8taipoXgQpduTnpIj095z5HBQX0tw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyycFVB7QxQDIJI/Go
 aV6MYvnUvdRV08aMOnCn4ZG9XZr9rQm578JTIADRgr6A6B5AnYlYLSOR6ewxsYTndz0a4vmF
 K16TDRy4eCl7WAyhHa33LO9Jg+orXc4/ZKGcDksLltFhzCkQCtDb4RPIGqnDdwm+237UZvrd
 +kmWZaA+1Wy1f8Ol64ugHs3Q6I6kdf11bHxUWDiXXu5ezVLQhKbfZpvo5SfhvH50dIhrgVu8
 gqrgHpxaZ/Nh/OkD/w4NLFTXhR5y6JiEEvjPIJiDhnWZYeAYUh3LA3xl9fE5sLAUvBmeIaOd
 RpZfusgcp+TUmXdDTwsGVp3bWXLwwONybDaE0DtsuJ6iNRjXB0wmAJrfZv4EsoxdYTTYJJ6P
 /DNbktvLZSTtUOZaY4P+sZR9CrY1a9DC7kASa3GxDKBasHM3XCp9re56g03vijfNgtwIEpkJ
 rMfVtEvQcJCg7TIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euGTGfSXg1+vHQ4sk3M4n+Yb
 KeKZhWC/jsIS/FAoBSxTDzXJFUND03TNAVgNAmQFiDy/i7ZLHCh6j+SrL+NbDtGTErVifUGX
 0YRgX+I81G8wSFQXn9rB/NW278W0D28J5qeZKqvNQ7+cwoDMlhowIVgVO26oWgMjtZqJE7e0
 N4PffGn8qA1CuL1FeNy18sFgtWD05T7rmleWhNvxU2P0T9dqtGn92efGtVzUaWPxMXdbKSLC
 dv43BMvY6nJZ2Zwi4vT/i9NHiBsncVrHWWC7ARh7OE/sWgXp8jFJ4pVOhQGGzwZlNIsDcvjF
 0GRB4PR0fZGD+ro76iloYoCObWcMQ5phyqL85SoXf2rl6duskre3seU1eVII6qqDdrYwARqk
 x68qcZjrbFsy2oM3EDjOMxN0AJVH6aG4tcDAOOZJxdn5fifA0YdxbPuRWqzzUIPkb6/UQbgW
 LsaQmZY+vCDFZmtndE6ary619vemKBf0V/V2BiveRGZBf7k0c29dXOSru40mOXZFdH+O0bPT
 3fSRY5Iw9lxbmMpVaosQfHMU9j6oQlP+TbArhmTqra3Wm1LpaU0YscGeVPwZpjPNfyk+MCXO
 6FYTWJJDfgB+5B4X3Tml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NAgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso7I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmArhD3I1
 +R7ml0+OrERTKK0dcheukNCFUTTEg383J5+uyeM6XWFQWxbulGuH63KGW0frMYaK+LH9wr31
 xHyuDNu++cbCzj3g/M+RN9P6JV6m6iBfqIPzjkI58/z/WKfXKWgqWr58avjDD4DRuDAn5o+r
 FtRAg3dcRMij4rkYst9DO9I5aH5H4Yrw==
X-IronPort-AV: E=Sophos;i="5.81,280,1610427600"; 
   d="scan'208";a="40211189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNiUm/1oD+n0HdWzEjcJ3KLANbSbVf7d0ql/1eYkHr206Dz1DHRj7oRimItGB2GVO44jgVz8k2RhEAlY2AO2vXSaZQERB1HkaWeZP9wrJ06TTR6TafI8lk3wThL5/aV4xD+gYtrjytJWz7R/G5v0xVY4YTj1lstBU+PkhCg8mKKQnUEetjYQm+XuLJpQkB6+sdlGQbLYfmWl/IwVfD5lRqGdPOv4RMjc2xUv4MfJ1OBBPq+Bl+su4g0HZHNISJkHfCGm0xhPf6PXX6Cfm+UR8QisREBkI7KeqHN/zCd5c/Jtgo3Y0+/dB307Vl0Ls38jK2uiJF9r9qkOKc0WEASHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Tf1Vq2Gf57OlG0dMq+RGZP6gLPG7kR1gClMVEZ2XDg=;
 b=gu35CACfvyw2RVYoQUT2KycgNa/0XW/1m5zbWgBArHTrfele23sgwOwZ6EmI5aDFCtfCjEOX4jXnvLOxB0awVg15JAm0tSZMrkMOHr/GaRocm2cG3MG4TkHpL+Hpak+MtyIwfe5rgs6hCLEuN/G7ereZLru0NjaGtnq2irsr9pb58in2ss22Fy/Zp/IFU1ifGiBP0Ytf8G+7rTl1SPCUOo3ZP8RSVw3XNHxteqPSvtnG5ze9HQWXSRFRWD+S0ltTSAN86C5SBZKH80YO3b9YrhSNwQqAl/BYxpgvNGz5+xMUJlUjUfJ7dWWf/6CUdNN8AH8u/EmIVBRJHgyUPxpBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Tf1Vq2Gf57OlG0dMq+RGZP6gLPG7kR1gClMVEZ2XDg=;
 b=NQY1hjX9qLCBklzRORcHHMoTyRKhqa6oqUkuSJTMSKuk+Z4GhGCUcWTu2fqMIw/3Y5jQHT7f+VJNRll0izLr0EBHW7XOIFoq9is55aKkWThWOaVtlhBf7RKgxLJmoMuBpt5+/gV7tn7PVVDwRh2PsyDRMkWjJsjed7V1moJbsDg=
Subject: Re: [PATCH 1/2] tools: Drop gettext as a build dependency
To: <xen-devel@lists.xenproject.org>
References: <20210326134558.7751-1-andrew.cooper3@citrix.com>
 <20210326134558.7751-2-andrew.cooper3@citrix.com>
 <24669.60327.951693.886187@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7a907fdc-bc8a-7088-8331-e4c1b87c4701@citrix.com>
Date: Fri, 26 Mar 2021 15:27:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <24669.60327.951693.886187@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::18) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deb552c3-a12f-4b28-b112-08d8f06bb876
X-MS-TrafficTypeDiagnostic: BN7PR03MB3875:
X-Microsoft-Antispam-PRVS: <BN7PR03MB387540F63AF4DAA92C39E565BA619@BN7PR03MB3875.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DgYpqVDjlkhvk3BgMXtjMQt0zpS5X4KEm1nLEx0WCbbH2D/uRSsCk8hHFtHmqDSM+BJadbv4Eg+GYzqFeA96dGnM2Yz/aQVgwoLYWg9ILcK/AGrSOLfYsDvGHBRL8UUeM81Uzlh/yxQ0+wjRwwlVrcWuIgrjtQJcaFWv1UvQDsgCtaWZIQJi0THZtHMMpbK1yOqxQwuETChRYcxBaOYzTplHtU9w05DR9UFoM63Hx9ZoITEsVHKmFQOYQiV5jNRSjsSSTOZMazkOUFMsaaOvP1F0Y+w3uNzIAuNJWRcdlSfSE0c/DGdk6l7CP3Ao4I7opcHd0zOwzK7UmNT6ej8g+tAn+AUtShEF//CbENMhV3jlMUgFxHld33IVZYyqxS7lWBQ1OKN/iBvwlro861ih1RJ99/HHtZKRlLIMF5OQSJZdQwKwguzb4UvJNeU5YIP2T+oSPtcHgH2O5A1td+U22BzLdvNM1Fu9kUh6uekFIe/5BxGNl7Rk2St428HTPr32u0SNWhyB39GOPTF0UW8vAULyyqyonHALgYkZctg0mQS9T8nZrvY+i8WWBlgGQRHlrFn2RxACBOy7kWWAV14sHwwc1S/MZO65iNzIKkB3AxiZw1cpgU+g1kHwt1yqphdE54L5Wm4JhkNvLjFNs1EqLBK3pFi687CBAI/h1SPbYiYY1KdJQIE/XcXdRlyI1YwRrTNRuh4Y6tfrDOOZwctHH57llIYO5j8zgnKAi25mJxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(31696002)(6916009)(36756003)(16576012)(38100700001)(478600001)(8676002)(86362001)(316002)(8936002)(53546011)(16526019)(31686004)(66946007)(186003)(6486002)(26005)(2616005)(5660300002)(2906002)(66556008)(956004)(66476007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UHRKcm5Ub0R6eFoxZWtvREpGUk5makVkUGhjVVBVb1FkZDR0cHBWL2tnMzYv?=
 =?utf-8?B?aG90RzhUaStZVmpDdU1zZzRETTRCMWpFcldDSXRtaTV6VzNHMitJeS9OaVg2?=
 =?utf-8?B?c1VBcGh2SDZPbjlwQStERHgwOEM2dlN6L0ZCN0VEYS92YVppVUI4VjI4dTN6?=
 =?utf-8?B?aS9SUUdmSTdOR29uWWVHclJNS2p2MHdiUWxVRHljb21uZENDNk1XUVMvUTVp?=
 =?utf-8?B?dXZ0WjZZVDZBZmVsSGhXNUpWVGoyRm1SS1AyTzgyTkxCQnhSVExMcEo1bDJJ?=
 =?utf-8?B?YXNOaUtWUlBJSEpKWkQ3NFl3dnoyajl5WTdDOTZ0UmV1THA1Mlc4cWNhSXc0?=
 =?utf-8?B?enB2SjZTMDRPYnEvNi8wd0lsWTg0VEdHNDhodUcvRkFDcTZ6THVzNmZFSUl1?=
 =?utf-8?B?elR6c1F0WkgrYnEzendjbWJVSHhSL1hnRHJ4OVBmTFVwTEpYVHFSMmtDNEth?=
 =?utf-8?B?S0d4aHNwUTJJZWtXMHU2bjdzLzVGNkNsU3NHRGNBR3d4bHhlL3IrajVYaUFK?=
 =?utf-8?B?aEptK1lwTjBRd290bXFzS2o4anJwY05FZENzMktIYm5CbHJLQ0JFSzJIem9m?=
 =?utf-8?B?em9FWVBsM1hUYmdOakRNZXNaSlBsTWo2eGF5NE1LQ0dCdDZsb0U2Wnh1c3Vq?=
 =?utf-8?B?dm53d1V4OGorb1pnaW93OWNFYnJHMDExZThhM01zb0tiQUF4WkprS3gxMFlT?=
 =?utf-8?B?dnFKRmNnL1I2NXBqUjQxVzF6QWRJZFNsMHdtQ1pBdllFMmFxUVZacFBTOWts?=
 =?utf-8?B?SzhjMEZOWlp4cXU4cmxGS281T1RSd2pIb3JmS2R0MHFCMTBHVHViS2llRzY4?=
 =?utf-8?B?N0VFRG01TXp5ZE1uMVJWSzFVT2hJTWlEZXI1STFiamRSQVFZS0tlOTBuNU9P?=
 =?utf-8?B?M3lXZkVIVzBabWQ5dG5ESHVNc3k2V05wUElaQ2R4UVUzakJHTk5SdXA3aUpH?=
 =?utf-8?B?YUlVcHN2a0lGKzVLY2MxVUpWZFpaOVl1UDI2QnhhUmtObG0rUGU2UnYzaS9k?=
 =?utf-8?B?dlpMVmhuR21LclgwbmxvWllmdVZGVVJwaGg4N1BETG5taFg1ZThLTVdJcTh4?=
 =?utf-8?B?bEg2TjNOT0h4c3FTK1FSMWVxc05mMlJ1ZlM0RDlUdm5tVVdpeUNRanprZGhZ?=
 =?utf-8?B?ZndySjNmNWdLZDZWcElSR2VNaFc2Z1l2UGJna2NDdmxUTHV1S00zR0VmbVB2?=
 =?utf-8?B?a3FWZnN4QmFCSHREcGtpeTBBL24yMHB6Wit1cThvUmZJaHdvYTFqSmwySjVM?=
 =?utf-8?B?ZDM0ZlBwUGVqbmIxV0F0SHNiNnFNRzlTdksvWm94TERuU0dIVWpsS1dBMkYz?=
 =?utf-8?B?MHVZVzFETkYxS2w5SzJxZlpZTWhOZlV6NGRVMGE0SGRhOWFqRzdYa2Izcjd0?=
 =?utf-8?B?QkdJdmg3UXRnMVB1L3kxNWRKcmwreExqcUxJeWF0dnJNOFZLMCtYNmFQcXBN?=
 =?utf-8?B?N3JyT3dJK0lYaDI1YkUvc2NXYmhzNnZMNTNDWFBkYW4zdFE5RWEvZ00yWWU4?=
 =?utf-8?B?MThPbzVwdTA1UGl0VWUvU0J1d3paUE5tTEhiQmY3L2tLS2FBYjNOZThkcjA1?=
 =?utf-8?B?ek5IWXlQaXY5TEZzclhyVmVJaVR0aVdEOGk2cmlDL2NIV1hteGN1ZFhPVVkr?=
 =?utf-8?B?VDZZQ09GNE81R2RxVEZVTFo2clkvQlRDbWNRRDZkN0hRdy9JZGZZWmM2YXFR?=
 =?utf-8?B?ZVZZY0RaV3AxSm5jUkFaTkpNNDlGZlVTNzB1am1Ec0xwTGhFNk1EYWtyYTNj?=
 =?utf-8?Q?nMIPR562Il+Xz7cTaWg7bCKfhOipd+XcpdjKZxL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deb552c3-a12f-4b28-b112-08d8f06bb876
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 15:27:52.1827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9T3ZGV9eHPmyCRB32swDwpTtRFYGBxR1WBo4DPat/lBtSwwWIglNMKUfq0BlS3c/TvfujyJLIcUeT6Sa9ZYkxM4+UueALad1SSPY/vrqKo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3875
X-OriginatorOrg: citrix.com

On 26/03/2021 14:11, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH 1/2] tools: Drop gettext as a build dependency"):
>> It has not been a dependency since at least 4.13.  Remove its mandatory check
>> from ./configure.
>>
>> Annotate the dependency in the CI dockerfiles which are used for 4.14 or
>> older.  Drop the dependency from Alpine and Ubuntu Focal which are new
>> containers in 4.15, as well as dropping from CirrusCI and TravisCI.
> Thank you but I'm afraid I think that this is not an important bugfix
> for 4.15.  So I am withholding my release ack for this patch.
>
> Feel free to explain to me why this is the wrong decision.

The bug is configure rejecting a correct build environment.

The reason why this is important for 4.15 was discussed.  Shrinking the
Alpine and Focal containers (several MB in both cases) makes a material
impact on Gitlab CI efficiency, and therefore the turnaround time for
answers, but cannot be done if 4.15 gets out of the door with the
erroneous check still in place.

~Andrew

